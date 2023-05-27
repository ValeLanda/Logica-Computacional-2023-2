%1.- Implementación de la función combina(L1,L2) que recibe una lista L1 de números y a partir de ella construye L2.
%Ejemplo:
%L1 = [0,3,7,5,11,2]
%L2 = [28,31,35,33,39,30]
combina(L1,L2) :- combina(L1,L2,0).
combina([],[],_).
combina([X|Xs],[Y|Ys],N) :- Y is X + N, combina(Xs,Ys,Y).


%2.- Implementa la función convexo(L1) que devuelve true si los elementos de la lista son crecientes al inicio de la lista y decrecientes en el resto de la lista.
%Ejemplo:
%[2,6,8,7,5,1,0] -> true
%[3,7,5,4,9] -> false
%[0 2 4 3] -> true
%[3,7,7,4,2] -> false
convexo(L1) :- convexo(L1,0).
convexo([],_).
convexo([X|Xs],N) :- X >= N, convexo(Xs,X).
convexo([X|Xs],N) :- X < N, convexo(Xs,X).


%3.- Implementación de la función decimal_binario(D, B) donde D es un número en base 10 y B es su representación binaria.
decimal_binario(D,B) :- decimal_binario(D,B,[]). %Caso base
decimal_binario(0,B,B).
decimal_binario(D,B,C) :- D > 0, D1 is D mod 2, D2 is D // 2, decimal_binario(D2,B,[D1|C]). %Caso recursivo


%4.- Tenemos conocimiento de divisibilidad de lo siguiente:
divisible(2,6)
divisible(2,12)
divisible(3,6)
divisible(3,12)
divisible(6,X) :- divisible(2,X), divisible(3,X).
%Entonces respondiendo a las preguntas obtenemos:
%¿Existe algún múltiplo de 2?
%Usando:
%divisible(2,X).
%Obtenemos:
%X = 6
%X = 12

%¿Cuáles son los divisores de 6?
%Usando:
%divisible(X,6).
%Obtenemos:
%X = 2
%X = 3
%X = 6

%¿Conocemos algún múltiplo de 6?
%Usando:
%divisible(6,X).
%Obtenemos:
%X = 6
%X = 12