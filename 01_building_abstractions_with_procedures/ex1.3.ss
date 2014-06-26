(define (square x) (* x x))

(define (sum-of-squares-of-greater-two a b c)
  (+ (square a) (square b) (square c)
     (- (square (cond ((and (<= a b) (<= a c)) a)
                ((and (<= b a) (<= b c)) b)
                (else c))))))

(sum-of-squares-of-greater-two 4 5 6)