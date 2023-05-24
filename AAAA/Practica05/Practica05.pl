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
