%member
is_member(X,[X|_]).
is_member(X,[_|Tail]):-is_member(X,Tail).

%third element
third_element([A,B,C|Rest],C).

%first 2 same
first_2_same([A,A,B|Rest],A).

%swap first 2
swap([A,B|Rest],[B,A|Rest]).


%length
list_length([],0).
list_length([_|Tail],K):-list_length(Tail,J),K is J+1.

%list sum
list_sum([],0).
list_sum([X|L],S):-list_sum(L,S1),S is X+S1.

%list min
list_min([X],X).
list_min([X1,X2|L],Y):-min(X1,X2,Z),list_min([Z|L],Y).

min(A,B,A):-A=<B.
min(A,B,B):-A>B.

%list max
max(A,B,A):-A>=B.
max(A,B,B):-B>A.

list_max([X],X).
list_max([X1,X2|L],Y):-max(X1,X2,Z),list_max([Z|L],Y).



%takeout
%when X is taken out of [X|R], R is the result
%when X is taken out of the tail of [X|R], [X|S] is the
%result, where S is the result of taking X out of R
takeout(X,[X|R],R).
takeout(X,[F|R],[F|S]):-takeout(X,R,S).

%last element
last([Y|Z]):-last(Z).
last([X]):-write(X).

%Deleting an element
list_delete(X, [X], []).
list_delete(X,[X|L1], L1).
list_delete(X, [Y|L2], [Y|L1]) :- list_delete(X,L2,L1).

%Append
list_member(X,[X|_]).
list_member(X,[_|TAIL]) :- list_member(X,TAIL).

list_append(A,T,T) :- list_member(A,T),!.
list_append(A,T,[A|T]).


%Dividing a list into 2
list_divide([],[],[]).
list_divide([X],[X],[]).
list_divide([X,Y|Tail], [X|List1],[Y|List2]) :-
list_divide(Tail,List1,List2).

%permutation
list_delete(X,[X|L1], L1).
list_delete(X, [Y|L2], [Y|L1]) :- list_delete(X,L2,L1).

list_perm([],[]).
list_perm(L,[X|P]) :- list_delete(X,L,L1),list_perm(L1,P).

%Reverse
list_concat([],L,L).
list_concat([X1|L1],L2,[X1|L3]) :- list_concat(L1,L2,L3).

list_rev([],[]).
list_rev([Head|Tail],Reversed) :-
list_rev(Tail, RevTail),list_concat(RevTail,[Head],Reversed).

%Orderd List
list_order([X, Y | Tail]) :- X =< Y, list_order([Y|Tail]).
list_order([X]).

%Union
list_member(X,[X|_]).
list_member(X,[_|TAIL]) :- list_member(X,TAIL).

list_union([X|Y],Z,W) :- list_member(X,Z),list_union(Y,Z,W).
list_union([X|Y],Z,[X|W]) :- \+ list_member(X,Z), list_union(Y,Z,W).
list_union([],Z,Z).