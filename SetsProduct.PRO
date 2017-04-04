Domains
	list = symbol*
Predicates
	contains(list, list).
	substr(list, list).
	product(list, list, list).

	testOK().
Clauses
	
	contains([], _).
	contains([ _ | _ ], []) :-
		fail.
	
	contains([ H1 | T1 ], [ H2 | T2 ]) :-
		H1 = H2,
		substr(T1, T2);
		
		contains([ H1 | T1 ], T2).
		
	substr([], _).
	substr([ H1 | T1 ], [ H2 | T2 ]) :-
		H1 = H2,
		substr(T1, T2).
		
	product(List1, List2, Result) :-
		contains(Result, List1),
		contains(Result, List2).
		
	testOK() :-
		product([],[],[]),
		product([a,b],[b,c],[b]),
		product([],[a,b],[]),
		product([a,b],[c,d],[]).