Domains
	i = integer
	list = integer*
Predicates
	allMults(i, i, list).
	testOK().
Clauses
	
	allMults(_, 1, [1]) :-
		!.
		
	allMults(Num, Current, List) :-
		Num mod Current = 0,
		NCurrent = Current - 1,
		allMults(Num, NCurrent, List1),
		List = [ Current | List1 ].	
		
	allMults(Num, Current, List) :-
		Num mod Current <> 0,
		NCurrent = Current - 1,
		allMults(Num, NCurrent, List).
		
	testOK() :-
		allMults(48,48,[48,24,16,12,8,6,4,3,2,1]).