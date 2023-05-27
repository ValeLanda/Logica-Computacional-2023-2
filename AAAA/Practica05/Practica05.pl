/*
 * Ejercicio 1)
 * Implementar la función combina(L1, L2). que recibe una lista L1 de números y a partir de ella 
 * construye L2, de tal manera que: yi=xi+ΣL1 ∀yi∈L2 con xi∈L1 e i∈{0, ... , |L1|}
 * */

/*
 * Función auxiliar que relaciona una lista con la suma de todos sus elementos
 * */
sumaLista([], 0).
sumaLista([X|XS], N) :- sumaLista(XS, N1), N is N1+X.

/*
 * Funcion auxiliar que le suma a cada elemento de una lista un número determinado
 * */
combina_aux([], _, []).
combina_aux([X|XS], N, [Y|YS]) :- combina_aux(XS, N, YS), Y is X+N.

/*
 * Función que dada una lista obtiene la suma de todos sus elementos, 
 * y que posteriormente le suma esa cantidad a cada elemento de la lista.
 * */
combina([X|XS], [Y|YS]) :- sumaLista([X|XS], N), combina_aux(XS, N, YS), Y is X+N.

/*
 * Ejercicio 2)
 * Implementa la función convexo(L1) que devuelve true si los elementos de la lista son 
 * crecientes al inicio de la lista y decrecientes en el resto de la lista.
 */
convexo([_]).
convexo([A,B|L]):- A < B, convexo([B|L]).
convexo([A,B|L]):- A > B, auxiliarConvexo([B|L]).
/*
 * Función auxiliar que comprueba que los elementos de la lista vayan de forma decreciente
 *
 */
auxiliarConvexo([_]).
auxiliarConvexo([A,B|L]):- A > B, auxiliarConvexo([B|L]).

/*
 * Ejercicio 3)
 * Implementa la función decimal_binario(D, B) donde D es un numero en base 10 y B es su representacion binaria.
 */
decimal_binario(0,'0').
decimal_binario(1,'1').
decimal_binario(D, B) :- D>1, R is D mod 2, C is D//2, decimal_binario(C,B1), atom_concat(B1, R, B).

/*
 * Ejercicio 4)
 * */
% Conocimiento sobre divisibilidad. 
divide(2,6).
divide(2,12).

divide(3,6).
divide(3,12).

divide(6,X) :- divide(2,X), divide(3,X).

% Escribir un predicado que represente
% este conocimiento y usarlo para responder
% las siguientes preguntas:
% ¿Existe algún múltiplo de 2?
% divide(2, X). Devuelve X = 6, X = 12.
% Por lo que sí existen múltiplos de 2.

% ¿Cuáles son los divisores de 6?
% divide(X, 6). Devuelve X = 2, X = 3, X = 6. 
% Por lo que los divisores de 6 son
% 2, 3 y 6.

% ¿Conocemos algún múltiplo de 6?
% divide(6, X). Devuelve X = 6, X = 12.
% Por lo que los múltiplos de 6 son 6 y 12.
