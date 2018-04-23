rodzic(kasia,robert).
rodzic(tomek,robert).
rodzic(tomek,eliza).

rodzic(robert,anna).
rodzic(robert,magda).

rodzic(magda,jan).

kobieta(kasia).
kobieta(eliza).
kobieta(magda).
kobieta(anna).

mezczyzna(tomek).
mezczyzna(robert).
mezczyzna(jan).

matka(X,Y) :-
	rodzic(X,Y),
	kobieta(X).

ojciec(X,Y) :-
	rodzic(X,Y),
	mezczyzna(X).
rodzenstwo(X,Y) :-
	rodzic(Z, X),
	rodzic(Z, Y),
	X \= Y.
brat(X,Y) :-
	rodzenstwo(X,Y),
	mezczyzna(X).
siostra(X,Y) :-
	rodzenstwo(X,Y),
	kobieta(X).
dziadek(X,Y) :-
	rodzic(Z,Y),
	rodzic(X,Z),
	mezczyzna(X).
babcia(X,Y) :-
	rodzic(Z,Y),
	rodzic(X,Z),
	kobieta(X).

przodek(X,Y) :-
	rodzic(X,Y).

przodek(X,Z) :-
	rodzic(X,Y),
	przodek(Y,Z).


potomek(X,Y) :-
	rodzic(Y,X).
potomek(X,Y) :-
	rodzic(Z,X),
	potomek(Z,Y).

krewny(X,Y) :-
	rodzic(X,Y).
krewny(X,Y) :-
	rodzenstwo(X,Y).
krewny(X,Y) :-
	potomek(X,Y).
krewny(X,Y) :-
	przodek(X,Y).


pop([T|S],T,S).

pussh(T,S,[T|S]).
