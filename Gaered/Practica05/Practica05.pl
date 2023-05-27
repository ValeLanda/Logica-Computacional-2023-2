
% Ejercicio 1: Implementa la función combina(L1,L2) que recibe una 
% lista L1 de números y a partir de ella construye L2, de tal manera que: 
% yi=xi+ΣL1 ∀yi∈L2 con xi∈L1 e i∈{0, ... , |L1|}.

% Función auxiliar que suma los elementos de una lista.
suma([],0).
suma([X|XS],S) :- 
    suma(XS,S2), S is X+S2.

% Función que calcula la longitud de una lista.
lenght([],0).
lenght([_],1).
lenght([_|XS],L) :-
    lenght(XS,LXS),
    L is LXS+1.

% Función principal combina.
combina(L1, L2) :-
    suma(L1,SumaL1),
    combina(L1, L2, SumaL1).

% Función auxiliar recursiva combina.
combina([], [], _).
combina([X|XS], [Y|YS], SumaX) :-
    LX=LY,
    lenght([X|XS],LX),
    lenght([Y|YS],LY),
    Y is X + SumaX,
    combina(XS,YS,SumaX).


% Ejercicio 2: Implementa la función convexo(L1) que devuelve true 
% si los elementos de la lista son crecientes al inicio de la lista 
% y decrecientes en el resto de la lista.

convexo(LS) :-
    creciente_inicio(LS,NoCreciente),
    LS \= NoCreciente,
    decreciente(NoCreciente).

creciente_inicio([], []).
creciente_inicio([X], [X]).
creciente_inicio([X, Y | Resto], NoCreciente) :-
    X < Y,
    creciente_inicio([Y | Resto], NoCreciente).
creciente_inicio([X, Y | Resto], [X, Y | Resto]) :-
    X > Y.

decreciente([L1,L2]) :-
    L1 > L2.
decreciente([L1, L2 | LS]) :-
    L1 > L2,
    decreciente([L2| LS]).


% Ejercicio 3: Implementa la función decimal_binario(D, B) 
% donde D es un número en base 10 y B es su representación binaria.

decimal_binario(D,B) :-
    integer(D),
    D >= 0,
    dec_to_bin(D,B).

decimal_binario(D,B) :-
    lista_binaria(B),
    bin_to_dec(D,B).

dec_to_bin(0,[0]).
dec_to_bin(1,[1]).
dec_to_bin(D,B) :-
    D > 1,
    dec_to_bin_aux(D,BRev),
    reverse(BRev,B).

dec_to_bin_aux(0,[]).
dec_to_bin_aux(1,[1]).
dec_to_bin_aux(D,[B|BS]):-
    D>1,
    B is D mod 2,
    C is D // 2,
    dec_to_bin_aux(C,BS).

lista_binaria([]).
lista_binaria([B|BS]) :-
    member(B,[0,1]),
    lista_binaria(BS).

bin_to_dec(0,[0]).
bin_to_dec(1,[1]).
bin_to_dec(D,[B|BS]):-
    bin_to_dec_aux(D,[B|BS],0).

bin_to_dec_aux(D,[],D).
bin_to_dec_aux(D,[B|BS],Ac):-
    B = 0,
    Ac2 is Ac*2,
    bin_to_dec_aux(D,BS,Ac2).

bin_to_dec_aux(D,[B|BS],Ac):-
    B = 1,
    Ac2 is Ac*2 + 1,
    bin_to_dec_aux(D,BS,Ac2).



% Ejercicio 4:
divide(2,6).
divide(2,12).
divide(3,6).
divide(3,12).

divide(6,X) :-
    divide(2,X),
    divide(3,X).

