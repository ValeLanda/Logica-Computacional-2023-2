%Ejercicio 1
%Crear una función que dada una lista(x|xs), sume todos sus elementos y luego sume 
%dicho resultado lo use para ir obteniendo los elementos de otra lista y|ys de tal
%forma que cada elemento de y|ys será igual al xi+suma

%Función auxiliar que suma todos los elementos de una lista:
% Tomamos a V como variable en donde se guardará el resultado de la suma
suma_Lista([X|XS],V):- suma_Lista(XS,Z), V is Z+X.

%Función auxiliar que le suma a cada elemento de la lista un número
% En este caso X|XS es la lista original y Y|YS la que obtendremos 
suma_Elemento([X|XS],N,[Y:YS]):-suma_Elemento(XS,N,YS),Y is X+N.

% Función combina(L1,L2)
combina([X|XS],[Y|YS]):- suma_Lista([X|XS],N), suma_Elemento(XS,N,YS),y is X+N.

%Ejercicio 2
%Función convexo que devuelve true si los elementos de la lista son crecientes al inicio de la lista y decrecientes en el resto de la lista.
convexo([A,B|T]) :- A < B, convexo([B|T]).
convexo([A,B|T]) :- A > B, decreciente([B|T]).

%Función auxiliar de la función convexo que identifica si una lista es decreciente
decreciente([]).
decreciente([_]).
decreciente([A,B|T]) :- A > B, decreciente([B|T]).

%Ejercicio 3
%Función decimal a binario
dec_bin(0,'0').
dec_bin(1,'1').
dec_bin(D,B) :- D > 1, N is D mod 2, M is D//2, dec_bin(M,Bn), atom_concat(Bn,N,B).

%Ejercicio 4
%Supongamos que tenemos el siguiente conocimiento de sobre divisibilidad:
%2 divide a 6
%2 divide a 12
%3 divide a 6
%3 divide a 12
%Si un número es divisible por 2 y por 3 entonces es divisible por 6
%Escribir un predicado que represente este conocimiento y usarlo para responder a las siguientes preguntas:
%¿Existe algún múltiplo de 2?
%¿Cuáles son los divisores de 6?
%¿Conocemos algún múltiplo de 6?
divide(2,6).
divide(2,12).
divide(3,6).
divide(3,12).
divide(6,X):- divide(2,X),divide(3,X).

