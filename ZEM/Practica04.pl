%----------------------------------EJERCICIO 1-----------------------------------
%Crea una base de conocimiento e implementa las relaciones de acuerdo a lo solicitado.
% Relación "viven_en_la_misma_casa"
viven_en_la_misma_casa(Persona1, Persona2) :-
    direccion(Persona1, Direccion),
    direccion(Persona2, Direccion),
    Persona1 \= Persona2.

% Relación "es_deportista"
es_deportista(Persona) :-
    juega_basquetbol(Persona).
es_deportista(Persona) :-
    juega_futbol_americano(Persona).

% Relación "eres_britanico"
eres_britanico(Persona) :-
    es_gales(Persona).
eres_britanico(Persona) :-
    es_ingles(Persona).
eres_britanico(Persona) :-
    es_escoces(Persona).
eres_britanico(Persona) :-
    es_irlandes(Persona).

% Relación "te_pueden_multar"
te_pueden_multar(Persona) :-
    tiene_auto(Persona),
    not(ha_pagado_tenencia(Persona)).

% Hechos
direccion(lalo, "Av. Universidad #44").
direccion(miguel, "Av. Universidad #44").
direccion(zyan, "Av.Copilco #45").
juega_basquetbol(francisco).
juega_futbol_americano(agustin).
es_gales(bael).
es_ingles(kane).
es_escoces(henderson).
es_irlandes(alexander).
tiene_auto(jose).
tiene_auto(luis).
ha_pagado_tenencia(jose).

%Ej de como consultar: viven_en_la_misma_casa(lalo, miguel) y así las comparaciones con los
% ejercicios solicitados.

%----------------------------------EJERCICIO 2-----------------------------------

%Implementa la función que te devuelva el máximo de una lista de números,
%todas las funciones auxiliares deben ser propias. 
maxLista([X], X).
maxLista([H|T], Maximo) :- maxLista(T, TMaximo), maximo(H, TMaximo, Maximo).

maximo(A, B, A) :- A >= B.
maximo(A, B, B) :- B > A.

%Ej de como consultar: maxLista([1,2,3,2,1], Maximo)

%----------------------------------EJERCICIO 3-----------------------------------

%Implementa la función que te devuelva la cantidad de números distintos en una lista.
numerosDistintos([], 0).
numerosDistintos([H|T], Contar) :- elemento(H, T), !, numerosDistintos(T, Contar).
numerosDistintos([_|T], Contar) :- numerosDistintos(T, TContar), Contar is TContar + 1.

elemento(Elem, [Elem|_]).
elemento(Elem, [_|Rest]) :- member(Elem, Rest).

%Ej de como consultar: numerosDistintos([1,2,3,4,6,6,7,7], Contar)

%----------------------------------EJERCICIO 4-----------------------------------
%Implementa la función fibonacci
%Para hacer el backtracking de los primeros 5 números de la secuencia de Fibonacci, 
%podemos hacer consultas a la función fib/2 con N en el rango de 0 a 4:
%el backtracking se detiene después de encontrar la solución para cada uno de los primeros 5 números
%de Fibonacci. Después de encontrar la solución para N = 4, el backtracking falla porque no hay más 
%soluciones para N < 5.
fib(0, 0).
fib(1, 1).
fib(N, Resultado) :- N > 1, N1 is N-1, N2 is N-2, fib(N1, R1), fib(N2, R2), Resultado is R1 + R2.

%Ej de como consultar: fib(1, Resultado)




