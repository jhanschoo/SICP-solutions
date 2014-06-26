;; * : number number -> number
;; Theta(b)
(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))

;; double : number -> number
(define (double x)
  (+ x x))

;; halve : number -> number
(define (halve x)
  (/ x 2))

;; * : number number -> number
;; logarithmic recursive : Theta(log b)
(define (* a b)
  (cond ((= b 0) 0)
        ((even? b) (* (double a) (halve b)))
        (else (+ a (* a (- b 1))))))
