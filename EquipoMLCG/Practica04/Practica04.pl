/*  Practica 03

    Equipo MLCG
    Lira Rivera Moises Abraham 319029930
    Jose Camilo Garcia Ponce 319210536
*/

/* 2) Funcion que devuelve el maximo de una lista */
max([],0).
max([X],X).
max([X|XS],Y):- max(XS,Z), X>=Z, Y is X.
max([X|XS],Y):- max(XS,Z), X<Z, Y is Z.

/* 4) Funcion de Fibonacci */
fibbo(0,0).
fibbo(1,1).
fibbo(N,F):- N>1, N1 is N-1, N2 is N-2, fibbo(N1,F1), fibbo(N2,F2), F is F1+F2.