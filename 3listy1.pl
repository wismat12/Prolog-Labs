porownaj([_,_,C,D|_]):-
	C == D.
porownaj2([_,_,X,X|_]).

zamien([a,b,c,d|Reszta],X):-
	X = [a,b,d,c|Reszta].

%zamieniaj(
%zamieniaj([H|T],L,X):-


nalezy(X,[X|_]).
nalezy(X,[_|Yogon]) :-
	nalezy(X,Yogon).

dlugosc([],0).
dlugosc([_|Ogon],Dlug) :-
	dlugosc(Ogon,X),
	Dlug is X+1.

sklej([],X,X).
sklej(L1,L2,L3):-
	L1 = [H1|T1],
	L3 = [H1|T3],
	sklej(T1,L2,T3).

sklejj([],X,X).
sklejj([H1|T1],L2,[H1|T3]) :-
	sklejj(T1,L2,T3).

nalezy1(X,L) :-
	sklej(_,[X|_],L).

ostatni1(E,[E]).
ostatni1(E,[_|T]):-
	ostatni1(E,T).

ostatni2(E,L):-
	sklej(_,[E],L).

usun(X,[X|Reszta],Reszta).
usun(X,[Y|Ogon],[Y|Reszta]) :-
	usun(X,Ogon,Reszta).

%analogia do usun(c,X,[a,b,c,d]).
wstaw(X,L,Duza) :-
	usun(X,Duza,L).

nalezy2(X,L) :-
	usun(X,L,_).

zawiera(S,L) :-
	sklej(_,L2,L),
	sklej(S,_,L2).

%%%%%%%%
a2b([],[]).
a2b([a|Ta],[b|Tb]) :-
   a2b(Ta,Tb).


