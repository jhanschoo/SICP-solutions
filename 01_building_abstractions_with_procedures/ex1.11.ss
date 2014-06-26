;; f : number -> number
;; f(n) = f(n-1) + 2 * f(n-2) + 3 * f(n-3)
;; naive recursive
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

;; f : number -> number
;; f(n) = f(n-1) + 2 * f(n-2) + 3 * f(n-3)
;; f(n+3) = f(n+2) + 2 * f(n+1) + 3 * f(n)
;; iterative sliding window
(define (f n)
  (f-iter 2 1 0 n))
   
;; f-iter : number number number number -> number
(define (f-iter fnp2 fnp1 fn count)
  (if (= count 0)
      fn
      (f-iter (+ fnp2  (* 2 fnp1) (* 3 fn)) fnp2 fnp1 (- count 1))))
