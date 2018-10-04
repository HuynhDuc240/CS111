% age
age(a,60).
age(b,55).
age(c,38).
age(d,35).
age(e,35).
age(f,37).
age(g,10).
age(h,8).
age(k,12).
age(i,9).
age(m,12).

% sex
sex(a, male).
sex(b, female).
sex(c, male).
sex(d, female).
sex(e, female).
sex(f, male).
sex(g, female).
sex(h, male).
sex(k, male).
sex(i, male).
sex(m, male).

% relationship:
%marriage:
married(a,b).
married(b,a).
married(d,f).
married(f,d).
married(c,e).
married(e,c).
oldMarried(k,e).
oldMarried(e,k).
% husband or wife
husband(X,Y):-
    married(X,Y), sex(X, male).
wife(X,Y):-
    married(X,Y), sex(X, female).
oldHusband(X,Y):-
    oldMarried(X,Y), sex(X, male).
oldWife(X,Y):-
    oldMarried(X,Y), sex(X, female).
%parent
parent(a,c).
parent(a,d).
parent(b,c).
parent(b,d).
parent(d,i).
parent(f,i).
parent(c,g).
parent(c,h).
parent(e,g).
parent(e,h).
parent(k,m).
parent(e,m).
parentInLaw(X,Y):- parent(X,Z), married(Z,Y).
mother(X,Y):- parent(X,Y), sex(X, female).
father(X,Y):- parent(X,Y), sex(X, male).
mortheInLaw(X,Y):- sex(X, female), parentInLaw(X,Y).
fatherInLaw(X,Y):- sex(X, male), parentInLaw(X,Y).
%child
child(X,Y):- parent(Y,X).
childInLaw(X,Y):- parentInLaw(Y,X).
son(X,Y):- child(X,Y), sex(X,male).
daughter(X,Y):- child(X,Y), sex(X, female).
sonInLaw(X,Y):- sex(X,male), childInLaw(X,Y).
daughterInLaw(X,Y):- sex(X, female), childInLaw(X,Y).

% Brother and sister and half this
brother(X,Y):- 
    sex(X, male), 
    mother(Z,X),
    mother(Z,Y),
    father(K,X),
    father(K,Y),
    X \= Y.

sister(X,Y):- 
    sex(X, female), 
    mother(Z,X),
    mother(Z,Y),
    father(K,X),
    father(K,Y),
    X \= Y.

halfBrother(X,Y):- 
    sex(X, male), 
    mother(Z,X),
    mother(Z,Y),
    father(K,X) \= father(K,Y),
    \+ brother(X,Y),
    X \= Y.
halfSister(X,Y):- 
    sex(X, female), 
    mother(Z,X),
    mother(Z,Y),
    father(K,X) \= father(K,Y),
    \+ sister(X,Y),
    X \= Y.
%youngBrother(X,Y):-
%oldBrother(X,Y):-

brotherInLaw(X,Y):- 
    sex(X, male), (brother(Z,Y); sister(Z,Y)), married(X,Z);
    sex(X, male), (brother(Z,H); sister(Z,H)), married(X,Z), married(H,Y);
    sex(X, male), (brother(X,Z); sister(X,Z)), married(Z,Y).
sisterInLaw(X,Y):- 
    sex(X, female), (brother(Z,Y); sister(Z,Y)), married(X,Z);
    sex(X, female), (brother(Z,H); sister(Z,H)), married(X,Z), married(H,Y);
    sex(X, female), (brother(X,Z); sister(X,Z)), married(Z,Y).

cousin(X,Y):- 
    parent(M,X), parent(N,Y), (brother(M,N); sister(M,N)).  
% grandfather and grandmother

grandfather(X,Y):- sex(X, male), parent(X,Z), parent(Z,Y).
grandmother(X,Y):- sex(X, female), parent(X,Z), parent(Z,Y).
grandchild(X,Y):- grandfather(Y,X); grandmother(Y,X).

% uncle and aunt
uncle(X,Y):- (brother(X,Z), child(Y,Z));
            sex(X,male),
            (brother(K,Z); sister(K,Z)),
            married(X,K),
            child(Y,Z).
aunt(X,Y):-  (sister(X,Z), child(Y,Z));
            sex(X,female),
            (brother(K,Z); sister(K,Z)),
            married(X,K),
            child(Y,Z).

%nephew
nephew(X,Y):- uncle(Y,X) ; aunt(Y,X).









