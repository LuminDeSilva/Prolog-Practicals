/* You are given with two jugs, a 4-liter one and a 3-liter one
a pump which has unlimited water which you can use to fill the jug.
and the ground on which water may be poured. Neither jug has any
measuring mark on it*/

init_state(state(0,0)).
goal_state(state(2,0)).

write_action(action1):-write('Fill the large jug(4l)'),nl.
write_action(action2):-write('Fill the small jug (3l)'),nl.
write_action(action3):-write('Empty the small jug (3l)'),nl.
write_action(action4):-write('Empty the large jug (4l)'),nl.
write_action(action5):-write('Fill the large jug (4l) transfer from small jug (3l)'),nl.
write_action(action6):-write('Fill the small jug (3l) transfer from large jug (4l)'),nl.
write_action(action7):-write('Empty the large jug (4l) by filling small jug (3l)'),nl.
write_action(action8):-write('Empty the small jug (3l) by filling large jug (4l)'),nl.

fill(state(L,S),action1,state(4,S)):-L<4.
fill(state(L,S),action2,state(L,3)):-S<3.
fill(state(L,S),action3,state(L,0)):-S>0.
fill(state(L,S),action4,state(0,S)):-L>0.
fill(state(L,S),action5,state(4,T)):-L<4,T is L+S-4,S>0.
fill(state(L,S),action6,state(T,3)):-S<3,T is L+S-3,L>0.
fill(state(L,S),action7,state(0,T)):-L>0,T is S+L,S<3.
fill(state(L,S),action8,state(T,0)):-S>0,T is L+S, L<4.

write_action_list([]).
write_action_list([H|T]):- write_action(H),write_action_list(T),!.

member(X,[X|_]):-!.
member(X,[_|L]):-member(X,L).

can_fill(S,S,P,P):-!.
can_fill(S1,S2,M,[A|T]):-fill(S1,A,S3),not(member(S3,M)),can_fill(S3,S2,[S3|M],T),!.

go:-init_state(S),goal_state(G),can_fill(S,G,[S],L),write_action_list(L),!.