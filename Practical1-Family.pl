male(jeya).
male(kishor).
male(bala).
male(ravi).
male(shankar).
male(akash).
male(arul).
male(pram).
male(jeyanth).

female(rani).
female(ratha).
female(jothi).
female(sema).
female(kavitha).
female(satha).
female(ajantha).
female(rohini).
female(annu).
female(suganya).
female(bavana).

parent(jeya,kishor).
parent(jeya,ratha).
parent(jeya,bala).
parent(jeya,ravi).
parent(jeyaa,jothi).
parent(jeya,sema).
parent(bala,ajantha).
parent(bala,arul).
parent(shankar,rohini).
parent(shankar,pram).
parent(akash,annu).
parent(akash,jeyanth).
parent(ravi,suganya).
parent(ravi,bavana).

married(jeya,rani).
married(bala,kavitha).
married(shankar,jothi).
married(akash,sema).
married(ravi,satha).

elder_brother(kishor,bala).
elder_brother(kishor,ravi).

younger_brother(ravi,bala).

elder_sister(ratha,jothi).
elder_sister(ratha,sema).

younger_sister(sema,jothi).

%Rules

husband(X,Y):-married(X,Y),male(X).
wife(X,Y):-married(Y,X),female(X).
father(X,Y):-parent(X,Y),male(X).
mother(X,Y):-parent(X,Y),female(X).
son(X,Y):-parent(Y,X),male(X).
daughter(X,Y):-parent(Y,X),female(X).
sibling(X,Y):-parent(Z,X),parent(Z,Y).
brother(X,Y):-sibling(X,Y),male(X).
sister(X,Y):-sibling(X,Y),female(X).
grandparent(X,Y):-parent(X,Z),parent(Z,Y).
grandfather(X,Y):-grandparent(X,Y),male(X).
grandmother(X,Y):-grandparent(X,Y),female(X).
grandchildren(X,Y):-grandparent(Y,X).
uncle(X,Y):-parent(Z,Y),younger_brother(X,Z),male(X).
aunty(X,Y):-parent(Z,Y),younger_sister(X,Z),female(X).
father_in_law(X,Y):-parent(Z,Y),elder_brother(X,Z),male(X).
mother_in_law(X,Y):-parent(Z,Y),elder_sister(X,Z),female(X).

