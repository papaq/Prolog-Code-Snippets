Domains
	i=integer
Predicates
	isCoprime(i, i).
	
	testOK().
	testFAIL().
Clauses
	isCoprime(X, X) :-
		X = 1;
		X <> 1,
		!,
		fail.
	isCoprime(X, Y) :-
		X < Y,
		Y1 = Y - X,
		isCoprime(X, Y1);
		Y < X,
		X1 = X - Y,
		isCoprime(X1, Y).
		
	testOK() :-
		isCoprime(25, 36).
		
	testFAIL() :-
		isCoprime(98, 12).