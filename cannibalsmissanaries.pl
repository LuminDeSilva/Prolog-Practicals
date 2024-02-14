unsafe(state_w(M, C, _)):- M>0, C>M,!.  %on the west
unsafe(state_w(M, C, _)):- M<3, M>C.    %on the east 3-C > 3-M >0

move(state_w(M, C, 1), state_w(M1, C, 0),'A Missionary goes alone from west to east'):-
	M>0,  M1 is M-1.

% M>0 means M>=1, unless there is one missionary, this action is not possible

move(state_w(M, C, 1), state_w(M2, C, 0),'Two Missionaries go  from west to east'):-
	M>1, M2 is M-2.

move(state_w(M, C, 1), state_w(M1, C1, 0),'A cannibal and a Missionary go  from west to east'):-
	C>0, M>0, M1 is M-1, C1 is C-1.

move(state_w(M, C, 1), state_w(M, C1, 0),'A cannibal goes  from west to east'):-
	C>0, C1 is C-1.

move(state_w(M, C, 1), state_w(M, C2, 0),'Two Cannibals go  from west to east'):-
	C>1, C2 is C-2.


% Moves from East to West

move(state_w(M, C, 0), state_w(M1, C, 1),'A Missionary goes alone from east to west'):-
	M<3, M1 is M+1.  %3-M>0

move(state_w(M, C, 0), state_w(M2, C, 1),'Two Missionaries go from east to west'):-
	M<2, M2 is M+2.  %3-M>1

move(state_w(M, C, 0), state_w(M1, C1, 1),'A cannibal and a Missionary go  from east to west'):-
	C<3, M<3, M1 is M+1, C1 is C+1.   %3-M>0, 3-C >0


move(state_w(M, C, 0), state_w(M, C1, 1),'A cannibal goes  from east to west'):-
	C<3, C1 is C+1.  %3-C > 0

move(state_w(M, C, 0), state_w(M, C2, 1),'Two Cannibals go  from east to west'):-
	C<2, C2 is C+2.  %3-C >1.


find_actions_path(GS,[GS|Path],Actions,Actions,[GS|Path]).

find_actions_path(GS,[CS|PathSf],ActionsSf,ActionPlan,FinalPath):-
	CS\=GS,
	move(CS, NS, Action),
	not(unsafe(NS)),
	not(member(NS, PathSf)),
	find_actions_path(GS,[NS, CS|PathSf],[Action|ActionsSf],ActionPlan, FinalPath).

get_actions_path(CS, GS, ActPlan, Path):-
find_actions_path(GS, [CS], [], ActPlan, Path).


solve:-	get_actions_path(state_w(3,3,1), state_w(0,0,0),AP, P),
        reverse(P, P1),
        reverse(AP, AP1),
		write(P1), nl,
        write('Actions '), nl, write('======='), nl,
	    print_list(AP1).

print_list([H|T]):-write(H), nl,print_list(T).
print_list([]).


print_list_in_reverse([H|T]):-print_list_in_reverse(T),write(H), nl.
print_list_in_reverse([]).




















