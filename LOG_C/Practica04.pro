%1,Crea una base de conocimiento e implementa las relaciones de acuerdo a los siguientes enunciados.

%a. Dos personas viven en la misma casa si tienen la misma dirección.
%Ejemplo: viven_misma_casa(ana,alice). Salida: ana y alice viven en naranjos20 
%                                              true 

vive_en(pedro, naranjos20).
vive_en(alice, naranjos20).
vive_en(jesus, ahuahute30).
vive_en(andrea, ahuahute30).
vive_en(albert, aromes153).
vive_en(ana, naranjos20).
vive_en(clara, aromes153).
vive_en(betsy, viaducto293).

viven_misma_casa(P1,P2) :-
    vive_en(P1,X),
    vive_en(P2,X),
    write(P1), 
    write(' y '), 
    write(P2), 
    write(' viven en '), 
    write(X),
    P1\=P2, nl.

%b. Los que juegan basquetbol o fútbol americano son deportistas.
%Ejemplo: es_deportista(pedro). Salida: true 

juega(pedro, deporte(basquetbol)).
juega(pedro, deporte(soccer)).
juega(paco, deporte(futbolamericano)).
juega(dominik,deporte(basquetbol)).
juega(dominik,deporte(futbolamericano)).
juega(charlie,deporte(soccer)).
juega(alice,deporte(tennis)).
juega(charlie,deporte(golf)).


es_deportista(Deportista) :- 
     juega(Deportista,deporte(basquetbol)); 
     juega(Deportista,deporte(futbolamericano)).


%c. Eres británico si eres galés, inglés, escocés o irlandés.
%Ejemplo: ser_britanico(lorna). Salida: true

es(cedric,gales).
es(dylan,gales).
es(conan,gales).
es(brad,gales).
es(oliver,ingles).
es(john,ingles).
es(cameron,escoces).
es(lorna,escoces).
es(macbeth,escoces).
es(alana,irlandes).
es(marie,irlandes).
es(roisin,irlandes).
es(maeve,irlandes).
es(rose,sueca).
es(mari,frances).

ser_britanico(Persona) :- 
    es(Persona,gales); 
    es(Persona,ingles); 
    es(Persona,escoces); 
    es(Persona,irlandes).


%d. Te pueden multar si no has pagado la tenencia de tu automóvil.
%Ejemplo: pueden_multar_a(angela). Salida: angela no ha pagado la tenencia de su automóvil,
%                                          asi que la pueden multar
%Ejemplo: pueden_multar_a(roisin). Salida: false

no_pago_tenencia(angela).
no_pago_tenencia(dominic).
no_pago_tenencia(diana).
no_pago_tenencia(alice).
no_pago_tenencia(jesus).

pueden_multar_a(Conductor) :- 
       no_pago_tenencia(Conductor),
       write(Conductor),
       write(' '),
       write('no ha pagado la tenencia de su automóvil, asi que le pueden multar'), nl.


%2.Implementa la función que te devuelva el máximo de una lista de números,
%todas las funciones auxiliares deben ser propias. Incluye el backtracking de la lista
%[1,2,3,2,1].
%Ejemplo: maximo([1,2,3,2,1], Max). Salida: Max = 3

tamanio([],0).
tamanio([_|T],N) :- tamanio(T,N1), N is N1+1.


mayor_que(Y,Z,Y) :- Y>Z.
mayor_que(Y,Z,Z) :- Y<Z.

maximo([],0).
maximo([Y],Y).
maximo([Y,C|T],Maximo) :-  maximo([C|T],Max), mayor_que(Y,Max,Maximo).


%3.Implementa la función que te devuelva la cantidad de números distintos
%en una lista.
%Ejemplo: distintos([1,2,3,4,5,5], Distintos)  Salida: Distintos = 5

%Verifica que el un elemento este en la lista
pertenece_a_lista(X, [X|_]).
pertenece_a_lista(X, [_|Tail]) :- pertenece_a_lista(X, Tail).


distintos([], 0).
distintos([Cabeza|Cola],Cantidad) :-  
     pertenece_a_lista(Cabeza,Cola),
     distintos(Cola,Cantidad).
distintos([Cabeza|Cola],Cantidad) :-
     not(pertenece_a_lista(Cabeza,Cola)),
     distintos(Cola,Aux),
     Cantidad is Aux+1.

%4.Implementa la función de Fibonacci. Incluye el backtracking de 5.
%Ejemplo: fibonacci(3,Fib). Salida: Fib = 2

fibonacci(0, 0).
fibonacci(1, 1).
fibonacci(Numero, X) :- 
      Numero > 0, 
      P1 is Numero-1, 
      fibonacci(P1,Y), 
      P2 is Numero-2, 
      fibonacci(P2,Z), 
      X is Y+Z.