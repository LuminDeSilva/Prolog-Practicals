%state(monkey-horizontal, monkey-vertical,box location, has/ has not
% banana).


initial_state(state(door,onfloor,window,hasnot)).
goal_state(state(middle,onbox,middle,has)).

move(state(middle,onbox,middle,hasnot),grasp,state(middle,onbox,middle,has)).
move(state(P,onfloor,P,hasnot),climb,state(P,onbox,P,hasnot)).
move(state(P,onfloor,P,hasnot),push(P,P1),state(P1,onfloor,P1,hasnot)).
move(state(P1,onfloor,B,hasnot),walk(P1,P2),state(P2,onfloor,B,hasnot)).


go:-initial_state(S), goal_state(G), canGet(S,G,L), writeActionList(L).

canGet(S,S,[]).
canGet(S1,S2,[H|T]):-move(S1,H,S),canGet(S,S2,T).

writeActionList([]).
writeActionList([H|T]):-writeAction(H), writeActionList(T).

writeAction(climb):-write('Monkey climb the box'),nl.
writeAction(grasp):-write('Monkey grasp the banana'),nl.
writeAction(walk(A,B)):-write('Monkey walk from ':A:' to ':B:' '),nl.
writeAction(push(A,B)):-write('Monkey push the box from ':A:' to ':B:' '),nl.


