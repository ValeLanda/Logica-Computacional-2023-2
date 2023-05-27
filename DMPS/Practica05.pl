%%	Ejercicio 1	%%

% el cálculo de Y se realiza sumando X con la suma acumulada Sum. %
% Luego, se actualiza NewSum sumando X a Sum para utilizarlo en la recursión. %
% La suma acumulada Sum se pasa como segundo argumento en la llamada recursiva para realizar %
% el seguimiento adecuado de la acumulación.%

combina(L1, L2) :-
    combina(L1, 0, L2).

combina([], _, []).
combina([X|Xs], Sum, [Y|Ys]) :-
    Y is X + Sum,
    NewSum is Sum + X,
    combina(Xs, NewSum, Ys).

%%	Ejercicio 2	%%

% Caso Base
convexo([]).
convexo([_]).
convexo(L) :- creciente(L).

% Dividimos en dos casos, creciente y cuando se convierte en  decreciente.

creciente([X, Y|Resto]) :- X < Y -> creciente([Y|Resto]); decreciente([X, Y|Resto]).

decreciente([X, Y|Resto]) :- X > Y -> decreciente([Y|Resto]).

%%	Ejercicio 3	%%

%% Los dos primeros casos base definen los valores binarios de los números 0 y 1
decimal_binario(0, [0]).
decimal_binario(1, [1]).

%% en el caso general, dividimos D entre 2 para obtener Coc y Res

decimal_binario(D, B):- D>1, 
Coc is D div 2,
decimal_binario(Coc, Bcoc),
Res is D mod 2,
append(Bcoc, [Res], B).
    

%%	Ejercicio 4	%%
divide(2,6).
divide(2,12).
divide(3,6).
divide(3,12).

%%¿Existe algun multiplo de 2? Si. para ver esto basta recordar que se puede definir el concepto de multiplo a partir de ser divisible
%%Por ello si un numero es multiplo de 2 basta checar "divide(2,X)" donde X seran los multiplos de 2

%%Predicado que da los divisores de 6
divide(6,X):- divide(2,X), divide(3,X).

%%¿Conocemos algun multiplo de 6? En este universo y tomando en cuenta que definimos un predicado para los divisores de 6
%%Tendremos que seran al igual que 2 aquellos que tienen la forma "divide(6,X)" donde el conjunto X contendra los multiplos de 6


