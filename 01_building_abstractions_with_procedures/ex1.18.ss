;; double : number -> number
(define (double x)
  (+ x x))

;; halve : number -> number
(define (halve x)
  (/ x 2))

;; * : number number -> number
;; logarithmic iterative : Theta(log b)
(define (* a b)
  (*-iter 0 a b))

;; *-iter number number number -> number
(define (*-iter n a b)
  (cond ((= b 0) n)
        ((even? b) (*-iter n (double a) (halve b)))
        (else (*-iter (+ n a) a (- b 1)))))
