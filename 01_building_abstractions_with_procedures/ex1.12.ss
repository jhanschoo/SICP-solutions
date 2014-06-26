;; nCr : number number -> number
(define (nCr n r)
  (cond ((< r 0) 0)
        ((> r n) 0)
        ((= n 0) 1)
        (else (+ (nCr (- n 1) (- r 1))
                 (nCr (- n 1) r)))))

        