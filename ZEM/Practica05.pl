%-------------------------------------------EJERCICIO 1----------------------------------------------
%Implementa la función combina(L1,L2) que recibe una lista L1 de números y a partir de ella construye L2
%, de tal manera que: yi=xi+ΣL1 ∀yi∈L2 con xi∈L1 e i∈{0, ... , |L1|}
%Ejemplo de como probar la función: combina([0,3,7,5,11,2],L2).

combina(L1, L2) :-
    combina_aux(L1, L1, L2).

%Se utiliza para invocar el predicado combina_aux con la misma lista L1 dos veces: una vez como la lista
%original y otra vez como una lista auxiliar.
combina_aux([], _, []).
combina_aux([X|Resto], L1, [Y|L2Resto]) :-
    suma(L1, Suma),
    Y is X + Suma,
    combina_aux(Resto, L1, L2Resto).

%Se utiliza para calcular la suma de los elementos de una lista.
suma([], 0).
suma([X|Resto], Suma) :-
    suma(Resto, SumaResto),
    Suma is X + SumaResto.

%-------------------------------------------EJERCICIO 2----------------------------------------------
%Implementa la función convexo(L1) que devuelve true si los elementos de la lista son crecientes al 
%inicio de la lista y decrecientes en el resto de la lista.

%Construye una lista creciente utilizando los primeros elementos de la lista original que sean menores
%que los elementos siguientes.
creciente([C],[C]).
creciente([],[]).
creciente([A,B|_], [A]) :- A >= B.
creciente([A,B|Bs],[A|Resto]) :- A < B, creciente([B|Bs], Resto).

%Construye una lista decreciente utilizando los primeros elementos de la lista original que sean mayores
%que los elementos siguientes.
decreciente([C],[C]).
decreciente([],[]).
decreciente([A,B|_], [A]) :- A =< B.
decreciente([A,B|Bs], [A|Resto]) :- A > B, decreciente([B|Bs], Resto).

%Función quese utiliza para encontrar la diferencia entre dos listas. Toma dos listas como entrada y
%devuelve una tercera lista que contiene los elementos que están en la primera lista pero no en la 
%segunda lista.
auxConvexo([], [], []).
auxConvexo([A|X], [A], X) :- !.
auxConvexo([A|X], [A|Y], C) :-
    auxConvexo(X, Y, C).


convexo([L|Ls]) :- 
    creciente([L|Ls], L1), 
    auxConvexo([L|Ls], L1, Dif), 
    decreciente(Dif, L2), 
    append(L1,L2, [L|Ls]).
    
%-------------------------------------------EJERCICIO 3----------------------------------------------
%Implementa la función convierte(D, B) donde D es un número en base 10 y B es su representación binaria.
%Ejemplo de como probar : decimal_a_binario(11, Binario).
    
decimal_a_binario(0, [0]).
decimal_a_binario(1, [1]).
decimal_a_binario(N, Binario) :-
    N > 1,
    Resto is N mod 2,
    Cociente is N // 2,
    decimal_a_binario(Cociente, BinarioCociente),
    append(BinarioCociente, [Resto], Binario).

%-------------------------------------------EJERCICIO 4----------------------------------------------
%Supongamos que tenemos el siguiente conocimiento de sobre divisibilidad:
%2 divide a 6
%2 divide a 12
%3 divide a 6
%3 divide a 12

divisible_por(Numero, Divisor) :-
    0 is Numero mod Divisor.

divisible_por_2(Numero) :-
    divisible_por(Numero, 2).

divisible_por_3(Numero) :-
    divisible_por(Numero, 3).

%Si un número es divisible por 2 y por 3 entonces es divisible por 6
divisible_por_6(Numero) :-
    divisible_por_2(Numero),
    divisible_por_3(Numero).

%Escribir un predicado que represente este conocimiento y usarlo para responder a las siguientes preguntas:

%¿Existe algún múltiplo de 2?
es_multiplo_de_2 :-
    divisible_por_2(_).

%¿Cuáles son los divisores de 6?
divisores_de_6(Divisor) :-
    divisible_por_6(Divisor),
    Divisor \= 6.

%¿Conocemos algún múltiplo de 6?
multiplo_de_6(Multiplo) :-
    divisible_por_6(Multiplo).
