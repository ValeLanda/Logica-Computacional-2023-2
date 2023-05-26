% Ejercicio 1.

sumaList([], 0).
sumaList([X|L], N) :- sumaList(L, M), N is M + X.

auxCombina([], _, []).
auxCombina([X | List1], Sum , [Y | List2]) :-
    auxCombina(List1, Sum, List2),
    Y is X + Sum.

combina(L1, L2) :- 
    sumaList(L1, Sum),
	auxCombina(L1, Sum, L2).



% Ejercicio 2.

decreciente([]).
decreciente([_]).
decreciente([X|[Y|L]]) :- decreciente([Y|L]), X > Y.

convexo([]).
convexo([_]).
convexo([X|[Y|L]]) :- X > Y, decreciente([Y|L]).
convexo([X|[Y|L]]) :- X < Y, convexo([Y|L]).



% Ejercicio 3.

decimal_binario(0, '0').
decimal_binario(1, '1').
decimal_binario(D, B) :- 
    D > 1,
    R is D mod 2,
    C is D // 2,
    decimal_binario(C, B2),
    atom_concat(B2, R, B).



% Ejercicio 4.

% En el contexto de que nuestro universo es U = {2,3,6,12}.

divide(2,6).
divide(2,12).
divide(3,6).
divide(3,12).
divide(6, N) :- divide(2,N), divide(3,N). 

% ¿ Existe algún multiplo de 2?
multiplo(N, 2) :- divide(2, N).
% Si evaluamos multiplo(N,2)

% ¿ Existe algún multiplo de 6?
multiplo(N, 6) :- divide(6, N).
% Si evaluamos multiplo(N,2)

% ¿Cuáles son los divisores de 6?
aux_divisores([], 0, _).
aux_divisores([X|L], M, N) :- 
    divide(M,N),
    X is M,
    M2 is M - 1,
    aux_divisores(L, M2,N).
aux_divisores(L, M, N) :- 
    not(divide(M,6)),
    M2 is M - 1,
    aux_divisores(L, M2, N).

divisores(L,N) :- aux_divisores(L,N,N).