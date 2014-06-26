; ex1.6

; as (new-if (good-enough?...) guess (sqrt-iter...))
; is a normal function, the evaluator will attempt to
; apply (sqrt-iter...) regardless of the value of (good-enough?...)
; however, since sqrt-iter is recursively defined, the recursive
; application will not terminate.
