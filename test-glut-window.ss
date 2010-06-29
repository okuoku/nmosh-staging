(import (nmosh) (mosh ffi) (ext api glut))
(define zero (malloc 16))
(define NULL (integer->pointer 0))
(define callback
  (c-callback
    void
    ()
    (^[] #f)))
    
(pointer-set-c-uint64! zero 0 0)
(glutInit zero NULL)
(glutCreateWindow "test window")
(glutDisplayFunc callback)
(glutMainLoop)
