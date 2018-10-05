tail([_|T],T).
head([H|_],H).

sum([],0). % stop condition
sum([H|T],S):-
    sum(T,M),
    S is H + M.


on(Item,[Item|T]).
on(Item,[H|T]):-
    on(Item,T).


move(A,B):-
    nl, write('Move topmost dics from '),
    write(A), write(' to '), write(B).

transfer(1,A,B,I) :- move(A,B).
transfer(N,A,B,I) :-
    M is N-1, 
    transfer(M,A,I,B),  % Transfer topmost N-1 discs from A to I
    move(A,B),          % Move biggest disc from A to B
    transfer(M,I,B,A).  % Transfer remaining N-1 discs from I to B


searchElement(N,[N|T],0).
searchElement(N,[H|T],L):-
    searchElement(N,T,M),
    L is 1 + M.

