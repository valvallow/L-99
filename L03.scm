;; L-99
;; http://github.com/valvallow/L-99

;; P03 (*) Find the K'th element of a list.
;; The first element in the list is number 1.
;; Example:
;; * (element-at '(a b c d e) 3)
;; C


;; gauche
(define (element-at ls n)
  (list-ref ls (- n 1)))

(element-at '(a b c d e) 3)
;; c

;; normal recur
(define (element-at ls n)
  (if (= n 1)
      (car ls)
      (element-at (cdr ls)(- n 1))))

(element-at '(a b c d e) 3)
;; c


;; letrec
(define (element-at ls n)
  (if (or (< (length ls) n)
          (not (positive? n)))
      (error "out of range")
      (letrec
          ((recur
            (lambda (ls n)
              (if (= n 1)
                  (car ls)
                  (recur (cdr ls)(- n 1))))))
        (recur ls n))))

(element-at '(a b c d e) 3)
;; c
(element-at '(a b c d e) 0)
;; error
(element-at '() 0)
;; error
(element-at '(a b c) 5)
;; error



;; named-let
(define (element-at ls n)
  (if (or (< (length ls) n)
          (not (positive? n)))
      (error "out of range")
      (let loop ((ls ls)(n n))
        (if (= n 1)
            (car ls)
            (loop (cdr ls)(- n 1))))))

(element-at '(a b c d e) 3)
;; c
(element-at '(a b c d e) 0)
;; error
(element-at '() 0)
;; error
(element-at '(a b c) 5)
;; error


(define (element-at ls n)
  (if (or (< (length ls) n)
          (not (positive? n)))
      (error "out of range")
      (let loop ((ls ls)(acc 1))
        (if (= n acc)
            (car ls)
            (loop (cdr ls)(+ acc 1))))))


;; let/cc fold
(define (element-at ls n)
  (if (or (< (length ls) n)
          (not (positive? n)))
      (error "out of range")
      (let/cc hop
        (fold (lambda (e acc)
                (if (= acc 1)
                  (hop e)
                  (- acc 1)))
              n ls))))

(element-at '(a b c d e) 3)
;; c
(element-at '(a b c d e) 0)
;; error
(element-at '() 0)
;; error
(element-at '(a b c) 5)
;; error



