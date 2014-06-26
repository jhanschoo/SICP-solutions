(define (square x) (* x x))

;; fast-expt : number number -> number
;; iterative logarithmic: Theta(log n) time and Theta(1) space
(define (fast-expt b n)
  (fast-expt-iter 1 b n))

;; fast-expt-iter : number number number -< number
(define (fast-expt-iter a b n)
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter a (square b) (/ n 2)))
        (else (fast-expt-iter (* a b) b (- n 1)))))
