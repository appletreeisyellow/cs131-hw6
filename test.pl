
duplist([], []).
duplist([1], [1, 1]).
duplist([1, 2, 3], [1, 1, 2, 2, 3, 3]).
/* 1, 1, 2, 2, 3, 3 */


findall(X, subseq(X, [1, 2, 3,4]), List), length(List, Length).

