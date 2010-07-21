(library (nmosh miniobj)
         (export miniobj-ref miniobj-set!)
         (import (rnrs))

(define (miniobj-set! obj slot value)
  (cond
    ((hashtable? obj)
     (hashtable-set! obj slot value))
    ((vector? obj)
     (vector-set! obj slot value))))

(define (miniobj-ref obj slot)
  (cond
    ((hashtable? obj)
     (hashtable-ref obj slot #f))
    ((vector? obj)
     (vector-ref obj slot))
    ((pair? obj)
     (list-ref obj slot))
    (else
      (assertion-violation 'miniobj-ref
                           "unsupported object"
                           obj))))
)
