Domains
	c = symbol
	list = symbol*
Predicates
	contains(list, list).
	substr(list, list).
	adjacent(c, c, list).
	testOK().
	testFAIL().
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
		
	adjacent(Char1, Char2, List) :-
		contains([Char1, Char2], List);
		contains([Char2, Char1], List).
		
	testOK() :-
		adjacent(a,b,[e,d,f,g,h,i,a,b,j,k,y,t]),
		adjacent(b,a,[e,d,f,g,h,i,a,b,j,k,y,t]).
		
	testFAIL() :-
		adjacent(b,a,[e,d,f,g,h,i,b,j,k,y,t]);
		adjacent(b,a,[e,d,f,g,h,i,a,c,b,j,k,y,t]).
		