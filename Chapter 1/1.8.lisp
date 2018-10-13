(define (cube-iter guess x)
	(if (good-enough? guess x)
		guess
		(cube-iter (improve guess x)
					x)))

(define (improve guess x)
	(average (/ x (* guess guess)) (* 2 guess)))

(define (average x y)
	(/ (+ x y) 3))

(define (good-enough? guess x)
	(< (abs (- (* guess guess guess) x)) 0.001))

(define (cube x)
	(cube-iter 1.0 x))

(cube 27)
(cube 249)