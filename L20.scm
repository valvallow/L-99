;; L-99
;; http://github.com/valvallow/L-99

;; P20 (*) Remove the K'th element from a list.
;; Example:
;; * (remove-at '(a b c d) 2)
;; (A C D)


;; named-let
(define (remove-at ls n)
  (let loop ((ls ls)
             (n (if (negative? n)
                    (+ (length ls) n)
                    (- n 1)))
             (acc '()))
    (cond ((null? ls)(reverse acc))
          ((zero? n)(append (reverse acc)(cdr ls)))
          (else (loop (cdr ls)(- n 1)(cons (car ls) acc))))))

(remove-at '(a b c d) 2)
;; (a c d)
(remove-at '(a b c d) -2)
;; (a b d)



(define (remove-at ls n)
  (let loop ((ls ls)
             (n (if (negative? n)
                    (+ (length ls) n)
                    (- n 1)))
             (acc '()))
    (if (zero? n)
        (append (reverse acc)(cdr ls))
        (loop (cdr ls)(- n 1)(cons (car ls) acc)))))

(remove-at '(a b c d e f g) 2)
;; (a c d e f g)
(remove-at '(a b c d e f g) -2)
;; (a b c d e g)




;; yet another version

(define (fold-right/index proc init ls . lss)
  (let1 idx (- (length ls) 1)
    (apply fold-right (lambda args
                        (begin0
                            (apply proc (append args (list idx)))
                          (set! idx (- idx 1))))
           init (cons ls lss))))

(fold-right/index (lambda (e acc idx)
                    (acons idx e acc))
                  '() '(a b c d e))
;; ((0 . a) (1 . b) (2 . c) (3 . d) (4 . e))

(fold-right/index (lambda (e1 e2  acc idx)
                    (acons e1 (cons e2 idx) acc))
                  '() '(a b c d e)'(f g h i j k))
;; ((a f . 0) (b g . 1) (c h . 2) (d i . 3) (e j . 4))


(define (remove-at ls n)
  (let1 n (if (negative? n)
              (+ (length ls) n)
              (- n 1))
    (fold-right/index (lambda (e acc idx)
                        (if (= idx n)
                            acc
                            (cons e acc)))
                      '() ls)))

(remove-at '(a b c d) 2)
;; (a c d)
(remove-at '(a b c d) -2)
;; (a b d)
