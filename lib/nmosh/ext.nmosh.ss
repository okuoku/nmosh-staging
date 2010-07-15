; (nmosh ext) language
(library (nmosh ext)
         (export import-ext import-c c-function)
         (import (nmosh)
                 (only (mosh) host-os)
                 (for (nmosh expander query) expand)
                 (nmosh ext dispatch-c)
                 (nmosh ffi providers darwin-dyld)
                 (nmosh ffi providers darwin-framework)
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
       (lookup 'win32-dll simple-loader make-simple-caller)))
    (else
      (complain))))

(define-syntax import-c
  (^[exp]
    (syntax-case exp (c-function)
      ((_  import-from import-set ...)
       (with-syntax (((imported) (generate-temporaries #'(tmp))))
         #`(begin
             (define imported (import-dispatch-c #,(current-program) 'import-from))
             (define-for-imported imported import-set)
             ...
             ))))))

(define-syntax define-for-imported
  (syntax-rules (c-function)
    ((_ imported (c-function rettype func))
     (define func ((cdr imported) (car imported) 'func '() 'rettype)))
    ((_ imported (c-function rettype func argtypes ...))
     (define func ((cdr imported) (car imported) 'func '(argtypes ...) 'rettype)))))

(define-syntax import-ext
  (^[exp]
    (syntax-case exp (c-function)
      ((_  import-from import-set ...)
       (with-syntax (((imported) (generate-temporaries #'(tmp))))
         #`(begin
             (define imported (import-dispatch-ext 'import-from))
             (define-for-imported imported import-set)
             ...
             ))))))

(define-syntax c-function
  (^[exp]
    (syntax-violation 'c-function "invalid form" exp)))

)
