/*  Practica 03

    Equipo MLCG
    Lira Rivera Moises Abraham 319029930
    Jose Camilo Garcia Ponce 319210536
*/


/*  1) Base de conocimientos */

/* Base de conocimientos */
vive_en(moises,jardines_del_sur).
vive_en(jesus,xochimilco).
vive_en(camilo,ajusco).
vive_en(cesar,jardines_del_sur).
juega(jordan,basquetbol).
juega(brady,futbol_americano).
juega(amelia, golf).
nacionalidad(gustavo, mexicano).
nacionalidad(ricky, gales).
nacionalidad(dan, ingles).
nacionalidad(kaela, escoces).
nacionalidad(jimmy, irlandes).
conductor(pedro).
conductor(pablo).
pago_tenencia(pedro).

/*  1.a) Dos personas viven en la misma casa si tienen la misma direccion
    Si se evalua la misma persona, se devuelve false
    viven_juntos(moises,cesar) se evalua como true
    viven_juntos(jesus,camilo) se evalua como false
*/
viven_juntos(A,B) :- vive_en(A,Direccion),vive_en(B,Direccion), A \= B.

/*  1.b) Los que juegan basquetbol o futbol americano son deportistas
    es_deportista(jordan) se evalua como true
    es_deportista(amelia) se evalua como false
*/
es_deportista(A) :- juega(A,basquetbol).
es_deportista(A) :- juega(A,futbol_americano).

/*  1.c) Eres britanico si eres gales, ingles, escoces o irlandes
    es_britanico(dan) se evalua como true
    es_britanico(gustavo) se evalua como false
*/
es_britanico(A):- nacionalidad(A,B), (B == gales; B == ingles; B == escoces; B == irlandes).

/*  1.d) Te pueden multar si no has pagado la tenencia de tu automovil
    recibe_multa(pablo) se evalua como true
    tePuedenMultar(pedro) se evalua como false
*/
recibe_multa(A) :- conductor(A), not(pago_tenencia(A)).

/*  2) Funcion que devuelve el maximo de una lista
    La funcion max recibe una lista y devuelve el maximo de la lista
    El caso base es cuando la lista tiene un solo elemento, devuelve ese elemento
    En el caso recursivo, se compara el primer elemento con el maximo del resto de la lista

    Ejemplo de ejecucion de la entrada max([1,2,3,2,1],X).
    max([1,2,3,2,1],X):- max([2,3,2,1],Y), 1>=Y, X is 1. // max([1,2,3,2,1],X):- max([2,3,2,1],Y), 1<Y, X is Y.
    max([2,3,2,1],Y):- max([3,2,1],Z), 2>=Z, Y is 2. // max([2,3,2,1],Y):- max([3,2,1],Z), 2<Z, Y is Z.
    max([3,2,1],Z):- max([2,1],W), 3>=W, Z is 3. // max([3,2,1],Z):- max([2,1],W), 3<W, Z is W.
    max([2,1],W):- max([1],V), 2>=V, W is 2. // max([2,1],W):- max([1],V), 2<V, W is V.
    max([1],V):- V is 1.
    max([2,1],W):- max([1],V), 2>=1, W is 2.
    max([3,2,1],Z):- max([2,1],W), 3>=2, Z is 3.
    max([2,3,2,1],Y):- max([3,2,1],Z), 2<3, Y is 3.
    max([1,2,3,2,1],X):- max([2,3,2,1],Y), 1<3, X is 3.
    X = 3
*/
max([X],X).
max([X|XS],Y):- max(XS,Z), X>=Z, Y is X.
max([X|XS],Y):- max(XS,Z), X<Z, Y is Z.


/*  3) Funcion que devuelve la cantidad de numeros distintos de una lista
    La funcion cantidad recibe una lista y devuelve la cantidad de numeros distintos de la lista
    Si la lista esta vacia, devuelve 0
    El caso base es cuando la lista tiene un solo elemento, devuelve 1
    En el caso recursivo, se compara si el primer elemento esta en el resto de la lista
    Si esta entonces se devuelve la cantidad del resto de la lista
    Si no esta entonces se devuelve la cantidad del resto de la lista mas 1
*/
cantidad([],0).
cantidad([_],1).
cantidad([X|XS],Y):- cantidad(XS,Z), pertenece(X,XS), Y is Z.
cantidad([X|XS],Y):- cantidad(XS,Z), not(pertenece(X,XS)), Y is Z+1.

/*  Funcion auxiliar para verificar si un numero aparece en una lista
    La funcion pertenece recibe un numero y una lista y devuelve true si el numero esta en la lista
    Si la lista esta vacia, devuelve false
    El caso base es cuando el numero es igual al primer elemento de la lista, devuelve true
    En el caso recursivo, se devuelve de la funcion aplicada al resto de la lista
*/
pertenece(X,[X|_]).
pertenece(X,[_|XS]):- pertenece(X,XS).


/*  4) Funcion de Fibonacci
    La funcion fibo recibe un numero n y devuelve el n-esimo numero de la serie de Fibonacci
    Si el numero es 0, devuelve 0
    Si el numero es 1, devuelve 1
    En otro caso, se devuelve la suma de los dos numeros anteriores de la serie de Fibonacci

    Ejemplo de ejecucion de la entrada fibo(5,X).
    fibo(5,X):- 5>1, X is 4, Y is 3, fibo(4,Z), fibo(3,W), X is Z+W.
    fibo(4,Z):- 4>1, X is 3, Y is 2, fibo(3,W), fibo(2,V), Z is W+V.
    fibo(3,W):- 3>1, X is 2, Y is 1, fibo(2,V), fibo(1,U), W is V+U.
    fibo(2,V):- 2>1, X is 1, Y is 0, fibo(1,U), fibo(0,T), V is U+T.
    fibo(1,U):- U is 1.
    fibo(0,T):- T is 0.
    fibo(2,V):- 2>1, X is 1, Y is 0, fibo(1,1), fibo(0,0), V is 1.
    fibo(3,W):- 3>1, X is 2, Y is 1, fibo(2,1), fibo(1,1), W is 2.
    fibo(4,Z):- 4>1, X is 3, Y is 2, fibo(3,2), fibo(2,1), Z is 3.
    fibo(5,X):- 5>1, X is 4, Y is 3, fibo(4,3), fibo(3,2), X is 5.
    X = 5
    En este ejemplo de ejecucion omitimos repetir las llamadas a la funcion de entradas que ya se habian calculado
*/
*/
fibo(0,0).
fibo(1,1).
fibo(N,F):- N>1, X is N-1, Y is N-2, fibo(X,Z), fibo(Y,W), F is Z+W.

