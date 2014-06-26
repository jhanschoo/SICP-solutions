;; A : number number -> number
;; Ackermann's function
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(A 1 10)
;; (A 1 10)
;; (A 0 (A 1 9))
;; (A 0 (A 0 ... (A 1 1) ... )) ;; 9 nested (A 0 ...)
;; (A 0 (A 0 ... (A 0 2) ... )) ;; 9 nested (A 0 ...)
;; 1024

(A 2 4)
;; (A 1 (A 2 3))
;; (A 1 (A 1 (A 1 (A 2 1))))
;; (A 1 (A 1 (A 1 2)))
;; (A 1 (A 1 4))
;; (A 1 16)
;; 65536

(A 3 3)
;; (A 2 (A 2 2))
;; (A 2 (A 2 (A 2 1)))
;; (A 2 (A 2 2))
;; (A 2 4)
;; 65536

;; f : number -> number
(define (f n) (A 0 n))
;; f(n) === 2*n
;; hyper-2

;; g : number -> number
(define (g n) (A 1 n))
;; g(n) === 2^n
;; hyper-3

;; h : number -> number
(define (h n) (A 2 n))
;; h(n) === 2^^n
;; hyper-4
