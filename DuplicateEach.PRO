Domains
	i = integer
	list = symbol*
	c = symbol
Predicates
	conc(list, list, list).
	multChar(c, i, list).
	multConc(list, i, list).
	testOK().
Clauses
	conc(A, [], A).
	conc([], A, A).
	conc(A, B, List) :-
		A = [ H | Tail ],
		conc(Tail, B, List1),
		List = [ H | List1 ].
		
	multChar(_, 0, []).	
	multChar(Char, N, List) :-
		N1 = N - 1,
		multChar(Char, N1, List1),
		List = [ Char | List1].
		
	multConc([], _, []).
	multConc(Chars, N, List) :-
		Chars = [ H | Tail ],
		multConc(Tail, N, List1),
		multChar(H, N, CharList),
		conc(CharList, List1, List).
		
	testOK() :-
		multConc([a,b,c,d], 2, [a,a,b,b,c,c,d,d]),
		multConc([a,b,c,d], 0, []).