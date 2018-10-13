(define (greaterTwo a b c)
	(cond ((< a b) 
		(if (< a c) (+ b c) (+ a b)))
	((> a b) 
		(if (< b c) (+ a c) (+ a b)))
	((= a b) 
		(if (< a c) (+ a c) (+ a b)))))

;examples
(greaterTwo 1 2 3); 5
(greaterTwo 3 3 1); 6
(greaterTwo 3 1 3); 6
(greaterTwo 1 3 3); 6
(greaterTwo 1 3 2); 5
(greaterTwo 2 1 3); 5
(greaterTwo 2 3 1); 5
(greaterTwo 3 2 1); 5
(greaterTwo 3 1 2); 5