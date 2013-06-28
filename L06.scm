;; P06 (*) Find out whether a list is a palindrome.
;; A palindrome can be read forward or backward; e.g. (x a m a x).

(define (palindrome-list? ls)
  (equal? ls (reverse ls)))

(use gauche.test)
(test* "" #t (palindrome-list? '(a b c b a)))
(test* "" #f (palindrome-list? '(a b c d e)))
(test* "" #f (palindrome-list? '(a b c a b)))

