(library (nmosh cacheutils)
         (export entity-path->cache-path)
         (import (nmosh)
                 (nmosh pathutils)
                 (primitives nmosh-cache-path))

;; TMP
(define (filename->cachename fn)
  (define (escape str)
    (list->string (map (lambda (e) (cond
                                     ((char=? e #\:) #\~)
                                     ((char=? e #\/) #\~)
                                     ((char=? e #\~) #\@)
                                     (else e)))
                       (string->list str))))
  (escape fn))

(define (entity-path->cache-path entitypath typestring ext)
  (define cache-path (nmosh-cache-path))
  (unless cache-path
    (assertion-violation 'nmosh-cache "couldn't locate cache-dir (set $HOME)"))

  (string-append cache-path (filename->cachename entitypath) "." typestring "." ext))

)

