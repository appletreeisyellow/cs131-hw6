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


/* 3. 
getTheLastElem(R, [H | T]) :-
	T \== [] -> getTheLastElem(R, T); R = H.

verbalarithmetic(Result, World1, World2, World3) :-
	getTheLastElem(E1, World1), getTheLastElem()*/








