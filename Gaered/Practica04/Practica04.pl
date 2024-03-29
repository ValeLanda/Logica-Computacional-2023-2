% Ejercicio 1
% Dos personas viven en la misma casa si tienen la misma dirección.
direccion(pablo,coyoacan).
direccion(juan,coyoacan).
direccion(ana,neza).
viveEnLaMismaCasa(X,Y) :- direccion(X,Z), direccion(Y,Z).

% Los que juegan basquetbol o fútbol americano son deportistas.
juega(lebron,basquetbol).
juega(brady,americano).
juega(woods,golf).
esDeportista(X) :- juega(X,basquetbol); juega(X,americano).

% Eres británico si eres galés, inglés, escocés o irlandés.
nacionalidad(gareth,gales).
nacionalidad(paul,ingles).
nacionalidad(karen,escoses).
nacionalidad(bono,irlandes).
nacionalidad(maria,mexicano).
esBritanico(X) :- nacionalidad(X,gales);
    	nacionalidad(X,ingles); 
    	nacionalidad(X, escoses); 
    	nacionalidad(X,irlandes).

% Te pueden multar si no has pagado la tenencia de tu automóvil.
pagoTenencia(pedro).
pagoTenencia(frida).
multar(X) :- not(pagoTenencia(X)).

% Ejercicio 2
% Predicado auxiliar para comparar dos números y devolver el mayor
mayor(X,Y,X) :- X >= Y.
mayor(X,Y,Y) :- X < Y.

% Caso base: la lista vacia, el máximo es 0
maximo([],0).
% Caso base: la lista tiene un solo elemento, el máximo es ese elemento
maximo([X], X). 
% Caso recursivo: calcula el máximo de la cola de la lista y compáralo con la cabeza
maximo([X|Xs], Max) :- maximo(Xs, MaxAux), mayor(X, MaxAux, Max). 

% Backtracking de [1,2,3,2,1]:
% Calculamos: maximo([1,2,3,2,1],Max).
% Para esto, debemos conocer:   maximo([2,3,2,1],MaxAux)
%                               mayor(1,MaxAux,Max)
% Calculamos: maximo([2,3,2,1],MaxAux).
% Para esto, debemos conocer:   maximo([3,2,1],MaxAux2)
%                               mayor(2,MaxAux2,MaxAux)
% Calculamos: maximo([3,2,1],MaxAux).
% Para esto, debemos conocer:   maximo([2,1],MaxAux3)
%                               mayor(3,MaxAux3,MaxAux2)
% Calculamos: maximo([2,1],MaxAux).
% Para esto, debemos conocer:   maximo([1],MaxAux4)
%                               mayor(2,MaxAux4,MaxAux3)
% Calculamos maximo([1],MaxAux4)
% Por caso base, tenemos que MaxAux4=1
% Sustituyendo: mayor(2,1,MaxAux3)
% Entonces: MaxAux3=2
% Sustituyendo: mayor(3,2,MaxAux2)
% Entonces: MaxAux2=3
% Sustituyendo: mayor(2,3,MaxAux)
% Entonces: MaxAux=3
% Sustituyendo: mayor(1,3,Max)
% Entonces: Max=3

% Ejercicio 3
% Predicado auxiliar para ver si una Lista contiene a un elemento
contiene(Z,[Z|_]).
contiene(Z,[_|Xs]) :- contiene(Z,Xs).

numDistintos([],0).
numDistintos([X|Xs], Num) :- contiene(X,Xs), numDistintos(Xs,Num).
numDistintos([X|Xs], Num) :- \+ contiene(X,Xs), numDistintos(Xs,N), Num is N+1.

% Ejercicio 4
fibonacci(0,0).
fibonacci(1,1).
fibonacci(X,N) :- X>1, N_1 is X-1, N_2 is X-2, fibonacci(N_1,S), fibonacci(N_2,Z), N is S+Z.

% Calculamos: fibonacci(5,N)    ::  N=N_2+N_3
% Para esto debemos conocer:    fibonacci(4,N_2)
%                               fibonacci(3,N_3)
% Calculamos: fibonacci(4,N_2)   ::  N_2=N_3+N_4
% Para esto debemos conocer:    fibonacci(3,N_3)
%                               fibonacci(2,N_4)
% Calculamos: fibonacci(3,N_3)   ::  N_3=N_4+N_5
% Para esto debemos conocer:    fibonacci(2,N_4)
%                               fibonacci(1,N_5)
% Calculamos: fibonacci(2,N_4)   ::  N_4=N_5+N_6
% Para esto debemos conocer:    fibonacci(1,N_5)
%                               fibonacci(0,N_6)
% Calculamos fibonacci(1,N_5) y fibonacci(0,N_6)
% Por casos base tenemos que: N_6=0 y N_5=1
% Sustituyendo: N_4=1+0=1
% Sustituyendo: N_3=1+1=2
% Sustituyendo: N_2=2+1=3
% Sustituyendo: N=3+2=5
