
% Ejercicio1.

/*
Función que suma los elementos de una lista de forma recursiva.
Es implementada para poder realizar la suma al elemento de la lista.
*/
sumL([],0).
sumL([X|XS], N) :- sumL(XS, N1), N is N1 + X.

/*
Función auxiliar de Combina que almacena la suma de la lista para
de esta forma no perder el resultado de la suma al hacer recursión.
*/
combina1([],[], _).
combina1([X|XS], [Y|YS], N) :- combina1(XS, YS, N), Y is X + N.

/*
Combina, función que recibe una lista y dada esa lista devuelve
una nueva lista compuesta por la suma de todos los elementos en 
la lista otorgada como parametro más el elemento en la i-esima
posición donde se está haciendo la recursión.
*/
combina([], []).
combina([X|XS], [Y|YS]) :- sumL([X|XS],N), combina1([X|XS], [Y|YS], N).

% Ejercicio2.

/*
Función que toma una lista y verifica que los elementos sean
crecientes, en caso de no serlos se verifica que hasta el final
de la lista sean decrecientes.
*/
creciente([_]).
creciente([X|[X1|XS]]) :- X =< X1, creciente([X1|XS]).
creciente([X|[X1|XS]]) :- X > X1, decreciente([X1|XS]).

/*
Función que recibe una lista y verifica que todos los elementos
en ella sean decrecientes.
*/
decreciente([_]).
decreciente([X|[X1|XS]]) :- X > X1, decreciente([X1|XS]).

/*
Función que verifica si una lista en convexa, es decir
si sus elementos al inicio son crecientes y una vez que 
deja de crecer no vuelve a hacerlo.
*/
convexo([]).
convexo([X|XS]) :- creciente([X|XS]).

% Ejercicio3.

/*
Funcíon que convierte un número en decimal a una cadena
que corresponde a su representación en binario.
Para esto se toma el metodo visto en clase donde donde al
se concatema la cadena previamente almacenada con el residuo
y se hace recursión sobre el resultado.
*/
decimal_binario(0, '0').
decimal_binario(1, '1').
decimal_binario(D, B) :- D > 1, RESIDUO is D mod 2, RESULTADO is D // 2, 
    decimal_binario(RESULTADO, C), atom_concat(B2, RESIDUO, C).

% Ejercicio 4.

/*
Conocimiento otorgado por el ejercicio.
*/
divide(2,6).
divide(2,12).
divide(3,6).
divide(3,12).
divide(6, N) :- divide(2,N), divide(3,N). 

/*
Verificamos que exista un multiplo de 2.
Efectivamente existe pues se evalua en True.
*/
multiplo2 :- divide(2, _).

/*
Verificamos los divisores de una lista para esto tenemos dos números,
el que recibimos como parametro es decir del que buscamos los divisores
y un M que comienza en el que recibimos y se resta uno en caso de que divida
se agrega a la lista en otro solo se salta.
*/
divisores([], 0, _).
divisores([X|XS], M, N) :- divide(M,N), X is M, M1 is M - 1, divisores(XS, M1,N).
divisores(XS, M, N) :- not(divide(M,6)), M1 is M - 1, divisores(XS, M1, N).

/*
Devolve,os la lista con todos los divisores.*/
divisores6(XS) :- divisores(XS,6,6).

/*
Verificamos que exista un multiplo de 6.
Efectivamente existe pues se evalua en True.
*/
multiplo6 :- divide(6, _).