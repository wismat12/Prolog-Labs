


liczba(1).
liczba(X):-
    liczba(Y),
    X is Y+1.


drugie([X,Y|T], L) :- append([Y|T], [X], L).

rej([H|T], L):-
    sklej(T, [H], L).


sklej([],X,X).
sklej([X|L1],L2,[X|L3]) :-
	sklej(L1,L2,L3).


stos(S,T,[T|S]).
pop([T|S],T,S).

push(S,T,[T|S]).





%zad1 2016
ksiazka(16, 'Flatlandia', autor('Edvin Abbot', 1838-1926), wydanie('Sell & Co', 1884)). 
ksiazka(28, 'R. U. R.', autor('Karel Capek', 1890-1938), wydanie('Palyers Press', 2002)). 
ksiazka(34, 'Kobieta z wydm', autor('Kobo Abe', 1924-1993), wydanie('Wydawnictwo  Znak', 2007)). 
ksiazka(36, 'Zamek', autor('Frans Kafka', 1883-1924), wydanie('Zielona Sowa', 2001)). 
ksiazka(37, 'Gargantua i Pantagruel', autor('Francois Rabelais', 1494-1553),  wydanie('Siedmioróg', 2004)).

poSmiertnie(T):-
	ksiazka(_,T,autor(_,_-Smierc),wydanie(_,RokW)),
	Smierc < RokW.
zazycia(T):-
	ksiazka(_,T,autor(_,_-S),wydanie(_,W)),
	W < S.

warunek(T,Rok):-
	ksiazka(_,_,_,wydanie(T,W)),
	W < Rok.
przedrokiem(T,Rok):-
	setof(T,warunek(T,Rok),L),
	write(L).



% dane

rodzina(
	osoba(jan, kowalski,data(5,kwiecien,1946), pracuje(tpsa,3000)),
	osoba(anna,kowalski,data(8,luty,1949), pracuje(szkola,1500)),
	[
	 osoba(maria,kowalski,data(20,maj,1973), pracuje(argo_turist,4000)),
	 osoba(pawel,kowalski,data(15,listopad,1979), zasilek)
	]).

rodzina(
	osoba(krzysztof, malinowski, data(24,lipiec,1950), bezrobocie),
	osoba(klara, malinowski, data(9,styczen,1951), pracuje(kghm,8000)),
	[
	 osoba(monika, malinowski, data(19,wrzesien,1980), bezrobocie)
	]).

% zaleznosci

maz(X) :-
	rodzina(X,_,_).

zona(X) :-
	rodzina(_,X,_).

dziecko(X) :-
	rodzina(_,_,Dzieci),
	nalezy(X,Dzieci).

istnieje(Osoba) :-
	maz(Osoba)
	;
	zona(Osoba)
	;
	dziecko(Osoba).

data(osoba(_,_,data(_,_,Data),_),Data).
data_urodzenia(Osoba,Data):-
	dziecko(Osoba),
	data(Osoba,Data).

znajdzz(osoba(_,_,_,pracuje(_,_))).
znajdzzone(Os):-
	zona(Os),
	znajdzz(Os), write(Os), nl, fail.
znajdzzone(_).




pensja(osoba(_,_,_,pracuje(_,P)),P).
pensja(osoba(_,_,_,zasilek),500).
pensja(osoba(_,_,_,bezrobocie),0).
pensja(Osoba):-
	istnieje(Osoba),
	pensja(Osoba,P),
	Osoba =.. Lista,
	Lista = [_,Imie,Nazw|_],
	write(Imie), write(' '), write(Nazw), write(' '), write(P), nl,
	fail.
pensja(_).


przed(X,Year,Salary):-
	istnieje(X),
	data(X,Data),
	Data < Year,
	pensja(X,P),
	P < Salary.

zarobki([],0).
zarobki([Osoba|Lista],Suma) :-
	pensja(Osoba,S),
	zarobki(Lista,Reszta),
	Suma is S + Reszta.

% narzedzia
nalezy(X,[X|_]).
nalezy(X,[_|Yogon]) :-
	nalezy(X,Yogon).
