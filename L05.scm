;; P05 (*) Reverse a list.

(define (my-reverse ls)
  (let rec ((ls ls)(acc '()))
    (if (null? ls)
        acc
        (rec (cdr ls)(cons (car ls) acc)))))

(define (my-reverse ls)
  (fold cons '() ls))

(use gauche.test)
(test* "" '(4 3 2 1) (my-reverse '(1 2 3 4)))
(test* "" '(d c b a) (my-reverse '(a b c d)))
