;; P24 (*) Lotto: Draw N different random numbers from the set 1..M.
;; The selected numbers shall be returned in a list.
;; Example:
;; * (lotto-select 6 49)
;; (23 1 17 33 21 37)

;; Hint: Combine the solutions of problems P22 and P23.

;; L22
(define (range start end)
  (iota (- end (- start 1)) start))

(use gauche.sequence)
(define (lotto-select len max)
  (take (shuffle (range 1 max)) len))


;; test
(dotimes (i 10)
  (print (lotto-select 6 49)))

