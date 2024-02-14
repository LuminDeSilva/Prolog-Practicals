%bubble sort
bubblesort([],[]).
bubblesort([X],[X]).
bubblesort(List, Sorted):-swap(List,List1),bubblesort(List1,Sorted).
bubblesort(Sorted,Sorted).

%merge sort

swap([X,Y|R],[Y,X|R]):-X>Y.
swap([Z|R],[Z|R1]):-swap(R,R1).

msort([First,Second|Rest],Result) :-!,
    partition([First,Second|Rest],L1,L2),
    msort(L1,SL1),
    msort(L2,SL2),
    merge(SL1,SL2,Result).
msort(List,List).

partition([First,Second|Rest],[First|F],[Second|S]) :- % >= 2 elements
    !,
    partition(Rest,F,S).
partition(List,List,[]).


%quick sort
quicksort([],[]).
quicksort([X],[X]).
quicksort([H|T],SL):-split(H,T,Sml,Bl),
    quicksort(Sml,SSml),
    quicksort(Bl,SBl),
    concatenate(SSml,[H|SBl],SL).

split(X,[],[],[]).
split(X,[H1|T1],[H1|Sml],Bl):-X>H1,
    split(X,T1,Sml,Bl).

split(X,[H1|T1],Sml,[H1|Bl]):-
    split(X,T1,Sml,Bl).


concatenate([],L,L).
concatenate([X|L1],L2,[X|L3]):-concatenate(L1,L2,L3).
