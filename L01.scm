;; P01 (*) Find the last box of a list.
;; Example:
;; * (my-last '(a b c d))
;; (D)


;; srfi-1
(last-pair '(a b c d))

;; my-last
(define (my-last ls)
  (let rec ((ls ls))
    (if (or (null? ls)
            (null? (cdr ls)))
        ls
        (rec (cdr ls)))))


(use gauche.test)
(test-start test-name)
(test* "" '() (my-last '()))
(test* "" '(d) (my-last '(d)))
(test* "" '(d) (my-last '(a b c d)))
