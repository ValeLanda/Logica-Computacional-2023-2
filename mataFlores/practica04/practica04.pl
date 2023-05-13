% Ejercicio 1

% Inciso a):

direccion(ricardo, calle47).
direccion(juan, calle47).
direccion(pedro, calle38).
direccion(benito, calle38).

% Dos personas viven en la misma casa si tienen la misma dirección.
vivirEnMismaCasa(X,Y, Dir1, Dir2) :-  Dir1 = Dir2, 
    direccion(X,Dir1), direccion(Y,Dir2).  
% Ejemplo en el que se hace verdadero:
% vivirEnMismaCasa(juan,ricardo,calle47,calle47)
% Ejemplo en el que se hace falso:
% vivirEnMismaCasa(juan,ricardo,calle47,calle38)


% Inciso b):

basquet(ricardo).
basquet(benito).

futbol(ricardo).
futbool(pedro).

% Los que juegan basquetbol o fútbol americano son deportistas.
deportista(X) :- basquet(X); futbool(X).
% Ejemplo en el que se hace verdadero:
% deportista(benito)
% Ejemplo en el que se hace falso:
% deportista(luis)

% Inciso c):

ingles(ricardo).
escoces(pedro).
irlandes(benito).

% Eres británico si eres galés, inglés, escocés o irlandés.
britanico(X) :- ingles(X); escoces(X); irlandes(X).
% Ejemplo en el que se hace verdadero:
% britanico(ricardo)
% Ejemplo en el que se hace falso:
% britanico(luis)


% Inciso d):

noPagar(ricardo).
% Te pueden multar si no has pagado la tenencia de tu automovil.
multa(X) :- noPagar(X).
% Ejemplo en el que se hace verdadero:
% multa(ricardo)
% Ejemplo en el que se hace falso:
% multa(luis)



% Ejercicio 2.

evaluaMax(N, X, M) :- X >= M, N is X.
evaluaMax(N, X, M) :- M >= X, N is M.

maximoL([X], X).
maximoL([X|L], N) :- maximoL(L, M), evaluaMax(N, X, M).

% Bactraking

% maximoL([1,2,3,2,1], Res) :- maximoL([2,3,2,1], Res2), Res is max(Res2, 1)
% maximoL([2,3,2,1], Res2) :- maximoL([3,2,1], Res3), Res2 is max(Res3, 2)
% maximoL([3,2,1], Res3) :- maximoL([2,1], Res4), Res3 is max(Res4, 3)
% maximoL([2,1], Res3) :- maximoL([1], 1), Res3 is max(1, 2)

% Res3 is 3, Res2 is 3, Res is 3.


% Ejercicio 3.

pertenencia(X, [X]).
pertenencia(E, [X|L]) :- pertenencia(E,L); X = E.

auxRepetidosL(N, X, L, M) :- not(pertenencia(X,L)), N is M + 1.
auxRepetidosL(N, X, L, M) :- pertenencia(X,L), N is M.

repetidosL([], 0).
repetidosL([_], 1).
repetidosL([X|L], N) :- repetidosL(L, M), auxRepetidosL(N, X, L, M). 

% Ejercicio 4.
fib(0, 1).
fib(1, 1).
fib(N, F) :-
        N > 1,
    	N1 is N - 1,
        N2 is N-2,
        fib(N1, F1),
        fib(N2, F2),
        F is F1+F2.
% Backtraking.

% Fibo(5, X) : X = Res2 + Res3 
% X = 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1.

% Fibo(4, Res2) : Res2 = Res4 + Res5
% Fibo(3, Res3) : Res3 = Res6 + Res7

% Fibo(3, Res4) : Res4 = Res8 + Res9
% Fibo(2, Res5) : Res5 = Res10 + Res11

% Fibo(2, Res6) : Res6 = Res12 + Res13
% Fibo(1, Res7) : Res7 = 1

% Fibo(2, Res8) : Res8 = Res14 + Res15
% Fibo(1, Res9) : Res9 = 1

% fibo(1, Res10) :  Res10 = 1
% fibo(0, Res10) :  Res11 = 1

% Fibo(1, Res12) : Res12 = 1
% Fibo(0, Res13) : Res13 = 1

% Fibo(1, Res14) : Res14 = 1

% Fibo(0, Res15) : Res15 = 1


