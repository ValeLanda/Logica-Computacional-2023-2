% Ejercicio 1
% Una persona x tiene una dirección Y
tiene('Maura','Roble').
tiene('Karen','Roble').
tiene('Santiago','Jazmin').
tiene('Victoria','Lirio').

vivenMismaCasa(A,C):- tiene(A,B),tiene(C,B).
% ejemplo de consulta a la base de conocimiento
% ?- vivenMismaCasa('Maura','Karen').-> true
% ?- vivenMismaCasa('Victoria','Santiago').-> false

% Ejercicio 2
% Una persona X practica algun deṕorte Y
practicaDeporte('Javier','Futbol americano').
practicaDeporte('Maria','Basquetbol').
practicaDeporte('Martin','Natacion').

esDeportista(A):- practicaDeporte(A,'Futbol americano'); practicaDeporte(A,'Basquetbol').
%ejemplo de consulta a la base de conocimiento
% ?- esDeportista('Javier').-> True
% ?- esDeportista('Martin').-> False 

% Ejercicio 3
origen('Claudio','galés').
origen('Sofia','inglés').
origen('George','escocés').
origen('Stella','irlandés').

esBritanico(A):- origen(A,'galés');origen(A,'inglés');origen(A,'escocés');origen(A,'irlandés').
%ejemplo de consulta a la base de conocimiento
% ?- esBritanico('Stella').-> true
% ?- esBritanico('Carlos')-> False 

% Ejercicio 4
pagarTenencia('Juan','si').
pagarTenencia('Jose','no').
multa(A):- pagarTenencia(A,'no').

% Ejemplo de consulta
% ?- multa('Juan') -> false
% ?- multa('Jose')-> True

% Función que devuelve el máximo de una lista de números.
maximo([M],M).
maximo([X|L],M) :- maximo(L,M),M >= X.
maximo([X|L],X) :- maximo(L,M),M < X.

% Backtracking: [1,2,3,2,1].
% maximo([1,2,3,2,1],3).
% maximo([1|[2,3,2,1]],3) :- maximo([2,3,2,1],3), 3 >= 1.
% maximo([2|[3,2,1]],3) :- maximo([3,2,1],2), 3 >= 2.
% maximo([3|[2,1]],3) :- maximo([2,1],2), 2 < 3.
% maximo([2|[1]],2) :- maximo([1],1), 1 < 2.
% maximo([1],1).

% Función que devuelve la cantidad de números distintos en una lista.
distintos([],0).
distintos([X|L],R) :- distintos(L,Y),(pertenece(X,L) -> R is Y; R is Y+1).

% Función que determina si un elemento está en una lista.
pertenece(X,[Y|L]) :- X = Y; pertenece(X,L).

% Función fibonacci.
fibonacci(0,0).
fibonacci(1,1).
fibonacci(N,X) :- N > 1, N1 is N - 1, fibonacci(N1, X1), N2 is N - 2, fibonacci(N2,X2), X is X1+X2.

% Backtracking de 5.
% fibonacci(5,RES) = fibonacci(4)+fibonacci(3)=3+2=5
% fibonacci(4)=fibonacci(3)+fibonacci(2)=2+1=3
% fibonacci(3)=fibonacci(2)+fibonacci(1)=1+1=2
% fibonacci(2)=fibonacci(1)+fibonacci(0)=1+0=1
% fibonacci(1)=1
% fibonacci(0)=0