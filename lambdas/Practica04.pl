
direccion(p1, direccion1).
direccion(p2, direccion1).

/*
  Dos personas viven juntas si y solo si tienen la misma direccion
  @param X persona 1
  @param Y persona 2
  @param Z direccion de las personas
*/
vivenJuntos(X, Y, Z):-
    direccion(X, Z),
    direccion(Y, Z).

juegaFutA(x).
juegaBasquet(y).

/*
  Los que juegan básquetbal o fútbol americano son deportistas
  @param X persona
*/
esDeportista(X):-
    juegaFutA(X) | juegaBasquet(X).

esGales(x).
esIngles(y).
esEscoces(z).
esIrlandes(w).

/*
  Eres británico si eres galés, inglés, escocés or irlandés.
  @param X persona
*/
esBritanico(X):-
    esGales(X) |
    esIngles(X) |
    esEscoces(X)|
    esIrlandes(X).


pagado(persona, tenencia).

/*
  Te pueden multar si no has pagado la tenencia de tu automóvil.
  @param X persona
*/
multar(X):-
    not(pagado(X, tenencia)).

/*
  Función que devuelve el máximo de una lista de números.
*/ 
max([], 0).
max([Head | Tail], Max):-
    max(Tail, TailMax),
    Head > TailMax,
    Max is Head.
max([Head | Tail], Max):-
    max(Tail, TailMax),
    Head =< TailMax,
    Max is TailMax.

/* Backtracking */
/*
  max([1,2,3,2,1] , X) :-
      max([2,3,2,1], Y),
                 --> max([3,2,1], Z),
                     --> max([2,1], A),
                         --> max([1], B),
                             --> max([], 0),
                             1 > 0, 
                             B is 1.
                         2 > 1,
                         A is 2.
                      3 > 2,
                      Z is 3.
      2 > 3 -- False
      Y is 3.
 1 > 3, -- False
 X is 3.

X = 3.
*/                           

/*
  Función que devuelve la cantidad de números
  distintos en una lista.
*/
dist([], 0).
dist([Head | Tail], Num):-
    (inList(Tail, Head)->
     dist(Tail, NT),
     Num is NT;
     dist(Tail, NT),
     Num is NT+1).

/*
  Función auxiliar que determina si un número X se
  encuentra como elemento dentro de una lista.
*/
inList([X|_], X).
inList([_|XS], A):- inList(XS,A).

/*
  Función Fibonacci
  @param N posición N
  @param F número fibonacci encontrado en la posición N
*/    
fib(0, 1).
fib(1, 1).
fib(N, F) :-
    N > 1,
    N1 is N-1,
    N2 is N-2,
    fib(N1, F1),
    fib(N2, F2),
    F is F1+F2.

/* Backtracking */
/*
  fib(5, F):-
      fib(4, X),
          --> fib(3, A),
              --> fib(2, C),
                  --> fib(1, 1),
                  --> fib(0, 1),
                  --> C is 1+1
              --> fib(1, 1).
              --> A is 2+1.
          --> fib(2, B),
              --> fib(1, 1),
              --> fib(0, 1),
              --> B is 1+1.
      --> X is 2+3
      fib(3, Y),
          --> fib(2, D),
               --> fib(1, 1),
               --> fib(0, 1),
               --> D is 1+1
          --> fib(1, 1),
      --> Y is 2+1.
  --> F is 5+3

  fib(5, F).
  F = 8 .
*/
