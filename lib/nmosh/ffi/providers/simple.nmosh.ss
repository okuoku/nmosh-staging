(library (nmosh ffi providers simple)
         (export simple-loader simple-load1 simple-expand-loadpath make-simple-caller simple-env)
         (import (nmosh)
                 (srfi :48)
                 (srfi :98)
                 (nmosh pathutils)
                 (only (system)
                       %ffi-open %ffi-call %ffi-lookup))

(define (simple-load1 name)
  ;(format #t "try ~a\n" name)
  (guard (bogus (#t #f))
         (%ffi-open name)))

(define (simple-lookup lib name)
  (%ffi-lookup lib name))

(define (code-rettype rettype)
  (define types ;; FIXME: copied from (mosh ffi)
    '((void               . #x00)    ; FFI_RETURN_TYPE_VOID
      (bool               . #x01)    ; FFI_RETURN_TYPE_BOOL
      (char               . #x0c)    ; FFI_RETURN_TYPE_INT8_T
      (short              . #x02)    ; FFI_RETURN_TYPE_SHORT
      (int                . #x03)    ; FFI_RETURN_TYPE_INT
      (long               . #x04)    ; FFI_RETURN_TYPE_INTPTR
      (long-long          . #x12)    ; FFI_RETURN_TYPE_INT64_T
      (unsigned-short     . #x05)    ; FFI_RETURN_TYPE_USHORT
      (unsigned-int       . #x06)    ; FFI_RETURN_TYPE_UINT
      (unsigned-long      . #x07)    ; FFI_RETURN_TYPE_UINTPTR
      (unsigned-long-long . #x13)    ; FFI_RETURN_TYPE_UINT64_T
      (float              . #x08)    ; FFI_RETURN_TYPE_FLOAT
      (double             . #x09)    ; FFI_RETURN_TYPE_DOUBLE
      (void*              . #x14)    ; FFI_RETURN_TYPE_POINTER
      (char*              . #x0a)    ; FFI_RETURN_TYPE_STRING
      (size_t             . #x0b)    ; FFI_RETURN_TYPE_SIZE_T
      (int8_t             . #x0c)    ; FFI_RETURN_TYPE_INT8_T
      (uint8_t            . #x0d)    ; FFI_RETURN_TYPE_UINT8_T
      (int16_t            . #x0e)    ; FFI_RETURN_TYPE_INT16_T
      (uint16_t           . #x0f)    ; FFI_RETURN_TYPE_UINT16_T
      (int32_t            . #x10)    ; FFI_RETURN_TYPE_INT32_T
      (uint32_t           . #x11)    ; FFI_RETURN_TYPE_UINT32_T
      (int64_t            . #x12)    ; FFI_RETURN_TYPE_INT64_T
      (uint64_t           . #x13)))  ; FFI_RETURN_TYPE_UINT64_T
  (let ((r (assq rettype types)))
    (cond
      (r => cdr)
      (else #f))))

(define (code-arg arg)
  (case arg
    ((char 
       short 
       int long unsigned-short unsigned-int unsigned-long 
       int8_t int16_t int32_t uint8_t uint16_t uint32_t size_t)
     #\i)
    ((int64_t uint64_t long-long unsigned-long-long)
     #\x)
    ((bool) #\b)
    ((void* char* callback) #\p)
    ((float) #\f)
    ((double) #\d)
    (else #f)))

(define (code-args args)
  (list->string (map code-arg args)))

(define (do-make-caller lib name args rettype fallback)
  (define truelib (if (pair? lib) (cdr lib) lib))
  (define libname (if (pair? lib) (car lib) lib))
  (define ptr (simple-lookup truelib name))
  (define rettype-code (code-rettype rettype))
  (define sigs (code-args args))
  (unless (and rettype-code sigs)
    (assertion-violation
      'c-function
      (format "something wrong within do-make-caller ~a ~a"
              rettype-code
              sigs)))
  (cond
    (ptr
      (let ((arglen (length args)))
        (^ in
           (unless (= (length in) arglen)
             (assertion-violation 'c-function (format "c-function ~a at ~a requires ~d args , but got ~d args" name libname arglen (length in))))
           (apply %ffi-call 
                  rettype-code
                  sigs
                  ptr
                  in))))
    (else fallback)))

(define (make-simple-caller lib name args rettype)
  (do-make-caller
    lib name args rettype
    (^ bogus ; fallback
       (assertion-violation 'c-function (format "c-function ~s was not found" name)))))

(define (simple-expand-loadpath path name)
  (map (^e (path-append e name)) (expand-loadpath path)))

(define (simple-loader names)
  (and (pair? names)
       (or (simple-load1 (car names))
           (simple-loader (cdr names)))))

(define (simple-env name default-value)
  (let ((v (get-environment-variable name)))
    (if v
      v
      default-value)))

)
