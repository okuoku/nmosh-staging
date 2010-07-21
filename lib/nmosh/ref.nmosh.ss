(library (nmosh ref)
         (export ~ ~!)
         (import (rnrs) (nmosh miniobj))

(define-syntax ref
  (syntax-rules ()
    ((_ target slot)
     (miniobj-ref target slot))))

(define-syntax refset!
  (syntax-rules ()
    ((_ target slot value)
     (miniobj-set! target slot value))))

(define-syntax ~
  (syntax-rules ()
    ((_ target slot)
     (ref target slot))
    ((_ target slot next-slot ...)
     (~ (ref target slot) next-slot ...))))

(define-syntax ~!
  (syntax-rules ()
    ((_ target slot value)
     (refset! target slot value))
    ((_ target slot next-slot ... value)
     (~! (ref target slot) next-slot ... value))))
)
