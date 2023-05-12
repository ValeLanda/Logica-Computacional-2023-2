% Practica 04

% Ejercicio 01
% Crea una base de conocimiento e implementa las relaciones de acuerdo a los siguientes enunciados.
% a) Dos personas viven en la misma casa si tienen la misma dirección.

vive_en(bruno,tlalpan).
vive_en(ulises,colonial).
vive_en(octavio,coapa).
vive_en(miguel,neza).
vive_en(osiel,coapa).
vive_en(alejandro,neza).

viven_en_misma_casa(X,Y) :- vive_en(X,Direccion) , vive_en(Y,Direccion).

% Ejemplos:
% Evalua en true
% viven_en_misma_casa(octavio,osiel)
% viven_en_misma_casa(miguel,alejandro)

% Evalua en false
% viven_en_misma_casa(ulises,alejandro)
% viven_en_misma_casa(miguel,bruno)

% b) Los que juegan basquetbol o fútbol americano son deportistas.

juega_basquet(diego).
juega_americano(gabriel).

juega_videojuegos(bruno).
juega_videojuegos(leo).

es_deportista(X) :-juega_basquet(X);juega_americano(X).

% Ejemplos:
% Evalua en true
% es_deportista(gabriel)
% es_deportista(diego)

% Evalua en false
% es_deportista(bruno)
% es_deportista(leo)

% c) Eres británico si eres galés, inglés, escocés o irlandés. 

es_gales(eduardo).
es_ingles(michael).
es_escoces(tommy).
es_irlandes(cal).
es_mexicano(gabriel).
es_colombiano(bruno).
es_chino(leo).
es_japones(alejandro).

es_britanico(X):- es_gales(X) ; es_ingles(X) ; es_escoces(X) ; es_irlandes(X).

% Ejemplos:
% Evalua en true
% es_britanico(tommy)
% es_britanico(cal)

% Evalua en false
% es_britanico(leo)
% es_britanico(gabriel)


% d)Te pueden multar si no has pagado la tenencia de tu automóvil. 

pago_tenencia(gabriel,no).
pago_tenencia(miguel,si).
pago_tenencia(bruno,si).
pago_tenencia(osiel,no).

recibe_multa(X):- pago_tenencia(X,no).


% Ejemplos:
% Evalua en true
% recibe_multa(osiel)
% recibe_multa(gabriel)

% Evalua en false
% recibe_multa(bruno)
% recibe_multa(miguel)

/*  
    Ejercicio 2
    Función que devuelve el máximo de una lista de números, 
    Utiliza una función auxiliar para comparar dos números
*/

maximoLista([X],X).
maximoLista([X|Xs], Max) :- 
    maximoLista(Xs, Max1),
    max(X, Max1, Max).

max(X,Y,X) :- X >= Y.
max(X,Y,Y) :- X < Y.

/*  
    Ejercicio 3
    Función que calcula los números distintos en una lista. 
    Utiliza una función auxiliar para verificar que un elemento esté dentro de una lista.
*/

cantidad_num([],0).
cantidad_num([X|Xs], N) :- not(esta_en_lista(X, Xs)), cantidad_num(Xs, N1),N is N1 + 1.
cantidad_num([X|Xs], N) :- esta_en_lista(X, Xs), cantidad_num(Xs, N).

esta_en_lista(X, [X|_]).
esta_en_lista(X, [_|Xs]) :- esta_en_lista(X, Xs).