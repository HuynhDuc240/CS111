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
parent(f,i).
parent(c,g).
parent(c,h).
parent(e,g).
parent(e,h).
parent(k,m).
parent(e,m).
parentInLaw(X,Y):- parent(X,Z), married(Z,Y).
mother(X,Y):- (parent(X,Y); parentInLaw(X,Y)), sex(X, female).
father(X,Y):- (parent(X,Y); parentInLaw(X,Y)), sex(X, male).
%child
child(X,Y):- parent(Y,X).
childInLaw(X,Y):- parentInLaw(Y,X).
son(X,Y):- (child(X,Y) ; childInLaw(X,Y)), sex(X,male).
daughter(X,Y):- (child(X,Y) ; childInLaw(X,Y)), sex(X, female).


brother(X,Y):- parent(Z,Y), parent(Z,X), sex(X, male).
sister(X,Y):- parent(Z,Y), parent(Z,X), sex(X, female).
% youngBrother(X,Y):- brother(X,Y), age(X,?) < age(Y,?);    













