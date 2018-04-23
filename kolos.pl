







run:-
    p(X),
    q(Y),
    Z is X + Y,
    assert(w(Z)),
    fail.
p(1). p(2).
q(3). q(4). q(5).

prog(1).
prog(X):-
    prog(Y),
    X is Y+1.

dalej(Z):-
    write(Z),
    P is Z + 1,
    dalej(P).


:-dynamic(definicja/2). 
definicja(prolog, wspanialosc). 

poznaj_slowo:-
    write("Podaj trudne slowo: "),nl, 
    read(X),  baza(X). 

baza(X):-
    definicja(X,_),  write("Dziekuje, ale to juz znam"),nl. 

baza(X):-
    \+definicja(X,_),  write('A co to znaczy?'),nl, 
    read(Y),  assert(definicja(X,Y)). 

%!  %%%
:-dynamic(imie/2).
imie(ewa,zenskie).
imie(adam,meskie).

slowo:-
    write('Podaj imie zenskie'), nl,
    read(X),
    szukaj(X).

szukaj(X):-
    imie(X,zenskie),
    write('Takie imie znajduje sie w bazie'), nl.
szukaj(X):-
    \+imie(X,zenskie),
    assert(imie(X,zenskie)),
    write('Dodano'), nl,
    listing(imie(_,zenskie)).

mmm([],L,L).
mmm(L,[],L).
mmm([H1|T1], [H2|T2],[H1|T3]):-
    H1 @< H2,
    mmm(T1, [H2|T2],T3).

mmm([H1|T1],[H2|T2],[H2|T3]):-
    H1 @>= H2,
    mmm([H1|T1],T2,T3).


% abolish/1 pozwala usunąć predykat z bazy wiedzy łącznie z klauzulami.
% (np. abolish(kobieta/1).)
%retractall/1 pozwala usunąć wszyskie
% klauzule danego predykatu z bazy wiedzy. (np. retractall(kobieta(K)).)

%%%%%%% yfx pozwala na zapis ((​aa ma kota ) ma pchly )laczony
%%%%%%% lewostronnie xfx nie pozwala, non-associative
:-op(90,yfx,ma).
ma(ala,kota).
ma(ma(ala,kota), pchly).
%termy dla zapisy xfy laczony prawostronnie
%ma(kota, pchly).
%ma(ala,ma(kota, pchly)).
%
%Cos z Lista
%
%[trace]  ?- term =.. Lista.
%Lista = [term].
%
%[trace]  ?- term(aa,bb,cc) =.. Lista.
%Lista = [term, aa, bb, cc].
%
%[trace]  ?- term(aa,bb(hhh),cc) =.. Lista.
%Lista = [term, aa, bb(hhh), cc].
%

    %%%%%%
kocha(marcellus, mia). 
kocha(vincent, mia). 
kocha(marcellus,vincent). 
zazdrosny(X,Y):-
    kocha(X,Z),kocha(Y,Z),!. 
% ! %%%% kocha(X,Z),kocha(Y,Z),!.  tylko jedno wywolanie, cut zapobiega
% nawrotowi do drugiego punktu wyboru, punktu przed nim
% kocha(X,Z),!,kocha(Y,Z).  2 wywolania, nie nawroci do pierwszego p wy

%
mergee([], L, L). 
mergee(L, [], L). 

mergee(L1, L2, L3):-
    L1 = [H1|T1],
    L2 = [H2|_],
    H1 @< H2, 
    L3 = [H1|T3],
    merge(T1, L2, T3). 

mergee(L1, L2, L3):-
    L1 = [H1|_],
    L2 = [H2|T2],
    H1 @>= H2, 
    L3 = [H2|T3],
    mergee(L1, T2, T3). 



student(szymon, agh). 
student(krzysiek, agh). 
student(weronika, agh). 
student(kasia, agh). 
fajni_studenci:-
     student(X, agh), write(X),fail, write(' nie jest fajny'),!. 
fajni_studenci:- write('oni są fajni'), fail. 
fajni_studenci:- fail, write('Ha! Tylko żartowałem!'), fail. 
fajni_studenci. 








