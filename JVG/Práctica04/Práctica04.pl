%1.- Creación de una base de conocimiento e implementación de las relaciones
%	 con base en los enunciados.
direccion(adela, 1234).
direccion(adelfa, 1234).
direccion(lola, 4567).

deporte(basquetbol).
deporte(futbol_americano).

britanico(galés).
britanico(inglés).
britanico(escocés).
britanico(irlandés).

% a. Dos personas viven en la misma casa si tienen la misma dirección.
% Ejemplos de uso:
% 	viven_juntos(adela, adelfa) -> direccion(adela,1234), direccion(adelfa,1234),
% 	1234 == 1234.
%	devuelve true., porque se cumple que 1234 == 1234.
%
%	viven_juntos(lola, adela) -> direccion(lola,4567), direccion(adelfa,1234),
%	4567 == 1234.
%	devuelve false, porque no se cumple que 4567 == 1234.
viven_juntos(X, Y) :- direccion(X,D1), direccion(Y,D2), D1 == D2.

% b. Los que juegan basquetbol o fútbol americano son deportistas.
% Ejemplos de uso:
%	es_deportista(cualquier_persona, tenis) -> deporte(tenis).
%	deporte(tenis) devolverá falso, por lo que obtendremos falso en "es_deportista".
%
%	es_deportista(persona_random, basquetbol) -> deporte(basquetbol).
%	devolverá true, ya que el valor de verdad de deporte(basquetbol) es verdadero.
es_deportista(X,Y) :- deporte(Y).

% c. Eres británico si eres galés, inglés, escocés o irlandés.
% Estructura: eres_britanico('nacionalidad')
%	Ejemplos de uso:
%	eres_britanico(inglés) -> britanico(inglés).
%	britanico(inglés) devolverá true, por lo que "eres_britanico" será verdadero.
%
%	eres_britanico(estadounidense) -> britanico(estadounidense).
%	britanico(estadounidense) devolverá false, por lo que "eres_britanico" será
%	falso.
eres_britanico(X) :- britanico(X).

% d. Te pueden multar si no has pagado la tenencia de tu automóvil.
% Estructura: multa('nombre')
% Ejemplos de uso:
%	multa(sofía) -> false
%	Devuelve ese valor, ya que no está registrado como alguien que no ha pagado
%	la tenencia.
%
%	multa(nayeli) -> true
%	Devolvemos true, ya que está registrado como alguien que no ha pagado la
%	tenencia.
multa(juan).
multa(josé).
multa(nayeli).


%2.- Implementación de la función que devuelve el máximo de una lista de números.
maximo([X], X). %Caso base.
maximo([C|XS], X) :- maximo(XS, X1), X is max(C, X1). %Caso rec.

% Backtracking de la lista [1,2,3,2,1].
% maximo([1,2,3,2,1], X) -> maximo([2,3,2,1], X1), X = max(1, X1)
% -> maximo([3,2,1], X2), X1 = max(2, X2) -> maximo([2,1], X3), X2 = max(3, X3)
% -> maximo([1], X4), X3 = max(2, X4) -> maximo([], X5), X4 = max(1, X5)
% -> X5 = 1 -> X4 = max(1, 1) -> X3 = max(2, 1) -> X2 = max(3, 2) -> X1 = max(2, 3)
% -> X = max(1, 3) -> X = 3. Devuelve 3.


%3.- Implementación de la función que devuelve la cantidad de números distintos en una lista.
% Ejemplos de uso:
%	cantidad_distintos([1,1,1,1,1,1,1,1,1,1], X).
%	Devuelve X = 1, ya que hay 1 número distinto en la lista.
%
%	cantidad_distintos([1,2,3,4,5,6,7,8,9,10,1,2,3,4,5,6], X).
%	Devuelve X = 10, ya que hay 10 números distintos en la lista.
cantidad_distintos([], 0). %Caso base.
cantidad_distintos([C|XS], X) :- member(C, XS), cantidad_distintos(XS, X). %Caso rec.
cantidad_distintos([C|XS], X) :- not(member(C, XS)), cantidad_distintos(XS, X1), X is X1 + 1. %Caso rec.


%4.- Implementación de la función de Fibonacci.
factorial(0,1). %Base.
factorial(N, F) :- N>0, N1 is N - 1, factorial(N1, F1), F is N * F1. %Caso rec.

% Backtracking de factorial(5, X).
% factorial(5, F) -> factorial(4, F1), F = 5 * F1 -> factorial(3, F2), F1 = 4 * F2
% -> factorial(2, F3), F2 = 5 * F3 -> factorial(1, F4), F3 = 2 * F4
% -> factorial(0, 1) (entra al caso base)
% -> F4 = 1 -> F3 = 2 * 1 = 2 -> F2 = 4 * 2 = 8 -> F1 = 5 * 8 = 40 -> F = 120. Devuelve 120.