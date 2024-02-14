parent(tom,bob).
parent(pam,bob).
parent(tom,liz).
parent(bob,ann).
parent(bob,pat).
parent(pat,jim).

% 1.parent(bob,tom).
% 2.parent(tom,bob).
% 3.parent(X,pat).
% 4.parent(liz,pat).
% 5.parent(tom,ben).
% 6.parent(Y,bob).
% 7.parent(X,Y).
 grandparent(X,Y):-parent(X,Z),parent(Z,Y).
 grandchild(X,Y):-parent(Y,Z),parent(Z,X).
sibilings(X,Y):-parent(Z,X),parent(Z,Y),X=\=Y.
% 12.parent(X,pat).
havingchild(X,Y):-parent(X,Y).
checkhavingchild(X):-parent(X,_).

