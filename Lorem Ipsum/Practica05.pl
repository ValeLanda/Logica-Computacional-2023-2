divide(1,n).
divide(_,0).
divide(2,6).
divide(3,6).
divide(2,12).
divide(3,12).

divide(A,N) :- Q is N/A, integer(Q). % por definición de divisibilidad.


divide(6,N) :- divide(3,N), divide(2,N).

 % ¿Existe algun multiplo de 2?
 % Sí, cada resultado positivo de divide nos presenta a un multiplo de dos
 % ¿Cuáles son los divisores de 6?
 % 3,6,1 (Si consultamos esto todos estos nos dan true)
 % ¿Conocemos algún multiplo de 6?
 % Sí, cualquier número divisible por 6 lo es, en particular 12.

%casos base
binario(0,[0]).
binario(1,[1]).

%algoritmo binario adaptado a prolog, presentamos el resultado en orden inverso
binario(Dec, Bin) :- P is div(Dec,2), Q is mod(Dec,2), binario(P, Resto), append(Resto,[Q],Bin).

%predicado que regresa la parte creciente de una lista

%casos base
creciente([C],[C]).
creciente([],[]).
creciente([A,B|_], [A]) :- A >= B.

%caso recursivos
creciente([A,B|Bs],[A|Resto]) :- A < B, creciente([B|Bs], Resto).

%predicado que regresa la parte decreciente de una lista, análogo al anterior
decreciente([C],[C]).
decreciente([],[]).
decreciente([A,B|_], [A]) :- A =< B.

decreciente([A,B|Bs], [A|Resto]) :- A > B, decreciente([B|Bs], Resto).

diferencia([_],[_],[]).
diferencia([A|X], [A], X).
diferencia([A|X], [A|Y], C) :- diferencia(X,Y,C).

convexo([]).
convexo([L|Ls]) :- 
    creciente([L|Ls], L1), 
    diferencia([L|Ls], L1, Dif), 
    decreciente(Dif, L2), 
    append(L1,L2, [L|Ls]).
