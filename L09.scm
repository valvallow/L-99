;; P09 (**) Pack consecutive duplicates of list elements into sublists.
;; If a list contains repeated elements they should be placed in separate sublists.

;; Example:
;; * (pack '(a a a a b c c a a d e e e e))
;; ((A A A A) (B) (C C) (A A) (D) (E E E E))


;; gauche
(use gauche.sequence)
(define pack group-sequence)

;; my-pack
(define (pack ls :optional (cmpfn eq?))
  (let rec ((ls ls)(set '())(acc '()))
    (cond ((null? ls)(reverse (cons set acc)))
          ((or (null? set)(cmpfn (car ls)(car set)))
           (rec (cdr ls)(cons (car ls) set) acc))
          (else (rec (cdr ls)(cons (car ls) '()) (cons set acc))))))


(use gauche.test)
(test* "" '()(pack '()))
(test* "" '((a a a a) (b) (c c) (a a) (d) (e e e e)) (pack '(a a a a b c c a a d e e e e)))

