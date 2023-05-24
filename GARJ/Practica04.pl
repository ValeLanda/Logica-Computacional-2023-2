%1. Crea una base de conocimiento e implementa las relaciones de acuerdo a los siguientes enunciados.

% * Direccion de una persona.
direccionDe(juan, coyoacan).
direccionDe(diego, coyoacan).
direccionDe(rodolfo, iztapalapa).
% a. Dos personas viven en la misma casa si tienen la misma dirección.
vivenEnLaMismaCasa(X,Y) :- direccionDe(X,Z), direccionDe(Y,Z).

% * Deporte que juega una persona.
juega(juan, basquetbol).
juega(diego, futbol_americano).
juega(rodolfo, tennis).
% b. Los que juegan basquetbol o fútbol americano son deportistas.
esDeportista(X) :- juega(X, basquetbol).
esDeportista(X) :- juega(X, futbol_americano).

% * Nacionalidad de una persona
nacionalidadDe(juan, gales).
nacionalidadDe(diego, ingles).
nacionalidadDe(rodolfo, escoces).
nacionalidadDe(mauricio, irlandes).
nacionalidadDe(ana, mexicano).
% c. Eres británico si eres galés, inglés, escocés o irlandés. 
esBritanico(X) :- nacionalidadDe(X, gales).
esBritanico(X) :- nacionalidadDe(X, ingles).
esBritanico(X) :- nacionalidadDe(X, escoces).
esBritanico(X) :- nacionalidadDe(X, irlandes).

% * Pagó la tenencia de su automóvil una persona.
pagoTenencia(juan, si).
pagoTenencia(diego, no).
% d. Te pueden multar si no has pagado la tenencia de tu automóvil. 
puedeSerMultado(X) :- pagoTenencia(X, no).


%2. Implementa la función que te devuelva el máximo de una lista de números, todas las funciones auxiliares deben ser propias. Incluye el backtracking de la lista [1,2,3,2,1].

max_list([X], X).
max_list([H|T], Max) :-
    max_list(T, TempMax),
    Max is max(H, TempMax).

%Backtracking de la lista [1,2,3,2,1]
%max_list([1,2,3,2,1]  = max_list[2,3,2,1]
%max_list([3,2,1]) = max_list([2,1])
%max_list([1])

%3. Implementa la función que te devuelva la cantidad de números distintos en una lista.

numeros_distintos([Result], [List], Result).
numeros_distintos([_|L], [List], Result) :- (\+ member(L, List)) -> addElement(L, [List], List),
                                            numeros_distintos(L, [List], Result).

%Funcion auxiliar
addElement(X, [], [X]). 
addElement(X, [Y | Rest], [X,Y | Rest]) :- X @< Y, !.
addElement(X, [Y | Rest1], [Y | Rest2]) :- addElement(X, Rest1, Rest2).

%4.  Implementa la función de Fibonacci. Incluye el backtracking de 5.
fibonacci(0,0).
fibonacci(1,1).
fibonacci(N,R) :- A is N-1, B is N-2, fibonacci(A,R1), fibonacci(B,R2), R is R1+R2.

%   Backtracking de 5:
%
%                5
%				/ \
%			   /   \
%			  /     \
%			 /       \
%			/         \
%		   4           3
%		  / \         / \
%     	 /   \       /   \
%     	3     2     2     1
% 	   / \   / \   / \ 
%     2   1 1   0 1   0
%    / \
%   1   0
%   
%   fibonacci(5) = fibonacci(4) + fibonacci(3) = (fibonacci(3) + fibonacci(2)) + (fibonacci(2) + fibonacci(1)) = ((fibonacci(2) + fibonacci(1)) + (fibonacci(1) + fibonacci(0))) + 
%   ((fibonacci(1) + fibonacci(0)) + 1) = (((fibonacci(1) + fibonacci(0)) + 1) + (1 + 0)) + ((1 + 0) + 1) = (((1+0)+1)+1) + (1+1) = ((1+1)+1) + 2 = (2+1) + 2 = 3 + 2 = 5
                                             