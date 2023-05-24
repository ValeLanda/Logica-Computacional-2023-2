% Lógica Computacional: Práctica 4

% EJERCICIO 1A
% Dos personas viven en la misma casa si tienen la misma dirección.

% Definimos una pequeña base de conocimiento con este predicado:
% Léase "El domicilio de Álvaro es en Calle Xoco 11".
domicilio(alvaro, calle_xoco_11).
domicilio(beatriz, calle_xoco_11).
domicilio(cecilio, avenida_reforma_39).
domicilio(denisse, cerrada_faisanes_27).
domicilio(emma, cerrada_faisanes_27).
domicilio(fabrizio, cerrada_faisanes_27).

% Entonces: Si el domicilio Z es el mismo para X y Y, estos viven
% en la misa casa.
misma_casa(X, Y) :- domicilio(X, Z), domicilio(Y, Z).

% EJERCICIO 1B
% Los que juegan basquetbol o fútbol americano son deportistas.

% Definimos los predicados 'jugar basquetbol' y 'jugar americano' para
% hacer una base de conocimiento.
juega_basquetbol(lebron_james).
juega_americano(sam_roberts).

% Si X juega basquetbol o fútbol americano, entonces X es deportista.
deportista(X) :- juega_basquetbol(X); juega_americano(X).

% EJERCICIO 1C
% Eres británico si eres galés, inglés, escocés o irlandés.

% Esta es una base de conocimiento detonando los predicados para las
% nacionalidades galés, inglés, escocés e irlandés.
galés(wayne_hennessey).
inglés(declan_rice).
escocés(andrew_robertson).
irlandés(matt_doherty).

británico(X) :- galés(X); inglés(X); escocés(X); irlandés(X).

% EJERCICIO 1D
% Te pueden multar si no has pagado la tenecia de tu automóvil.

% Léase cómo "Alberto es dueño del automóvil con las placas yhz_19_26".
dueño(alberto, yhz_19_26).
dueño(bernardo, ngf_92_58).
dueño(catalina, mug_13_13).
dueño(damian, pcz_17_39).

% Léase "El automóvil con las placas yhz_19_26 tiene la tenencia pagada".
tenencia_pagada(yhz_19_26).
tenencia_pagada(mug_13_13).

% Entonces: Si X es dueño de Y, y Y no tiene la tenencia pagada,
% X puede ser multado.
multable(X) :- dueño(X,Y), not(tenencia_pagada(Y)).

% EJERCICIO 2
% Implementa la función que te devuelva el máximo de una lista de números,
% todas las funciones auxiliares deben ser propias. Incluye el backtracking
% de la lista [1,2,3,2,1]

% Primer paso: MAX es el máximo hipotético de la lista.
maximo([X|Xs]) :- maximo(Xs, X).
% Si X es mayor a MAX, Entonces X es el máximo hipotético.
maximo([X|Xs], MAX) :- X >= MAX, maximo(Xs, X).
% Si el siguiente elemento X es menor a MAX, MAX sigue siendo el máximo hipotético.
maximo([X|Xs], MAX) :- X < MAX, maximo(Xs, MAX).
% Al finalizar de iterar toda la lista, imprimimos MAX como resultado.
maximo([], MAX) :- print(MAX).

% EJERCICIO 3
% Implementa la función que te devuelva la cantidad de números distintos
% en una lista.

% Primer paso: Sea la lista de números sin procesar, vamos a iterarla y contar
% las ocurrencias únicas de cada elemento
numeros_distintos(Lista) :- numeros_distintos(Lista, [], 0).
% Si el número iterado ya fué contado, entonces lo ignoramos.
numeros_distintos([X|Xs], Contados, N) :- memberchk(X, Contados), numeros_distintos(Xs, Contados, N).
% Si el número iterado no ha sido contado, entonces lo ponemos en la lista de contados.
numeros_distintos([X|Xs], Contados, N) :- memberchk(X, Contados) -> false; numeros_distintos(Xs, [X|Contados], N+1).
% Cuando la lista sea vacía, imprimimos el conteo de ocurrencias de números únicos.
numeros_distintos([], _, N) :- Resultado is N, print(Resultado).


% EJERCICIO 4
% Implementa la función de Fibonacci. Incluye el backtracking de 5.

% Léase como "El número 0 en la secuencia de Fibonacci es 0"
fibonacci(0, 0).
% Léase como "El número 1 en la secuencia de Fibonacci es 1"
fibonacci(1, 1).
% Entonces: El número N en la secuencia de Fibonacci es X, tal que:
fibonacci(N, X) :-
    % Sea N mayor que 1, y...
    N > 1,
    % El antecesor de N, es igual a N-1, y...
    Antecesor is N - 1,
    % El pre-antecesor de N, es igual a N-2, y...
    Pre_antecesor is N - 2,
    % Sea Fib_1 el número de Fibonacci correspondiente al Antecesor, y...
    fibonacci(Antecesor, Fib_1),
    % Sea Fib_2 el número de Fibonacci correspondiente al Pre-antecesor, entonces...
    fibonacci(Pre_antecesor, Fib_2),
    % X es igual a la suma de Fib_1 y Fib_2:
    X is Fib_1 + Fib_2.

% Para calcular el número n de Fibonacci, habrá que consultar:
% ?- fibonacci(n, X).
% Donde n es un natural arbitrario y X una variables desconocida (el resultado).
