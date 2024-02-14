%Predicate state consist of the position of farmer,goat,wolf,grass.
initial_state(state(east,east,east,east)).
goal_state(state(west,west,west,west)).

unsafe(state(B,A,A,_)):-notequal(A,B).
unsafe(state(B,A,_,A)):-notequal(A,B).

notequal(east,west).
notequal(west,east).

write_action(move1(P1,P2)):-write('Farmer goes with goat from '),write(P1),write(' to '),write(P2),nl.
write_action(move2(P1,P2)):-write('Farmer goes alone from '),write(P1),write(' to '),write(P2),nl.
write_action(move3(P1,P2)):-write('Farmer goes with wolf from '),write(P1),write(' to '),write(P2),nl.
write_action(move4(P1,P2)):-write('Farmer goes with grass from '),write(P1),write(' to '),write(P2),nl.


travel(state(P1,P1,A,B),move1(P1,P2),state(P2,P2,A,B)):-notequal(P1,P2),not(unsafe(state(P2,P2,A,B))).
travel(state(P1,A,B,C),move2(P1,P2),state(P2,A,B,C)):-notequal(P1,P2),not(unsafe(state(P2,A,B,C))).
travel(state(P1,A,P1,B),move3(P1,P2),state(P2,A,P2,B)):-notequal(P1,P2),not(unsafe(state(P2,A,P2,B))).
travel(state(P1,A,B,P1),move4(P1,P2),state(P2,A,B,P2)):-notequal(P1,P2),not(unsafe(state(P2,A,B,P2))).

write_action_list([]).
write_action_list([H|T]):-write_action(H),write_action_list(T),!.

can(S,S,_,[]).
can(S1,S2,V,[A|L]):-travel(S1,A,T),not(member(T,V)),can(T,S2,[T|V],L).

go:-initial_state(S),goal_state(G),can(S,G,[S],L),write_action_list(L),!.



