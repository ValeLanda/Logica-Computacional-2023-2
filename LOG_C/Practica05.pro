%Implementa la función combina(L1,L2) que recibe una lista
%L1 de números y a partir de ella construye L2, de tal manera que:
%𝑦𝑖 = 𝑥𝑖 + Σ𝐿1 ∀𝑦𝑖∈𝐿2 𝑐𝑜𝑛 𝑥𝑖∈𝐿1 𝑒 𝑖∈{0, ... , |𝐿1|}
%Ejemplo:
%L1 = [0,3,7,5,11,2]
%L2 = [28,31,35,33,39,30]


suma_de_lista([], 0).
suma_de_lista([Head|Cola], Total) :-
    suma_de_lista(Cola, M),
    Total is Head + M.


aux_fun_combina([], _, [], _).
aux_fun_combina([H1|T1], L1, [H2|T2], N) :-
    suma_de_lista(L1, Total),
    H2 is H1 + Total,
    M1 is N + 1,
    aux_fun_combina(T1, L1, T2, M1).


combina([], []).
combina(L1, L2) :- aux_fun_combina(L1, L1, L2, 0).






%Implementa la función convexo(L1) que devuelve true si los
%elementos de la lista son crecientes al inicio de la lista y decrecientes en el
%resto de la lista.
%Ejemplo:
%[2,6,8,7,5,1,0] -> true
%[3,7,5,4,9] -> false
%[0 2 4 3] -> true
%[3,7,7,4,2] -> false


elem_crecientes([]).
elem_crecientes([_]).
elem_crecientes([Elem, Head | Tail]) :- 
    Elem < Head,
    elem_crecientes([Head | Tail]).

elem_decrecientes([]).
elem_decrecientes([_]).
elem_decrecientes([Elem, Head | Tail]) :-
    Elem > Head,
    elem_decrecientes([Head | Tail]).



convexo(L1) :-
    append(AuxP1, AuxP2, L1),
    elem_crecientes(AuxP1),
    elem_decrecientes(AuxP2).






%Implementa la función decimal_binario(D, B) donde D es
%un número en base 10 y B es su representación binaria.
%Ejemplo: decimal_binario(10, B). -> B = [1, 0, 1, 0].

decimal_a_binario(0, AuxL, AuxL).
decimal_a_binario(D, AuxL, B) :- 
    D > 0,
    Residuo is D mod 2,
    D1 is D // 2,
    decimal_a_binario(D1, [Residuo | AuxL], B).

decimal_binario(D, B) :-
    decimal_a_binario(D, [], B).







%Supongamos que tenemos el siguiente conocimiento de sobre
%divisibilidad:
%➔ 2 divide a 6
%➔ 2 divide a 12
%➔ 3 divide a 6
%➔ 3 divide a 12
%➔ Si un número es divisible por 2 y por 3 entonces es divisible por 6
%Escribir un predicado que represente este conocimiento y usarlo para
%responder a las siguientes preguntas:
%➔ ¿Existe algún múltiplo de 2?
%➔ ¿Cuáles son los divisores de 6?
%➔ ¿Conocemos algún múltiplo de 6?

divide_a(2, 6).
divide_a(2, 12).
divide_a(3, 6).
divide_a(3, 12).

%Ejemplo: divisible_por_seis(12). 
%true
divisible_por_seis(N) :- 
     divide_a(2, N),
     divide_a(3, N).


%Ejemplo: existe_multiplo_de_dos. 
%true;
%true.
existe_multiplo_de_dos :-
    divide_a(2, _).

%Ejemplo: divisores_de_seis(Divisor).
%Divisor = 2;
%Divisor = 3.
divisores_de_seis(Divisor) :- 
    divide_a(Divisor, 6).


%Ejemplo: conocemos_multiplo_de_seis.
%true;
%true.
conocemos_multiplo_de_seis :-
    divisible_por_seis(_).

