; (nmosh ext) language
(library (nmosh ext)
         (export import-ext import-c c-function)
         (import (nmosh)
                 (only (mosh) host-os)
                 (for (nmosh expander query) expand)
                 (nmosh ext dispatch-c)
                 (nmosh ext dispatch-ext))

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
