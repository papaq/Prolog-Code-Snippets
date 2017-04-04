Domains
	i = integer
	list = symbol*
	c = symbol
Predicates
	conc(list, list, list).
	split(c, list, list, list).
	testOK().
Clauses
	conc(A, [], A).
	conc([], A, A).
	conc(A, B, List) :-
		A = [ H | Tail ],
		conc(Tail, B, List1),
		List = [ H | List1 ].
		
	split(_, [], [], []).		
	split(Char, List, Left, Right) :-
		List = [ H | Tail ],
		H < Char,
		split(Char, Tail, Left1, Right2),
		Left = [ H | Left1 ],
		Right = Right2.
	
	split(Char, List, Left, Right) :-
		List = [ H | Tail ],
		H >= Char,
		split(Char, Tail, Left1, Right2),
		Left = Left1,
		Right = [ H | Right2 ].
		
	testOK() :-
		split(h,[a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q],_,_).