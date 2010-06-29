(library (nmosh ffi providers darwin)
         (export make-darwin-caller)
         (import (rnrs) 
                 (nmosh ffi providers simple))

(define (make-darwin-caller lib name args rettype)
  (make-simple-caller lib name args rettype))

)
