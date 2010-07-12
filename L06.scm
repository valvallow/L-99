;; L-99
;; http://github.com/valvallow/L-99

;; P06 (*) Find out whether a list is a palindrome.
;; A palindrome can be read forward or backward; e.g. (x a m a x).

(define (palindrome-list? ls)
  (equal? ls (reverse ls)))

(palindrome-list? '(a b c b a))
;; #t
(palindrome-list? '(a b c d e))
;; #f
(palindrome-list? '(a b c a b))
;; #f