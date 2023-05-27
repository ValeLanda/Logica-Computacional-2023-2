%% Ejercicio 1 %%
%Hechos
vive_en(juan, casa_azul).
vive_en(maria, casa_azul).
vive_en(pedro, casa_roja).

juega(juan, basquetbol).
juega(maria, futlbol_americano).
juega(pedro, natación).

nacionalidad(bob, gales).
nacionalidad(ana, inglaterra).
nacionalidad(juan, escocia).
nacionalidad(maria, irlanda).

tenencia_impagada(juan).
tenencia_impagada(pedro).

%Dos personas viven en la misma casa si tienen la misma dirección
misma_casa(Persona1, Persona2) :-
    vive_en(Persona1, Casa),
    vive_en(Persona2, Casa),
    Persona1 \= Persona2.

%Los que juegan basquetbol o fútbol americano son deportistas.
deportista(Persona) :-
    juega(Persona, basquetbol);
    juega(Persona, futbol_americano).

%Eres britanico si eres galés, inglés, escocés o irlandés
britanico(Persona) :-
    nacionalidad(Persona, gales);
    nacionalidad(Persona, inglaterra);
    nacionalidad(Persona, escocia);
    nacionalidad(Persona, irlanda).

%Te pueden multar si no has pagado la tenencia de tu automóvil
puede_ser_multado(Persona) :-
    tenencia_impagada(Persona).

%Ejemplos
% Ejemplos para misma_casa
% Juan y María viven en la misma casa (casa_azul)
%?- misma_casa(juan, maria). true

%Pedro y María viven en la misma casa (casa_roja)
%?- misma_casa(pedro, maria). false

%Ejemplos para deportistas
%Juan juega al basquetbol
%?- deportista(juan). true

% María juega al fútbol americano
%?- deportista(maria). true

% Pedro no juega ni basquetbol ni fútbol americano
%?- deportista(pedro). false

% Ejemplos para britanico/1
% Bob es galés
%?- britanico(bob). true

% Ana es inglesa
%?- britanico(ana). true

% Juan es escocés
%?- britanico(juan). true

% María es irlandesa
%?- britanico(maria). true

% Pedro no es galés, inglés, escocés ni irlandés
%?- britanico(pedro). false

% Ejemplos para puede_ser_multado/1
% Juan tiene la tenencia de su automóvil impagada
%?- puede_ser_multado(juan). true

% Pedro tiene la tenencia de su automóvil impagada
%?- puede_ser_multado(pedro). true

% María no tiene la tenencia de su automóvil impagada
%?- puede_ser_multado(maria). false

%% Ejercicio 2 %%

%Clausulas
% max_list([X], X).
% max_list([H|T], Max) :- max_list(T, TailMax), (H > TailMax -> Max = H ; Max = TailMax).
% backtracking_max_list(Max) :- bagof(Max, max_list([1,2,3,2,1], Max), List), member(Max, List).
max_list([X], X).
max_list([H|T], Max) :- max_list(T, TailMax), H >= TailMax, Max = H.
max_list([H|T], Max) :- max_list(T, TailMax), H < TailMax, Max = TailMax.
backtracking_max_list(Max) :- max_list([1,2,3,2,1], Max).

% Metas
% max_list([3,7,1,9,4], Max).
% backtracking_max_list(Max).

% Submetas
% max_list(T, TailMax), (H > TailMax -> Max = H ; Max = TailMax).
% bagof(Max, max_list([1,2,3,2,1], Max), List), member(Max, List).

%Variables logicas
% X, H, T, Max, TailMax
% 
% Constantes
% 3, 7, 1, 9, 4

% Atomos
% max_list, backtracking_max_list

% Aridades
% max_list/2
% backtracking_max_list/1

% Functores
% max_list/2: 'max_list' es el functor.
% backtracking_max_list/1: 'backtracking_max_list' es el functor.

% argumentos
% max_list([X], X): 'max_list' tiene 2 argumentos - la lista de entrada y el resultado.
% max_list([H|T], Max): 'max_list' tiene 2 argumentos - la lista de entrada y el resultado.
% backtracking_max_list(Max): 'backtracking_max_list' tiene 1 argumento
%- el resultado.

%% Ejercicio 3 %%
numeros_distintos([],0).
numeros_distintos([X|Xs], R) :- 
    \+member(X,Xs), numeros_distintos(Xs, Raux), R is Raux+1.
numeros_distintos([X|Xs], R) :-
    member(X,Xs), numeros_distintos(Xs, R).

%% Ejercicio 4 %%
%Fibonacci
fibonacci(0,0). %Caso base
fibonacci(1,1). %Caso base
fibonacci(N, F) :- N > 1, N1 is N - 1, N2 is N - 2, fibonacci(N1, F1), fibonacci(N2, F2), F is F1 + F2.% Paso recursivo.
% Se ingresa el enésimo término en N y F se deja en la llamada de fibonacci.

% Backtracking de 5:
% fibonacci(5, F) :- 5 > 1, N1 is 5 - 1, N2 is 5 - 2, fibonacci(4, F1), fibonacci(3, F2), F is F1 + F2.
% fibonacci(4, F) :- 4 > 1, N1 is 4 - 1, N2 is 4 - 2, fibonacci(3, F1), fibonacci(2, F2), F is F1 + F2.
% fibonacci(3, F) :- 3 > 1, N1 is 3 - 1, N2 is 3 - 2, fibonacci(2, F1), fibonacci(1, F2), F is F1 + F2.
% fibonacci(2, F) :- 2 > 1, N1 is 2 - 1, N2 is 2 - 2, fibonacci(1, F1), fibonacci(0, F2), F is F1 + F2.
% fibonacci(1, 1).
% fibonacci(0, 0).
% 
% Al hacer las llamadas recursivas calculamos F, sumando las F's comenzando con los casos base
% Omitimos el conteo del caso base en que tomamos a 0
% fibonacci(0, 0).
% fibonacci(1, 1).
% fibonacci(2, 1) :- 2 > 1, N1 is 2 - 1, N2 is 2 - 2, fibonacci(1, 1), fibonacci(0, 0), F is 1 + 0.
% fibonacci(3, 2) :- 3 > 1, N1 is 3 - 1, N2 is 3 - 2, fibonacci(2, 1), fibonacci(1, 1), F is 1 + 1.
% fibonacci(4, 3) :- 4 > 1, N1 is 4 - 1, N2 is 4 - 2, fibonacci(3, 2), fibonacci(2, 1), F is 2 + 1.
% fibonacci(5, 5) :- 5 > 1, N1 is 5 - 1, N2 is 5 - 2, fibonacci(4, 3), fibonacci(3, 2), F is 2 + 3.
% La F es el resultado el enésimo termino