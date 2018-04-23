delta(A,B,C,Wynik):-
    Wynik is ((B*B) - (4*A*C)).
kwadrat(A,B,C,W):-
    delta(A,B,C,Del),
    Del < 0,
    W = 'Brak',
    write('Brak mz').
kwadrat(A,B,C,W):-
    delta(A,B,C,Del),
    Del == 0,
    W is -B / 2 * A,
    write('1 mz:').
kwadrat(A,B,C,W):-
    delta(A,B,C,Del),
    Del > 0,
    X1 is (-B - sqrt(Del))/(2 * A),
    X2 is (-B + sqrt(Del))/(2 * A),
    W = [X1,X2],
    write('S¹ dwa: ').

