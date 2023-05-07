/*  Practica 03

    Equipo MLCG
    Lira Rivera Moises Abraham 319029930
    Jose Camilo Garcia Ponce 319210536
*/

/* 3) Funcion de Fibonacci */
fibbo(0,0).
fibbo(1,1).
fibbo(N,F):- N>1, N1 is N-1, N2 is N-2, fibbo(N1,F1), fibbo(N2,F2), F is F1+F2.