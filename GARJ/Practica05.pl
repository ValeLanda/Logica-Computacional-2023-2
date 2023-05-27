% Ejercicio 1.

% Función auxiliar que recibe una lista de números y devuelve un número, el cual, es la suma de todos los números de la lista que recibe.
suma([],0).
suma([X|Y],S) :- suma(Y,S1), S is S1+X.

% Función auxiliar que recibe una lista de números y un número, y devuelve una lista tal que le suma el número que recibe a todos los números de la lista que recibe.
sumar([X],A,L) :- B is A+X, L = [B].
sumar([X|Y],A,L) :- B is A+X, sumar(Y,A,L1), L = [B|L1].

% Función que recibe una lista de números y devuelve otra lista de números, tal que, hace la suma de todos los números de la lista que recibe y le suma el i-ésimo número 
% de la lista que recibe a la suma de todos los números de la lista, ese número estará en la i-ésima posición de la lista que devuelve.
combina([],[]).
combina([X|Y],L) :- suma([X|Y],L1), sumar([X|Y],L1,L2), L = L2.



% Ejercicio 2. Implementa la función convexo(L1) que devuelve true si los elementos de la lista son crecientes al inicio de la lista y decrecientes en el resto de la lista.

% Función convexo(L1) que devuelve true si los elementos de la lista son crecientes al inicio de la lista y decrecientes en el resto de la lista.
convexo(List) :- increasing(List),
                 reverse(List, Reversed),
                 increasing(Reversed).

% Funcion auxiliar que revisa si la lista esta incrementando
increasing([_]).
increasing([X,Y|Rest]) :- X < Y,
                          increasing([Y|Rest]).


% 3. Implementa la función decimal_binario(D, B) donde D es un número en base 10 y B es su representación binaria.%
decimal_binario(0, [0]).
decimal_binario(1, [1]).
decimal_binario(D, B) :-
    D > 1,
    Div is D div 2,
    Rem is D mod 2,
    decimal_binario(Div, B1),
    append(B1, [Rem], B).

% Ejercicio 4.
% Conocimiento de divisibilidad :
divideA(2,6).
divideA(2,12).
divideA(3,6).
divideA(3,12).

% Si un número es divisible por 2 y por 3 entonces es divisible por 6
% Escribir un predicado que represente este conocimiento :
divisiblePor6(X) :- divideA(2,X), divideA(3,X).

%%
% Responder a las siguientes preguntas:
% ** Un numero es multiplo de 2 si la ultima cifra es par o cero.
% - ¿Existe algún múltiplo de 2?
% 	Si, el 6, porque es un numero par (2 x 3 = 6), y el 12, porque la ultimo cifra es numero par (2 x 1 = 2).
%
% ** Los divisores de 6 son : 1,2,3 y 6.
% - ¿Cuáles son los divisores de 6?
% 	Son 2 y 3, ya que suponemos de nuestro conocimiento sobre divisibilidad que 2 divide a 6 y que 3 divide a 6.
% 
% ** Un numero es multiplo de 6 si lo dividimos por 6 y su resto es cero, es decir, su resultado es un numero entero.
% - ¿Conocemos algún múltiplo de 6?
% 	Si, el 12, porque es divisible por 2 y por 3 pero aparte porque si lo dividimos por 6 su resultado es un numero entero (12 / 6 = 2).
%%
