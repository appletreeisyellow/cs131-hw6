/* Name:  

   UID:  

   Others With Whom I Discussed Things: TA
   
   Other Resources I Consulted: 
   
*/


/* 1. */

duplist([], []).

duplist([H | T1], [H, H| T2]) :-
	T2 \== [] -> duplist(T1, T2); duplist(T2, T1).

/* 2. */

subseq([], []).

subseq(R, [_|T]) :-
	subseq(R, T).

subseq([H|R], [H|T]) :-
	subseq(R, T).


/* 3. */

va_helpper(New_List, Prev_List, Cin, Word1, Word2, Word3) :-
	Word1 \== [], Word2 \== [] -> 
		Word1 = [H1|T1],
		Word2 = [H2|T2],
		Word3 = [H3|T3],
		H3 #= (Cin + H1 + H2) rem 10,
		Cout #= (Cin + H1 + H2) // 10,
		append(Prev_List, [H3], Current_List), 
		va_helpper(New_List, Current_List, Cout, T1, T2, T3);

	Word1 == [], Word2 \== [] -> 
		Word2 = [H2|T2],
		Word3 = [H3|T3],
		H3 #= (Cin + H2) rem 10,
		Cout #= (Cin + H2) // 10, 
		append(Prev_List, [H3], Current_List),
		va_helpper(New_List, Current_List, Cout, [], T2, T3);

	Word1 \== [], Word2 == [] -> 
		Word1 = [H1|T1],
		Word3 = [H3|T3],
		H3 #= (Cin + H1) rem 10,
		Cout #= (Cin + H1) // 10,
		append(Prev_List, [H3], Current_List),
		va_helpper(New_List, Current_List, Cout, T1, [], T3);

	Word1 == [], Word2 == [], Word3 \== [] -> 
		Word3 = [Cin],
		append(Prev_List, Word3, New_List);

	Word1 == [], Word2 == [], Word3 == [] -> 
		Prev_List = New_List.
	
/* Base Case */
verbalarithmetic(Result, [W1], [W2], [W3]) :-
	fd_domain(Result, 0, 9),
	W3 #= W1 + W2,
	fd_labeling(Result),
	W1 \== 0,
	W2 \== 0,
	W3 \== 0,
	fd_all_different(Result).

verbalarithmetic(Result, [W1], [W2], [W3h, W3t]) :-
	fd_domain(Result, 0, 9),
	W3t #= (W1 + W2) rem 10,
	W3h #= (W1 + W2) // 10,
	fd_labeling(Result),
	(W1 \== 0),
	(W2 \== 0),
	(W3h \== 0),
	fd_all_different(Result). 


verbalarithmetic(Result, [H1|T1], [H2|T2], [H3|T3]) :-
	fd_domain(Result, 0, 9),
	fd_domain(H1, 1, 9),
	fd_domain(H2, 1, 9),
	fd_domain(H3, 1, 9),
	reverse([H1|T1], Rev_Word1),
	reverse([H2|T2], Rev_Word2),
	reverse([H3|T3], Rev_Word3),
	va_helpper(Rev_Word3, [], 0, Rev_Word1, Rev_Word2, Rev_Word3),
	fd_labeling(Result),
	fd_all_different(Result).




/* 4. */
pickup(_, _).
putdown(_, _).

/* ----- pickup action ----- */

/* pickup from stack1 */
action(Start, Action, End) :- 
	Start = world([H1|T1], Stack2, Stack3, none),
	Block = H1,
	Action = pickup(H1, stack1),
	End = world(T1, Stack2, Stack3, Block).

/* pickup from stack2 */
action(Start, Action, End) :-
	Start = world(Stack1, [H2|T2], Stack3, none),
	Block = H2,
	Action = pickup(H2, stack2),
	End = world(Stack1, T2, Stack3, Block).

/* pickup from stack3 */
action(Start, Action, End) :-
	Start = world(Stack1, Stack2, [H3|T3], none),
	Block = H3,
	Action = pickup(H3, stack3),
	End = world(Stack1, Stack2, T3, Block).

/* ----- putdown action ----- */

/* putdown to stack1 */

action(Start, Action, End) :-
	Start = world(Stack1, Stack2, Stack3, Block),
	\+(Block = none), /* Robot does hold a block. */
	Action = putdown(Block, stack1),
	End = world([Block|Stack1], Stack2, Stack3, none).

/* putdown to stack2 */
action(Start, Action, End) :-
	Start = world(Stack1, Stack2, Stack3, Block),
	\+(Block = none),
	Action = putdown(Block, stack2),
	End = world(Stack1, [Block|Stack2], Stack3, none).

/* putdown to stack3 */
action(Start, Action, End) :-
	Start = world(Stack1, Stack2, Stack3, Block),
	\+(Block = none),
	Action = putdown(Block, stack3),
	End = world(Stack1, Stack2, [Block|Stack3], none).




blocksworld(world(stack1, stack2, stack3, none), [], world(stack1, stack2, stack3, none)).

blocksworld(StartWorld, [Action|Actions], GoalWorld) :-
	action(StartWorld, Action, CurrentWorld), blocksworld(CurrentWorld, Actions, GoalWorld).





