; (nmosh ext) language
(library (nmosh ext)
         (export import-dispatch import-ext begin define define-syntax syntax-rules quote car cdr)
         (import (nmosh)
                 (only (mosh) host-os)
                 (for (nmosh rnrs lisp-transformer) expand)
                 (srfi :48)
                 (nmosh ffi providers darwin-dyld)
                 (nmosh ffi providers darwin-framework)
                 (nmosh ffi providers darwin))

(define (import-dispatch l)
  (define (complain)
    (assertion-violation "nmosh ext"
                         (format "architecture [~a] is not supported" (host-os))))
  (define (lookup sym loader maker)
    ;(format #t "dispatch ~a ~a\n" l sym)
    (cond
      ((assoc sym l) => (^e
                           (let ((lib (cadr e)))
                             (cons 
                               (loader lib)
                               maker))))
      (else #f)))
  (case (string->symbol (host-os))
    ((darwin)
     (or
       (lookup 'darwin-framework darwin-framework-load make-darwin-caller)
       (lookup 'darwin-dyld darwin-dyld-load make-darwin-caller)
       (complain)))
    (else
      (complain))))

(define-syntax import-ext
  (lisp-transformer
    (^l
      (let ((clause (cdr l)))
        `(begin
           (define %mylib (import-dispatch (quote ,clause)))
           (define %lib (car %mylib))
           (define %lookup (cdr %mylib))
           (define-syntax c-function
             (syntax-rules ()
               ((_ rettype func)
                (define func (%lookup %lib 'func '() 'rettype)))
               ((_ rettype func argtype)
                (define func (%lookup %lib 'func '(argtype) 'rettype)))
               ((_ rettype func argtypes ...)
                (define func (%lookup %lib 'func '(argtypes ...) 'rettype))))))))))


)
