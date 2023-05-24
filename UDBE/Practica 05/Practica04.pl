% Practica 05

% Ejercicio 3
% Funcion decimal_binario(D, B) donde D es un número en base 10 y B su representación binaria

decimal_binario(0, [0]).
decimal_binario(1, [1]).
decimal_binario(D, B) :-
    D > 1,
    Residuo is D mod 2,
    Resultado is D div 2,
    decimal_binario(Resultado, RestoBin),
    append(RestoBin, [Residuo], B).



