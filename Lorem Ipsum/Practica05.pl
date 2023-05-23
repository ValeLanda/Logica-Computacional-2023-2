divide(1,n).
divide(_,0).
divide(2,6).
divide(3,6).
divide(2,12).
divide(3,12).

divide(A,N) :- Q is N/A, integer(Q). % por definición de divisibilidad.


divide(6,N) :- divide(3,N), divide(2,N).

/**
 * ¿Existe algun multiplo de 2?
 * Sí, cada resultado positivo de divide nos presenta a un multiplo de dos
 * ¿Cuáles son los divisores de 6?
 * 3,6,1 (Si consultamos esto todos estos nos dan true)
 * ¿Conocemos algún múltiplo de 6?
 * Sí, cualquier número divisible por 6 lo es, en particular 12.
 */

%casos base
binario(0,[0]).
binario(1,[1]).
%algoritmo binario adaptado a prolog, presentamos el resultado en orden inverso.
binario(Dec, Bin) :- P is div(Dec,2), Q is mod(Dec,2), binario(P, Resto), append(Resto,[Q],Bin).
