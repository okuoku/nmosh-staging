(library (nmosh ffi providers darwin-framework)
         (export darwin-framework-load
                 make-darwin-framework-caller)
         (import (rnrs) (shorten) 
                 (nmosh ffi providers simple))

;; Darwin32/64 Framework Provider
(define first-searchpath ;; FIXME: search DYLD_LIBRARY_PATH or so
  (simple-env "DYLD_FRAMEWORK_PATH" #f))
(define second-searchpath
  (simple-env "DYLD_FALLBACK_FRAMEWORK_PATH" #f))
(define third-searchpath
  (simple-env "DYLD_FALLBACK_LIBRARY_PATH"
              "/Library/Frameworks:/Network/Library/Frameworks:/System/Library/Frameworks"))

(define (make-searchpath name)
  (append
    (if first-searchpath
      (simple-expand-loadpath first-searchpath name)
      '())
    (if second-searchpath
      (simple-expand-loadpath second-searchpath name)
      '())
    (simple-expand-loadpath third-searchpath name)))

;; OpenGL => /System/Library/Frameworks/OpenGL.framework/OpenGL (symlink to
;; current)
(define (framework-name->path basepath inname)
  (define name (if (symbol? inname) (symbol->string inname) inname))
  (string-append
    basepath
    "/"
    name
    ".framework/"
    name));; for Current version

(define (loadlib name)
  (simple-loader (map (^e (framework-name->path e name)) (make-searchpath name))))
  
(define (darwin-framework-load name)
  (loadlib name))

(define (make-darwin-framework-caller lib name args rettype)
  (make-simple-caller lib name args rettype))


)
