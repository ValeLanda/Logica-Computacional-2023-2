/*
    Base de conociemiento e implementa las relaciones de
    acuedo a los enunciados.
    a.Dos personas viven en la misma casa si tienen la 
        misma direccion.
    b. LOs que juegan futbol americano o basquetbol son 
        deportistas.
    c. Eres britanico si eres gales, inlges, escoces o 
        irlandes.
    d. Te pueden multar si no has pagado la tenencia 
        de tu automivil.
*/
juega(emilio, futbol).
juega(yanahi, basquetbol).
juega(lazaro, yugi).

direccion(lazaro, ecatepec).
direccion(emilio, gam).
direccion(yanahi, gam).

nacionalidad(henryCavill, inglesa).
nacionalidad(oliviaWilde, irlandesa).
nacionalidad(yanahi, mexicana).
nacionalidad(jamesBond, escocesa).


esDeportista(X) :- juega(X, futbol).
esDeportista(X) :- juega(X, basquetbol).

vivenEnLaMismaCasa(X,Y) :- direccion(X, Z), direccion(Y, Z), X \= Y.

esBritanica(X) :- nacionalidad(X, inglesa).
esBritanica(X) :- nacionalidad(X, gales).
esBritanica(x) :- nacionalidad(x, irlandesa).

tenencia(lazaro, debe).
tenencia(emilio, pago).
tenencia(yanahi, pago).

multar(X) :- tenencia(X, debe).

/*
    Función que devuelve el máximo de una lista.
    Para la lista vacia deberia lanzar un error, sin embargo eso no se ha visto en clase.
    Para la lista de un solo elemento devuelve ese elemento.
    Para otro caso compara la cabeza con el elemento previamente almacenado como el máximo y
    se queda con el mayor.

    Backtracking para [1,2,3,2,1]

    max([1,2,3,2,1], X) :- max([2,3,2,1], Y), 1 =< Y, X is Y. 
    max([1,2,3,2,1], X) :- max([2,3,2,1], Y), 1 > Y, X is 1. 
    max([2,3,2,1], Y) :- max([3,2,1],Z), 2 =< Z, Y is Z.
    max([2,3,2,1], Y) :- max([3,2,1],Z), 2 > Z, Y is 2.
    max([3,2,1], Z) :- max([2,1],A), 3 =< A, Z is A.
    max([3,2,1], Z) :- max([2,1],A), 3 > A, Z is 3.
    max([2,1], A) :- max([1],B), 2 =< B, A is B.
    max([2,1], A) :- max([1],B), 2 > B, A is 2.
    max([1], B) :- B is 1.
    max([2,1], A) :- max([1],1), 2 > 1, A is 2.
    max([3,2,1], Z) :- max([2,1],2), 3 > 2, Z is 3.
    max([2,3,2,1], Y) :- max([3,2,1],3), 2 =< 3, Y is 3.
    max([1,2,3,2,1], X) :- max([2,3,2,1], 3), 1 =< 3, X is 3.
    X is 3. 
*/
max([X],X).
max([X|XS],Z) :- max(XS,Y), X =< Y, Z is Y.
max([X|XS],Z) :- max(XS,Y), X > Y, Z is X.

/*
    Función que devuelve el máximo de una lista para esto se toma
    la cabeza de la lista y se almacena a si mismo se eliminan
    las repeticiones de este numero en la lista, adicionalmente se
    suma uno al resultado final.
    Se toma como caso base la lisa vacia donde el valor es 0.
*/
diff([], 0).
diff([X|XS], N) :- delReps(XS, X, XS1), diff(XS1, M), N is M+1. 

delReps([], _, []).
delReps([X|XS], X, YS):- delReps(XS, X, YS).
delReps([X|XS], A, [X|YS]):- delReps(XS, A, YS).

/*
    Función para calcular el n-esimo termino de la sucesion de fibonacci.
    Tomamos que fib(0) es 0, de igual forma fib(1) es 1.
    Para n > 1 el resultado es fib(n-2) + fib(n-1).

    Para fib(5).

    fib(5, X) :- 5 > 1, P is 3, Q is 4, fib(3, Y), fib(4,Z), X is Y + Z.
    fib(3, Y) :- 3 > 1, P is 1, Q is 2, fib(1, W), fib(2,U), Y is W + U.
    fib(1, W) :- W is 1.
    fib(2, U) :- 2 > 1, P is 0, Q is 1, fib(0, V), fib(1,E), U is V + E.
    fib(0, V) :- V is 0
    fib(2, U) :- 2 > 1, P is 0, Q is 1, fib(0, 0), fib(1,1), U is 0 + 1.
    fib(3, Y) :- 3 > 1, P is 1, Q is 2, fib(1, 1), fib(2,1), Y is 1 + 1.
    fib(4, Z) :- 4 > 1, P is 2, Q is 3, fib(2, A), fib(3,B), Z is A + B.
    fib(4, Z) :- 4 > 1, P is 2, Q is 3, fib(2, 1), fib(3,2), Z is 1 + 2.
    fib(5, X) :- 5 > 1, P is 3, Q is 4, fib(3, 2), fib(4,3), X is 2 + 3.
    fib(5,x) :- X is 5.
*/
fib(0, 0).
fib(1,1).
fib(X, N) :- X > 1, P is X-2, Q is X-1, fib(P, Y), fib(Q, Z), N is Y + Z.