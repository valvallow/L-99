;; L-99
;; http://github.com/valvallow/L-99

;; P20 (*) Remove the K'th element from a list.
;; Example:
;; * (remove-at '(a b c d) 2)
;; (A C D)


;; named-let
(define (remove-at ls n)
  (let loop ((ls ls)
             (n (if (negative? n)
                    (+ (length ls) n)
                    (- n 1)))
             (acc '()))
    (cond ((null? ls)(reverse acc))
          ((zero? n)(append (reverse acc)(cdr ls)))
          (else (loop (cdr ls)(- n 1)(cons (car ls) acc))))))

(remove-at '(a b c d) 2)
;; (a c d)
(remove-at '(a b c d) -2)
;; (a b d)




