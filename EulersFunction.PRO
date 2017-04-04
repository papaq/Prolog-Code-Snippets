Domains
	i=integer
Predicates
	phi(i, i, i).
	isCoprime(i, i, i).
	
	testOK().
Clauses
	isCoprime(X, X, Bool) :-
		X = 1,
		Bool = 1;
		X <> 1,
		Bool = 0.
	isCoprime(X, Y, Bool) :-
		X < Y,
		Y1 = Y - X,
		isCoprime(X, Y1, Bool);
		Y < X,
		X1 = X - Y,
		isCoprime(X1, Y, Bool).
		
	phi(X, _, _) :-
		X < 1,
		write("Wrong parameter "),
		nl,
		!,
		fail.
	phi(_, Rest, _) :-
		Rest < 1,
		write("Wrong parameter "),
		nl,
		!,
		fail.
		
	phi(_, 1, 1).
	phi(X, Rest, Sum) :-
		
		Rest > 1,
		Yp = Rest - 1,
		phi(X, Yp, Sum1),
		
		
		isCoprime(X, Rest, Bool),
		Sum =Sum1 + Bool. 
		
	testOK() :-
		phi(10, 10, 4).