(library (nmosh ext dispatch-c)
        (export import-dispatch-c)
        (import (nmosh)
                (srfi :8)
                (srfi :48)
                (mosh process)
                (only (mosh) host-os)
                (nmosh pathutils)
                (nmosh cacheutils)
                (nmosh ffi providers simple))


(define (ext-name)
  (case (string->symbol (host-os))
    ((darwin) "dyld")
    ((linux bsd) "so")
    ((cygwin) "dll")
    ;((win32) "nplg") ;  do not use DLL (hidden from user)
    (else
      (assertion-violation "nmosh PFFI dispatch-c"
                           "your platform doesn't support PFFI yet.."
                           (host-os)))))

; compiler call

; Gauche like port->string
(define (port->string/binary pb)
  (let ((p (transcoded-port pb (make-transcoder (utf-8-codec)))))
    (define (itr cur)
      (let ((c (read-char p)))
        (if (eof-object? c)
          (list->string (reverse cur))
          (itr (cons c cur)))))
    (itr '())))

(define (launch l) ;=> (values ret stdout stderr)
  (receive (stdout-in stdout-out) (pipe)
    (receive (stderr-in stderr-out) (pipe)
      (receive (pid in out err) (spawn (car l) (cdr l) (list #f stdout-out stderr-out))
        (close-port stdout-out)
        (close-port stderr-out)
        (receive (_ ret) (waitpid pid)
          (let* ((ro (port->string/binary stdout-in))
                 (re (port->string/binary stderr-in)))
            (close-port stdout-in)
            (close-port stderr-in)
            (values ret ro re)))))))

(define (compile fn to)
  (define (cmdline)
    (list "gcc" "-shared" "-g" "-O0"
          "-o" to
          fn))
  (receive (ret stdout stderr) (launch (cmdline))
    (unless (= 0 ret)
      (assertion-violation 'gcc stderr (cmdline)))))

; import callback
;  compile and cache if needed
;  and open .so via simple provider
;
;  path = base libary name or #f (REPL)

(define (clause-source clauses)
  (if (pair? clauses)
    (if (and (pair? (car clauses))
             (eq? (caar clauses) 'source))
      (cadar clauses)
      (clause-source (cdr clauses)))
    #f))

(define (import-dispatch-c path clauses)
  (let* ((sourcename (string-append (path-dirname path) (clause-source clauses)))
         (destname (entity-path->cache-path sourcename "nmosh-pffi" (ext-name))))
    (compile sourcename destname)
    (cons (simple-loader (list destname)) make-simple-caller)))

)
