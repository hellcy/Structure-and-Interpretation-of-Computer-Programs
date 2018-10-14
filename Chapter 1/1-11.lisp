;recursive process
(define (f n)
	(cond ((< n 3) n)
	(else (+ (f (- n 1))
			(* 2 (f (- n 2)))
			(* 3 (f (- n 3)))))))

;examples
(f 1)
(f 2)
(f 3)
(f 4)
(f 5)
(f 6)

;iterative process
(define (x n)
	(x-iter 2 1 0 n))

(define (x-iter a b c n)
	(cond ((= n 0) c)
		((= n 1) b)
		((= n 2) a)
		(else (x-iter (+ a (* 2 b) (* 3 c)) 
						a b (- n 1)))))

;examples
(x 1)
(x 2)
(x 3)
(x 4)
(x 5)
(x 6)

;;note: It is better to define the iter procedure as an internal procedure, create a block structure to avoid naming problem.