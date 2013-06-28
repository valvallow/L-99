;; P04 (*) Find the number of elements of a list.


;; srfi-1
(use srfi-1)
(define (find-number-of-elements pred ls)
  (list-index pred ls))

;; gauche.sequence
(use gauche.sequence)
(define (find-number-of-elements pred ls)
  (find-index pred ls))

(define (find-number-of-elements pred ls)
  (let rec ((ls ls)(index 0))
    (and (not (null? ls))
         (if  (pred (car ls))
              index
              (rec (cdr ls)(+ index 1))))))

(use gauche.test)
(test-start "find-number-of-elements")
(test* "" #f (find-number-of-elements (pa$ eq? 'c) '()))
(test* "" 2 (find-number-of-elements (pa$ eq? 'c) '(a b c d)))
(test* "" 2 (find-number-of-elements (pa$ eq? 3) '(1 2 3 4 5)))
(test* "" #f (find-number-of-elements (pa$ eq? 3) '(a b c d)))
