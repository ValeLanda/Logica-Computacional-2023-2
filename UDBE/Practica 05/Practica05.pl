% Practica 05

% Ejercicio01

% Implementa la función combina(L1,L2) que recibe una lista L1 de números
% y a partir de ella construye L2

combina(L1,L2):-
    combina(L1,L1,L2).

combina([],_,[]).
combina([X|Xs],L1,[Y|Ys]):-
    sum_list(L1,Sum),
    Y is X + Sum,
    combina(Xs,L1,Ys).

% Ejercicio 3

% Funcion Auxiliar para Convexo
creciente([]).
creciente([_]).
creciente([X,Y|XS]) :- X =< Y, creciente([Y|XS]).

% Funcion que devuelve true si los elementos de la listas son
% crecientes al inicio de la lista y decrecientes en el resto
% de la lista:
convexo(L1) :- creciente(L1), reverse(L1, L2), creciente(L2).


% Funcion decimal_binario(D, B) donde D es un número en base 10 y B su representación binaria

decimal_binario(0, [0]).
decimal_binario(1, [1]).
decimal_binario(D, B) :-
    D > 1,
    Residuo is D mod 2,
    Resultado is D div 2,
    decimal_binario(Resultado, RestoBin),
    append(RestoBin, [Residuo], B).


/* Ejercicio04
Supongamos que tenemos el siguiente conocimiento de sobre divisibilidad:
2 divide a 6
2 divide a 12
3 divide a 6
3 divide a 12 */


% Hechos
divide(2, 6).
divide(2, 12).
divide(3, 6).
divide(3, 12).

% Un número divisible por 2 y por 3 es divisible por 6
divide(6, X) :-
    divide(2, X),
    divide(3, X).

/*Si un número es divisible por 2 y por 3 entonces es divisible por 6
Escribir un predicado que represente este conocimiento y usarlo para responder a las siguientes preguntas:

*/

% Existe algún múltiplo de 2?
existe_multiplo_de_2 :-
    divide(2, X),
    write('Sí existe, '), write(X), write(' es múltiplo de 2.').

% Cuáles son los divisores de 6?
divisores_de_6 :-
    divide(Y, 6),
    write(Y), write(' es divisor de 6.'), nl.

% Conocemos algún múltiplo de 6?
conocemos_multiplo_de_6 :-
    divide(6, X),
    write('Sí, '), write(X), write(' es múltiplo de 6.').



