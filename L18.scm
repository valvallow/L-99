;; L-99
;; http://github.com/valvallow/L-99

;; P18 (**) Extract a slice from a list.
;; Given two indices, I and K, the slice is the list containing the elements between the I'th and K'th element of the original list (both limits included). Start counting the elements with 1.

;; Example:
;; * (slice '(a b c d e f g h i k) 3 7)
;; (C D E F G)

(use srfi-1)

(define (make-counter . opt)
  (let-optionals* opt ((init 0)
                       (step 1))
    (let1 count init
      (values (lambda ()
                (set! count (+ count step))
                count)
              (lambda ()
                (set! count 0)
                count)))))


(define (slice ls min max)
  (let1 counter (make-counter)
    (filter (lambda (e)
              (let1 count (counter)
                (and (<= min count)
                     (<= count max)))) ls)))

(slice '(a b c d e f g h i k) 3 7)
;; (c d e f g)



;; yet another
(define (slice ls min max)
  (let loop ((ls (reverse ls))(acc '())(tac '()))
    (if (null? ls)
        acc
        (let ((len (length tac))
              (a (car ls)))
          (loop (cdr ls)
                (if (and (<= min len)
                         (<= len max))
                    (cons a acc)
                    acc)
                (cons a tac))))))

