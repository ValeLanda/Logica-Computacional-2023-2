%% Práctica 05. Lógica Computacional.

/*
  Función combina(L1,L2) que recibe una lista L1 de números y a partir de ella construye una
  lista L2, de tal manera que el elemento iésimo esté definido por la suma del iésimo integrante
  de la lista L1 + todos los integrantes de la lista L1.
*/
combina([], []).
combina(L, M) :- suma_lista(L, A),
                 aux(A, L, M).

/*
  Función auxiliar que crea la lista resultante de la
  función combina.
*/
aux(_, [], []).
aux(SUMA, [X|XS], L) :- aux(SUMA, XS, NL),
                        NEW is SUMA+X,
                        append([NEW], NL, L).

/*
  Función suma_lista; suma los elementos de una lista.
*/
suma_lista([], 0).
suma_lista([X|XS], A) :- suma_lista(XS, B),
                         A is X + B.

/*
  Función convexo(L1) que devuelve true si los
  elementos de la lista son crecientes al
  inicio de la lista y decrecientes en el
  restos de la lista.
*/
convexo([]):- false.
convexo([_]) :- false.

/* Implementación alternativa. */
%% convexo([X|XS]) :-
%%     head(XS, H, T),
%%     (X < H ->
%%          head(T, NH, _),
%%          (H > NH ->
%%               es_decreciente(T);
%%           convexo(XS)) ;
%%      es_decreciente([X|XS])).

convexo([X|XS]) :- head(XS, H, T),
                   (X < H -> (head(T, NH, _),
                   (H > NH -> es_decreciente(T)); convexo(XS)) ; es_decreciente(XS)),
                   X =\= H.
/*
 Función es_decreciente; dice si los elementos
 de una lista se encuentran en orden decreciente.
*/
es_decreciente([]).
es_decreciente([_]).
es_decreciente([X|XS]):- head(XS, H, _),
                         X > H,
                         es_decreciente(XS).

/*
  Función head devuelve la cabeza de una lista.
 */
head([X| XS], X, XS).

/*
  Funcion decimal_binario(D, B) donde D es una numero
  en base 10 y B es su representación binaria.
*/

decimal_binario(D, S):-
    decimal_binario_aux(D, NS),
    number_string(S, NS).

/*
  Regresa la representación binaria de un número en formato de String
*/
decimal_binario_aux(0, "").
decimal_binario_aux(D, S) :-
    A is D mod 2,
    number_string(A, B),
    DIV is div(D, 2),
    decimal_binario_aux(DIV, C),
    string_concat(C, B, S).

/*
  BASE de conocimiento.
*/

divide(2, 6).
divide(2, 12).
divide(3, 6).
divide(3, 12).

/*
  Si un número es divisible por 2 y por, entonces es divisible por 6.
*/
divide(6, X):- divide(2, X),
               divide(3, X).
/*
  Los múltiplos de 2 son todos lo números divisibles por 2.
*/
multiplo_2(X):- divide(2, X).


/*
  Los divisores de 6 son todos lo números que dividen a 6.
*/
divisor_6(X):- divide(X, 6).


/*
  Los múltiplos de 6 son todos lo números divisibles por 6.
*/
multiplo_6(X):- divide(6, X).
