;; L-99
;; http://github.com/valvallow/L-99

;; P26 (**) Generate the combinations of K distinct objects chosen from the N elements of a list
;; In how many ways can a committee of 3 be chosen from a group of 12 people? We all know that there are C(12,3) = 220 possibilities (C(N,K) denotes the well-known binomial coefficients). For pure mathematicians, this result may be great. But we want to really generate all the possibilities in a list.

;; Example:
;; * (combination 3 '(a b c d e f))
;; ((A B C) (A B D) (A B E) ... )

(use util.combinations)

(combinations '(a b c d e f) 3)
;; ((a b c) (a b d) (a b e) (a b f) (a c d) (a c e) (a c f) (a d e) (a d f) (a e f) (b c d) (b c e) (b c f) (b d e) (b d f) (b e f) (c d e) (c d f) (c e f) (d e f))


;; http://valvallow.blogspot.com/2010/07/093416.html
(define (combination ls r)
  (let ((nlen (length ls)))
    (cond ((or (null? ls)
               (not (positive? r))
               (< nlen r)) '())
          ((= r 1)(map list ls))
          ((= nlen r)(list ls))
          (else (append (map (pa$ cons (car ls))
                             (combination (cdr ls)(- r 1)))
                        (combination (cdr ls) r))))))

(print (combination '(a b c d e f) 3))
;; ((a b c) (a b d) (a b e) (a b f) (a c d) (a c e) (a c f) (a d e) (a d f) (a e f) (b c d) (b c e) (b c f) (b d e) (b d f) (b e f) (c d e) (c d f) (c e f) (d e f))

