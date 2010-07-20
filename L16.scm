;; L-99
;; http://github.com/valvallow/L-99

;; P16 (**) Drop every N'th element from a list.
;; Example:
;; * (drop '(a b c d e f g h i k) 3)
;; (A B D E G H K)


(define (drop-every-nth ls n)
  (let loop ((ls ls)(acc '())(cnt 1))
    (if (null? ls)
        (reverse acc)
        (loop (cdr ls)
              (if (zero? (remainder cnt n))
                  acc
                  (cons (car ls) acc))
              (+ cnt 1)))))

(drop-every-nth '(a b c d e f g h i k) 3)
;; (a b d e g h k)



