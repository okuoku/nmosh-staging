(library (ext api glut)
         (export glutInit
                 glutCreateWindow
                 glutDisplayFunc
                 glutMainLoop)
         (import (nmosh ext))
(import-ext
  ((darwin-framework "GLUT"))
  (c-function void glutInit void* void*)
  (c-function int glutCreateWindow char*)
  (c-function void glutDisplayFunc callback)
  (c-function void glutMainLoop))
)
