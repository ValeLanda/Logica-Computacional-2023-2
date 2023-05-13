/* Ejercicio 1)
 * Primero creamos nuestra base de conocimientos: */
vive_en(arsenio, ciudadPeluche20).
vive_en(arturo, alburquerque3).
vive_en(asahel, comala9).
vive_en(alan, ciudadNimbasa4).
vive_en(julieta, comala9).
vive_en(uziel, alburquerque3).
practica(uziel, clavados).
practica(beto, futbol_americano).
practica(eduardo, basquetbol).
nacionalidad(arsenio, titirilcano).
nacionalidad(arturo, escoces).
nacionalidad(asahel, irlandes).
nacionalidad(uziel, newjersey).
nacionalidad(alan, gales).
nacionalidad(julieta, ingles).
pago_tenencia(arsenio, no).
pago_tenencia(arturo, no).
pago_tenencia(asahel, si).
pago_tenencia(uziel, si).
pago_tenencia(julieta, si).
pago_tenencia(alan, no).
/*a) Dos personas viven en la misma casa si tienen la misma dirección. 
 *  Esto ocurre si dos personas distintas viven en el mismo lugar.
 * */
viven_misma_casa(Persona1, Persona2) :- vive_en(Persona1, Lugar), vive_en(Persona2, Lugar), Persona1\=Persona2.

/* b) Los que juegan basquetbol o fútbol americano son deportistas.
 * Esto ocurre si la persona en cuestión juega básquetbol o en su defecto, juega fútbol americano.
 * */
es_deportista(Persona) :- practica(Persona,basquetbol); practica(Persona,futbol_americano).


/* c) Eres británico si eres galés, inglés, escocés o irlandés. (Si la nacionalidad de la persona coincide con alguna de las anteriores).*/
es_britanico(Persona) :- nacionalidad(Persona, ingles).
es_britanico(Persona) :- nacionalidad(Persona, gales).
es_britanico(Persona) :- nacionalidad(Persona, escoes).
es_britanico(Persona) :- nacionalidad(Persona, irlandes).

/* d) Te pueden multar si no has pagado la tenencia de tu automóvil. (Si el pago de la tenencia esta marcagada como no pagada).*/
multa(Persona):- pago_tenencia(Persona, no).

% Ejercicio 2

% Función auxiliar que devuelve el número mayor.
mayor(X,Y,X) :- X > Y.
mayor(X,Y,Y) :- Y >= X.
% maximo, función que recibe una lista de números 
% y regresa el máximo número en la lista.
% En el caso base, solo hay un elemento, el máximo.
maximo([X], X).
% Caso recursivo, se consigue el mayor entre la cabeza de la lista y
% el máximo de la cola.
maximo([X|XS], Max) :- maximo(XS, Maxxs), mayor(X,Maxxs,Max),!.
% Incluye el backtracking de la lista [1,2,3,2,1].
%	1. Se calcula maximo([1,2,3,2,1], M).
%		1.1 Es necesario calcular maximo([2,3,2,1], Maxxs1).
%			1.1.1 Es necesario calcular maximo([3,2,1], Maxxs2).
%				1.1.1.1 Es necesario calcular maximo([2,1], Maxxs3).
%					1.1.1.1.1 Es necesario calcular maximo([1], Maxxs4).
%						1.1.1.1.1.1 Se calcula maximo([1],Maxxs4) = 1.
%					1.1.1.1.2 Es necesario calcular mayor(2,1,Max1).
%						1.1.1.1.2.1 mayor(2,1,Max1) = 2.
%					1.1.1.1.3 Así, Max1 = 2, Maxxs3=2, maximo([2,1], Maxxs3) = 2.
%				1.1.1.2 Es necesario calcular mayor(3,2,Max2).
%					1.1.1.2.1 mayor(3,2,Max2) = 3.
%				1.1.1.3 Así, Max2 = 3, Maxxs2 = 3, maximo([3,2,1],Maxxs2) = 3.
%			1.1.2 Es necesario calcular mayor(2,3,Max3).
%				1.1.2.1 mayor(2,3,Max3) = 3.
%			1.1.3 Así, Max3 = 3, Maxxs1 = 3, maximo([2,3,2,1],Maxxs1) = 3.
%		1.2 Es necesario calcular mayor(1,3, Max4).
%			1.2.1 mayor(1,3, Max4) = 3
%		1.3 Así, Max4 = 3, M = 3, maximo([1,2,3,2,1], M) = 3.
% Así, el resultado es 3.

% Ejercicio 3
% Función auxiliar que indica si un elemento está en una lista dada.
en_lista(X, [X|_]).
en_lista(X, [_|Xs]) :- en_lista(X, Xs).
% distintos, función que recibe una lista de números
% y devuelve la cantidad de números distintos.
% Caso base en el que no hay elementos en la lista.
cantidad_distintos([],0).
% Caso recursivo en el que el número está repetido.
cantidad_distintos([X|Xs],Cantidad) :- en_lista(X,Xs), cantidad_distintos(Xs,Cantidad), !.
% Caso recursivo en el que el número no está repetido
cantidad_distintos([X|Xs],Cantidad) :- not(en_lista(X,Xs)), cantidad_distintos(Xs,Cantidadxs), Cantidad is Cantidadxs + 1, !.
