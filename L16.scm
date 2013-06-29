;; P16 (**) Drop every N'th element from a list.
;; Example:
;; * (drop '(a b c d e f g h i k) 3)
;; (A B D E G H K)


(use srfi-1)
(define (drop-every-nth ls n)
  (append-map (^(e delete?)
                (if delete?
                    '()
                    (list e)))
              ls
              (list-tabulate (length ls)
                             (^i (zero? (modulo (+ i 1) n))))))

(define (drop-every-nth ls n)
  (reverse
   (fold (^(e delete? acc)
           (if delete?
               acc
               (cons e acc)))
         '()
         ls
         (list-tabulate (length ls)
                        (^i (zero? (modulo (+ i 1) n)))))))


(use gauche.test)
(test* "" '(a b d e g h k) (drop-every-nth '(a b c d e f g h i k) 3))
(test* "" '(a c e g i) (drop-every-nth '(a b c d e f g h i k) 2))
(test* "" '() (drop-every-nth '(a b c d e f g h i k) 1))



