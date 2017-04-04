Domains
	i=integer
Predicates
	fi(i, i).
	
	testOK().
Clauses
	fi(0,1).
	fi(1,1).
	fi(N,X) :- 
		N > 1,
		Npprev = N - 2,
		fi(Npprev, Xpprev),
		Nprev = N - 1,
		fi(Nprev, Xprev),
		X = Xpprev + Xprev;
		
		N < 0,
		write("Numbers not less than 0 valid only"),
		nl,
		!,
		fail.
		
	testOK() :-
		fi(10,89).