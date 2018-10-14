(define (expt b n)
	(fast-expt-iter b n 1))

(define (fast-expt-iter b counter a)
	(cond ((= counter 0) a)
		((even? counter) (fast-expt-iter (* b b) (/ counter 2) a))
		(else (fast-expt-iter b (- counter 1) (* a b)))))

(define (even? n)
	(= (remainder n 2) 0))

;examples
(expt 2 0)
(expt 2 1)
(expt 2 2)
(expt 2 3)
(expt 2 4)
(expt 2 5)

;An iterative process of calculation the exponentiation and uses a logarithmic number of steps.
;Every iteration call we divide the exponentiation number by two