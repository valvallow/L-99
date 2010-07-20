;; L-99
;; http://github.com/valvallow/L-99

;; P14 (*) Duplicate the elements of a list.
;; Example:
;; * (dupli '(a b c c d))
;; (A A B B C C C C D D)


(define (dupli ls)
  (fold-right (lambda (e acc)
                (append (list e e) acc))
              '() ls))

