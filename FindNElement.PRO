Domains
	i = integer
	list = symbol*
	c = symbol
Predicates
	findN(i, list, c).
	testOK().
Clauses
	findN(N, _, _) :- 
		N < 0,
		write("Wrong argument(s)"),
		nl,
		fail,
		!.
	
	findN(0, [C | _], C) :-
		!.
	findN(N, [_|Lst], C) :-
		N1 = N-1,
		findN(N1, Lst, C).
		
	testOK() :-
		findN(3, [a,b,c,d,e], d).