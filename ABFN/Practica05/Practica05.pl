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
%los divisores de 6 son 6 y 12
%¿Conocemos algún múltiplo de 6? si, 6 y 12



