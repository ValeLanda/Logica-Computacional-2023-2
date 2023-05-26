/* Practica 05

   Equipo MLCG
   Lira Rivera Moises Abraham 319029930
   Jose Camilo Garcia Ponce 319210536
*/


/*  1) Funcion crea una lista a partir de otra lista
    La funcion combina recibe una lista
    Si la lista esta vacia entonces devuelve una lista vacia
    La lista que devuelve se construye a partir de la suma de todos los elemntos de la primer lista que se le suma a cada elemento de la primer lista
*/
combina([],[]).
combina(L1,L2) :- sum_list(L1, Suma), combina(L1, Suma, L2).

/*  Funcion auxiliar para sumar el total a cada elemento
    La funcion combina recibe una lista y un numero
    Si la lista esta vacia entonces devuelve una lista vacia
    A cada elemento de la nueva lista se le suma el numero al elemento de la lista original
*/
combina([], _,[]).
combina([X|Xs], Suma, [Y|Ys]) :- Y is Suma + X, combina(Xs, Suma, Ys).


/*  2) Funcion que devuelve True si los elementos de la lista son crecientes al inicio y decrecientes en el resto
    La funcion convexo recibe una lista
    Si la lista esta vacia entonces devuelve True
    Otro caso es si la lista tiene un solo elemento entonces devuelve True
    Si la lista tiene mas de un elemento entonces se obtiene el ultimo elemento de la lista y se obtiene el mayor elemento de la lista
    Si el primer y ultimo elemento son diferentes al mayor elemento, y la llamada a la funcion convexo_aux devuelve True entonces devuelve True
*/
convexo([]).
convexo([_]).
convexo([X|XS]):- last(XS, Z), mayor_lista([X|XS], A), X =\= A, Z =\= A, convexo_aux(XS, 1).

/*  Funcion auxiliar para ver si los elementos de la lista son crecientes al inicio y decrecientes en el resto
    La funcion convexo_aux recibe una lista y un numero
    Si la lista esta vacia entonces devuelve True
    Si el numero es 1 entonces se compara el primer y segundo elemento de la lista, si el primero es mayor se llama a la funcion con la cola de la lista y el numero 1
    Pero si el primero es menor se llama a la funcion con la cola de la lista y el numero 2
    Si el numero es 2 entonces se compara el primer y segundo elemento de la lista, si el primero es mayor se llama a la funcion con la cola de la lista y el numero 2
*/
convexo_aux([_], _).
convexo_aux([X|XS], 1):- nth0(0, XS, Z, _), X > Z, convexo_aux(XS, 1).
convexo_aux([X|XS], 1):- nth0(0, XS, Z, _), X < Z, convexo_aux(XS, 2).
convexo_aux([X|XS], 2):- nth0(0, XS, Z, _), X > Z, convexo_aux(XS, 2).

/*  Funcion auxiliar para obtener el mayor elemento de una lista
    La funcion mayor_lista recibe una lista
    El caso base es si la lista tiene un solo elemento entonces devuelve el elemento
    En el caso recursivo, se obtiene el mayor elemento de la lista sin el primer elemento y se compara con el primer elemento
*/
mayor_lista([X], X).
mayor_lista([X|XS], Y):- mayor_lista(XS, Z), Y is max(X, Z).


/*  3) Funcion devuelve la representacion binaria de un numero decimal (numero)
    La funcion convexo recibe un numero decimal
    Se llama a la funcion decimal_binario_aux con el numero decimal y a lo que devuelve lo volvemos un numero
    Devolvemos el numero
*/
decimal_binario(D, B):- decimal_binario_aux(D, X), number_string(B, X).

/*  Funcion auxiliar para obtener la representacion binaria de un numero decimal (cadena)
    La funcion decimal_binario_aux recibe un numero decimal
    Si el numero decimal es 0 entonces devuelve la cadena "0"
    Si el numero decimal es 1 entonces devuelve la cadena "1"
    En el caso recursivo, se obtiene el modulo del numero decimal entre 2 y se obtiene la division entera del numero decimal entre 2
    Se llama a la funcion decimal_binario_aux con la division entera y a lo que devuelve se le concatena el modulo
*/
decimal_binario_aux(0, "0").
decimal_binario_aux(1, "1").
decimal_binario_aux(D, B):- X is D mod 2, Y is D // 2, decimal_binario_aux(Y, Z), number_string(X, W), string_concat(Z, W, B).


/*  4) Ejercicio de la funcion divide*/

/*  Base de conocimientos */
divide(2,6).
diviide(2,12).
divide(3,6).
divide(3,12).

/*  Regla que genera la relacion "si un numero es divisible entre dos y entre tres, entonces es divisible entre 6 */
divide(6,X) :- divide(2,X), divide(3,X).

/*  Preguntas
    Usamos https://swish.swi-prolog.org/ para hacer las evaluaciones
*/
%¿Existe algún múltiplo de 2? si, son 6 y 12
% debido a que divide(2, X). X = 6, X = 12
%¿Cuales son los divisores de 6? son 2, 3 y 6
% debido a que divide(X, 6). X = 2, X = 3, X = 6
%¿Conocemos algun multiplo de 6? si, son 6 y 12
% debido a que divide(6, X). X = 6, X = 12

