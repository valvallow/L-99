;; L-99
;; http://github.com/valvallow/L-99

;; P07 (**) Flatten a nested list structure.
;; Transform a list, possibly holding lists as elements into a `flat' list by replacing each list with its elements (recursively).

;; Example:
;; * (my-flatten '(a (b (c d) e)))
;; (A B C D E)

;; Hint: Use the predefined functions list and append.


;; ver 1
(define (flatten tree)
  (if (null? tree)
      '()
      (append (if (list? (car tree))
                  (append (flatten (car tree))
                          (flatten (cdr tree)))
                  (cons (car tree)
                        (flatten (cdr tree)))))))

(flatten '(a (b (c d) e)))
;; (a b c d e)
(flatten '(((a)(b c d))(e (f g))(h i j (((((((k l m (n)))))))))))
;; (a b c d e f g h i j k l m n)


;; ver 2
(define (flatten tree)
  (if (null? tree)
      '()
      (let1 kar (car tree)
        (let ((rest (flatten (cdr tree)))
              (head (if (list? kar)
                        (flatten kar)
                        (list kar))))
          (append head rest)))))

(flatten '(a (b (c d) e)))
;; (a b c d e)
(flatten '(((a)(b c d))(e (f g))(h i j (((((((k l m (n)))))))))))
;; (a b c d e f g h i j k l m n)


;; let1
(define-syntax let1
  (syntax-rules ()
    ((_ var val body ...)
     (let ((var val))
       body ...))))


;; ver 3 : tail call
(define (flatten tree)
  (let loop ((tr tree)
             (acc '()))
    (if (null? tr)
        acc
        (loop (cdr tr)
              (append acc
                      (if (list? (car tr))
                          (flatten (car tr))
                          (list (car tr))))))))

(flatten '(a (b (c d) e)))
;; (a b c d e)
(flatten '(((a)(b c d))(e (f g))(h i j (((((((k l m (n)))))))))))
;; (a b c d e f g h i j k l m n)


;; ver 4 : fold
(define (flatten tree)
  (fold (lambda (e acc)
          (append acc
                  (if (list? e)
                      (flatten e)
                      (list e))))
        '() tree))

(flatten '(a (b (c d) e)))
;; (a b c d e)
(flatten '(((a)(b c d))(e (f g))(h i j (((((((k l m (n)))))))))))
;; (a b c d e f g h i j k l m n)
