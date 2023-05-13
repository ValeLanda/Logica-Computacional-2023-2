
/*
 	Dos personas viven en la misma casa si tienen la misma dirección.
	direccion(jos, mex).
	direccion(luz, mex).
	vivenJuntos(jos,luza).
*/
vivenJuntos(A,B) :- 
    direccion(A, D), direccion(B,D).

/*
 * Los que juegan basquetbol o fútbol americano son deportistas.
    esFutbolistaAm(pedro).
    esBasquetbolista(juan).
 	esDeportista(juan).
*/
esDeportista(D) :-
    esFutbolistaAm(D);
    esBasquetbolista(D).

/*
 * Eres británico si eres galés, inglés, escocés o irlandés.
 	ingles(Pedro).
    escoces(juan).
    irlandes(luis).
    esBrit(luis).

*/
esBrit(P) :-
    gales(P);
    ingles(P);
    escoces(P);
    irlandes(P).

/*
 * Te pueden multar si no has pagado la tenencia de tu automóvil.
 	pago(alfredo).
    multa(alfredo).
*/
multa(A) :-
    not(pago(A)).

/*
 * Devuelve el máximo de una lista de números.
 	max([1,2,4,7,43,2,7], Res).
*/
max([Result], Result).
max([A,B|C], Higher) :-
    A > B, max([A|C], Higher);
    A =< B, max([B|C], Higher).

%Funcion que devuelva la cantidad de números distintos en una lista.
%nros([1,2,4,4,5,6,1], Cont).
nros([], 0).
nros([A|L], N) :-
    nros(L, N1), not(member(A,L)), N is N1+1.
nros([A|L], N) :-
    nros(L, N1), member(A,L), N is N1.

/*
 * Funcion de Fibonacci.
 	fibonacci(5, X).
*/
fibonacci(0, 0).
fibonacci(1, 1).
fibonacci(N, Result) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, Result1),
    fibonacci(N2, Result2),
    Result is Result1 + Result2.





