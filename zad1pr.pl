num(10).

data(N,L) :-
   N > 0 ,X is random(L), assert(num(X)), N1 is N - 1, data(N1,L); N == 0, listing(num).
best(B) :-
   findall(X, num(X), Integers), max_list(Integers, B).
%count(Min,Max,N) - oblicza N ozn. ile liczb w predykacie data miesci sie w przedziale min max

count(Min,Max,N) :-
   findall(X, num(X), Integers), findall(Y, between(Min, Max, Y), Int2), intersection(Integers,Int2,Result), length(Result,N).
