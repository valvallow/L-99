;; P07 (**) Flatten a nested list structure.
;; Transform a list, possibly holding lists as elements into a `flat' list by replacing each list with its elements (recursively).

;; Example:
;; * (my-flatten '(a (b (c d) e)))
;; (A B C D E)

;; Hint: Use the predefined functions list and append.

(use srfi-1)
(define (my-flatten xs)
  (if (list? xs)
      (append-map my-flatten xs)
      (list xs)))

(define (my-flatten tree)
  (fold-right (^ (e acc)
                 (if (list?  e)
                     (append (my-flatten e) acc)
                     (cons e acc)))
              '() tree))

(use gauche.test)
(test* "" '(a b c d e)  (my-flatten '(a (b (c d) e))))
(test* "" '(a b c d e f g)  (my-flatten '(a (b ((((((((c))))) d))(e f (g)()()))))))
