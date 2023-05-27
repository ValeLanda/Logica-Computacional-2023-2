% s(CASP) Programming
:- use_module(library(scasp)).

%Supongamos que tenemos el siguiente conocimiento de sobre divisibilidad:
%2 divide a 6
%2 divide a 12
%3 divide a 6
%3 divide a 12
%Si un número es divisible por 2 y por 3
%entonces es divisible por 6.
%Escribir un predicado que represente este conocimiento y
%usarlo para responder a las siguientes preguntas:

divide(2,6).
divide(2,12).
divide(3,6).
divide(3,12).
divide(6,X):- divide(2,X), divide(3,X).

%¿Existe algún múltiplo de 2? si 6 y 12
%¿Cuáles son los divisores de 6? cuando (2,6),(2,12),(3,6),(3,12) por lo que
%los divisores de 6 son 2,3 y 6
%¿Conocemos algún múltiplo de 6? si, 6 y 12

% Ejercicio02
% Implementa la función convexo(L1) que devuelve true si los elementos de la lista 
% son crecientes al inicio de la lista y decrecientes en el resto de la lista.

convexo([]).
convexo([_]).
convexo([X,Y|L]):- X < Y, convexo([Y|L]).
convexo([X,Y|L]):- X > Y, decreciente([Y|L]).

decreciente([]).
decreciente([_]).
decreciente([X,Y|L]):- X > Y, decreciente([Y|L]).


%  3)   
% Implementa la función decimal_binario(D, B) donde D es un 
% número en base 10 y B es su representación binaria.

%Se ponen 2 casos base por si se detiene cuando el resto es cero o uno , apartir de ahi empieza a 
% concatenar valores 1 si es el caso de residuo 1 , cero si el residuo da cero
%para sacar el residuo se hace con modulo

decimal_binario(0,[0]).
decimal_binario(1,[1]).
decimal_binario(D,B):-((D mod 2) =:=1)-> (D>0, D1 is (D-1)/2 ,decimal_binario(D1,Y),concat(Y,[1],B) );
    			((D mod 2) =:=0)->  (D>0, D1 is D/2 ,decimal_binario(D1,Y),concat(Y,[0],B)).

%Es un predicado dado que en prolog no hay funciones 
%por lo tanto para "pseudo "asignarle el valor a X tengo que hacer el ultimo argumento del concat sea 
%el mismo al que le quiero asignar el valor.
concat([H|T_L1],L2,[H|T_L3]):-concat(T_L1,L2,T_L3).
concat([],L,L).

