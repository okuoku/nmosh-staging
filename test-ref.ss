(import (nmosh)
        (nmosh ref))

(define h (make-eq-hashtable))
(define i (make-eq-hashtable))

(~! h 'hoge 'fuga)
(~! h 'next i)
(~! h 'next 'next-hoge 'next-fuga)

(display (~ h 'hoge))(newline)
(display (~ h 'next 'next-hoge))(newline)
