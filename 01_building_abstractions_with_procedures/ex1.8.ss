;; redefining improve and good-enough? to these definitions
;; should be sufficient to have sqrt calculate the cube root instead.

(define (improve guess x)
  (/
   (+ (/ x (* guess guess)) (* 2 guess))
   3))

(define (good-enough? guess x)
  (< (abs (- (* guess guess guess) x)) 0.001))