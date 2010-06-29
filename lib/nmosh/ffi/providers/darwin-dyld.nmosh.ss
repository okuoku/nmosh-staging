(library (nmosh ffi providers darwin-dyld)
         (export darwin-dyld-load)
         (import (rnrs) (shorten) 
                 (srfi :98)
                 (nmosh ffi providers simple))

;; Darwin32/64 Dyld Provider
(define first-searchpath 
  (simple-env "DYLD_LIBRARY_PATH" #f))
(define second-searchpath
  (simple-env "DYLD_FALLBACK_FRAMEWORK_PATH" #f))
(define third-searchpath
  (simple-env "DYLD_FALLBACK_LIBRARY_PATH"
              (string-append (get-environment-variable "HOME") "/lib" ":"
                             "/usr/local/lib:/lib:/usr/lib")))

(define (make-searchpath name)
  (append
    (if first-searchpath
      (simple-expand-loadpath first-searchpath name)
      '())
    (if second-searchpath
      (simple-expand-loadpath second-searchpath name)
      '())
    (simple-expand-loadpath third-searchpath name)))

(define (framework-name->path basepath inname)
  (define name (if (symbol? inname) (symbol->string inname) inname))
  (string-append
    basepath
    "/"
    "lib"
    name))

(define (loadlib name)
  (simple-loader (map (^e (framework-name->path e name)) (make-searchpath name))))
  
(define (darwin-dyld-load name)
  (loadlib name))

)
