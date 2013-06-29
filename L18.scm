;; P18 (**) Extract a slice from a list.
;; Given two indices, I and K, the slice is the list containing the elements between the I'th and K'th element of the original list (both limits included). Start counting the elements with 1.

;; Example:
;; * (slice '(a b c d e f g h i k) 3 7)
;; (C D E F G)

(use srfi-1)
(define (slice ls start end)
  (drop (drop-right ls (- (length ls) end))(- start 1)))


(use gauche.test)
(test* "" '(c d e f g)(slice '(a b c d e f g h i k) 3 7))


