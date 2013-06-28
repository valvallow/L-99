;; P02 (*) Find the last but one box of a list.
;; Example:
;; * (my-but-last '(a b c d))
;; (C D)

(define (my-but-last ls)
  (let rec ((ls ls ))
    (if (or (null? ls)
            (null? (cdr ls))
            (null? (cddr ls)))
        ls
        (rec (cdr ls)))))


(use gauche.test)
(test-start "my-but-last")
(test* "" '() (my-but-last '()))
(test* "" '(d) (my-but-last '(d)))
(test* "" '(c d) (my-but-last '(c d)))
(test* "" '(c d) (my-but-last '(a b c d)))
