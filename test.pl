/* 1. */
duplist([], []).
duplist([1], [1, 1]).
duplist([1, 2, 3], [1, 1, 2, 2, 3, 3]).
/* 1, 1, 2, 2, 3, 3 */


/* 2. */
findall(X, subseq(X, []), List),
permutation(List, [[]]).

findall(X, subseq(X, [1, 1]), List),
permutation(List, [[1,1],[1],[],[1]]).

findall(X, subseq(X, [1, 2, 3, 4]), List),
permutation(List, [[1,2,3,4],[2,3,4],[3,4],[4],[],[3],[2,4],[2],[2,3],[1,3,4],[1,4],[1],[1,3],[1,2,4],[1,2],[1,2,3]]).

findall(X, subseq(X, [1, 2, 3, 3]), List), 
permutation(List, [[1,2,3,3],[2,3,3],[3,3],[3],[],[3],[2,3],[2],[2,3],[1,3,3],[1,3],[1],[1,3],[1,2,3],[1,2],[1,2,3]]).



/* 3. */
verbalarithmetic([C,O,A,L,S,I],[C,O,C,A],[C,O,L,A],[O,A,S,I,S]) :-
	C1 #= (A + A) // 10,
	C2 #= (C + L) // 10,
	C3 #= (O + O) // 10,
	O #= (C + C) // 10,
	S #= (A + A) rem 10,
	I #= (C + L + C1) rem 10,
	S #= (O + O + C2) rem 10,
	A #= (C + C + C3) rem 10,
	fd_domain([C,O,A,L,S,I], 0, 9), 
	fd_all_different([C,O,A,L,S,I]).

verbalarithmetic([P,L,A,Y,S,W,E,B,T,R], [P,L,A,Y,S], [W,E,L,L], [B,E,T,T,E,R]).
/* 
P = 9
L = 7
A = 4
Y = 2
S = 6
W = 8
E = 0
B = 1
T = 5
R = 3
*/

/* 4 */

length(Actions,L), blocksworld(world([a,b,c],[],[],none), Actions, world([],[],[a,b,c],none)).

length(Actions,L), blocksworld(world([],[],[],none), Actions, world([],[],[],none)). 

length(Actions,L), blocksworld(world([a, b], [], [c, d],none), Actions, world([d, c], [b, a], [], none)).


