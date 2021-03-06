(define (sum term a next b)
	(if (> a b)
		0
		(+ (term a)
			(sum term (next a) next b))))

(define (inc n) (+ n 1))

(define (sum-cubes a b)
	(sum cube a inc b))

(define (cube n) (* n n n))

(sum-cubes 1 10)

(sum 1 10)