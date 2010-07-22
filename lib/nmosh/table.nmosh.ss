(library (nmosh table)
         (export make-table)
         (import (rnrs))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; UNORDERED TABLE
;;;
;;; this is an R6RS hashtable and acutually, not a yuni table..
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (make-table) ;; same keyspec as ordered-table but not ordered
  (define table-hash equal-hash)
  (define (table-equiv x y)
    (define (typeof obj)
      (or
        (if (symbol? obj) 'symbol #f)
        (if (string? obj) 'string #f)
        (assertion-violation 'table
                             "invalid object for table key"
                             obj)))
    (let ((type-x (typeof x))
          (type-y (typeof y)))
      (cond
        ((not (eq? type-x type-y)) #f)
        ((eq? 'symbol type-x)
         (eq? x y))
        ((eq? 'string type-x)
         (string=? x y)))))
  (make-hashtable table-hash table-equiv))

;; unordered tables don't have specific ref/set! procedures
;; they are eqv. to R6RS hashtable



)
