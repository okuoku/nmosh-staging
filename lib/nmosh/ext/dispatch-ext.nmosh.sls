(library (nmosh ext dispatch-ext)
         (export import-dispatch-ext)
         (import (nmosh)
                 (only (mosh) host-os)
                 (srfi :48)
                 (nmosh ffi providers darwin-framework)
                 (nmosh ffi providers darwin-dyld)
                 (nmosh ffi providers darwin)
                 (nmosh ffi providers simple))

(define (import-dispatch-ext l)
  (define (complain)
    (assertion-violation "nmosh ext"
                         (format "architecture [~a] is not supported" (host-os))))
  (define (lookup sym loader maker)
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
    ((cygwin)
     (or
       (lookup 'win32-dll simple-load1 make-simple-caller)))
    (else
      (complain))))
)
