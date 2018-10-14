(define (* a b)
	(cond ((= b 0) 0)
		((even? b) (double (* a (halve b))))
		(else (+ a (* a (- b 1))))))

(define (even? n)
	(= (remainder n 2) 0))

(define (halve n)
	(/ n 2))

(define (double n)
	(+ n n))

;examples
(* 1 1)
(* 5 10)
(* 5 11)