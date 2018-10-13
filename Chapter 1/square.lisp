;;give a compound operation a name and then refer it as a unit.
(define (square x) (* x x))

;;use square to defining other procedures
(define (sum-of-squares x y)
	(+ (square x) (square y))
	)

;;examples
(square 21)
(square (+ 2 5))
(sum-of-squares 3 4) ;should output 25
