Domains
	i = integer
Predicates
	prime(i, i).
	devsByOneOnly(i, i, i).
	goldbach(i, i, i).
	checkBetween(i, i, i, i).
	
	testOK().
Clauses
	devsByOneOnly(_, 1, 1).
	devsByOneOnly(X, By, Bool) :-
		By > 1,
		X <> By,
		X mod By = 0,
		Bool = 0;
		
		By > 1,
		X = By,
		ByPrev = By - 1,
		devsByOneOnly(X, ByPrev, Bool);
		
		By > 1,
		X mod By <> 0,
		ByPrev = By - 1,
		devsByOneOnly(X, ByPrev, Bool).
		
	prime(X, Bool) :-
		X > 1,
		devsByOneOnly(X, X, Bool);
		X <= 1,
		Bool = 0.
		
	goldbach(X, V1, V2) :-
		X < 4,
		write("Wrong argument "),
		!,
		fail;
		
		X >= 4,
		Down = 2,
		Up = X - 2,
		checkBetween(Down, Up, D, U),
		D <> 0,
		V1 = D,
		V2 = U,
		!;
		
		write("Not found"),
		nl,
		fail,
		!.
		
	checkBetween(Down, Up, V1, V2) :-
		Down = Up,
		prime(Down, DownPrime),
		DownPrime = 1, 
		V1 = Down,
		V2 = Down,
		!;
		
		Down = Up,
		prime(Down, DownPrime),
		DownPrime = 0,
		V1 = 0,
		V2 = 0,
		!;
		
		prime(Down, DownPrime),
		DownPrime = 1,
		prime(Up, UpPrime),
		UpPrime = 1,
		V1 = Down,
		V2 = Up,
		!;
		
		Up - Down <> 1,
		DownMore = Down + 1,
		UpLess = Up - 1,
		checkBetween(DownMore, UpLess, V1, V2);
				
		V1 = 0,
		V2 = 0,
		!.
		
	testOK() :-
		goldbach(76, 3, 73);
		goldbach(76, 73, 3).