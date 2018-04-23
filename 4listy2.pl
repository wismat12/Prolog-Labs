
pop([T|S],T,S).

pussh(T,S,[T|S]).



	/*ost3(L,L1) :-
	 *
	 *
	 *
	X1 = [H1|T1],
	T1 = [H2|T2],
	T2 = [H3|T3],
	L1 = T3,
	write(L1).*/
wypisz([H|_],1):-
	write(H).
wypisz([_|T],N):-
	Num is N - 1,
	wypisz(T,Num).

usunn([_|T],T,1).

usunn([H1|T1],L,N):-
	Num is N -1,
	L = [H1|T],
	usunn(T1,T,Num).

sprawdz([_]).
sprawdz([X1|T1]):-
        powszystkich(X1,T1),
	sprawdz(T1).

powszystkich(_,[]).
powszystkich(X,[H1|T1]):-
	X @=< H1,
	powszystkich(X,T1).

merge(L1,El,L2):-
	sprawdz(L1),
	mergee(L1,El,L2).

mergee([], El, El). 
mergee([X|T], El, [El,X|T]):-
	  El =< X.     
mergee([X|T], El, [X|T2]):- 
El > X, 
merge(T, El, T2). 





usun(X,[X|Reszta],Reszta).
usun(X,[Y|Ogon],[Y|Reszta]) :-
	usun(X,Ogon,Reszta).

sklej([],X,X).
sklej(L1,L2,L3):-
	L1 = [H1|T1],
	L3 = [H1|T3],
	sklej(T1,L2,T3).

sklejj([],X,X).
sklejj([X|L1],L2,[X|L3]) :-
	sklejj(L1,L2,L3).

usun3ost(L,L1) :-
	sklej(L1,[_,_,_],L).

usun3pier(L,L1) :-
	sklej([_,_,_],L1,L).

usunprzodtyl(L,L2) :-
	usun3ost(L,L1),
	usun3pier(L1,L2).

%nieparzysty
oddlength([X]).
oddlength([X,Y|R]) :- oddlength(R).

evenlength([]).
evenlength([X,Y|R]) :- evenlength(R).

odwroc([],[]).
odwroc([H|T],L) :-
	odwroc(T,R),
	sklejj(R,[H],L).

palindrom(L) :-
	reverse(L,L).









