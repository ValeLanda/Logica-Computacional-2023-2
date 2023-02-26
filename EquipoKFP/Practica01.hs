-- Practica 01

-- Equipo KFP
-- Jose Camilo Garcia Ponce 319210536

{-|
  La funcion esPalindromo nos dice si una lista es palindromo o no.
  Toma un argumento de tipo 'Eq a => [a]', la lista a evaluar.
  Retorna un valor de tipo 'Bool', si es palindromo o no.
  La funcion tiene dos casos base, la lista vacia y la lista con un elemento, en ambos casos retorna True.
  En el caso recursivo, se evalua si el primer elemento es igual al ultimo, y si la lista sin el primer y ultimo elemento es palindromo.
-}
esPalindromo :: Eq a => [a] -> Bool
esPalindromo [] = True
esPalindromo [x] = True
esPalindromo (x:xs) = (x == last xs) && (esPalindromo (init xs))

{-|
  La funcion divisores nos da un lista con los divisores de un numero.
  Toma un argumento de tipo 'Integral a => a', el numero del que obtener los divisores.
  Retorna un valor de tipo '[a]', la lista de los divisores.
  La funcion hace una lista de los numeros entre 1 y n, y evalua si el modulo de n entre x es igual a cero.
-}
divisores :: Integral a => a -> [a]
divisores n = if n > 0 then [x | x <- [1..n], n `mod` x == 0] else error "No se puede calcular"

{-|
  La funcion primos nos da una lista con los numeros primos entre 1 y n.
  Toma un argumento de tipo 'Integral a => a', el numero hasta el que obtener los primos.
  Retorna un valor de tipo '[a]', la lista de los primos.
  La funcion hace una lista de los numeros entre 1 y n, y evalua si el numero es primo, con una funcion auxiliar.
-}
primos :: Integral a => a -> [a]
primos n = if n > 0 then [x | x <- [1..n], esPrimo x] else error "No se puede calcular."

{-|
  La funcion auxiliar esPrimo nos dice si un numero es primo o no.
  Toma un argumento de tipo 'Integral a => a', el numero a evaluar.
  Retorna un valor de tipo 'Bool', si es primo o no.
  La funcion evalua si el numero es mayor a 1, y si la longitud de la lista de los divisores es igual a 2.
-}
esPrimo :: Integral a => a -> Bool
esPrimo n = if n > 1 then length (divisores n) == 2 else False

{-|
  La funcion sumaPares nos suma los elementos de una lista de pares.
  Toma un argumento de tipo 'Num a => [(a,a)]', la lista de pares a sumar.
  Retorna un valor de tipo '[a]', la lista con los resultados de las sumas.
  La funcion tiene un caso base, la lista vacia, que retorna un par de ceros.
  En el caso recursivo, se suma el primer elemento del par con el primer elemento de la suma de los pares restantes, y lo mismo con el segundo elemento.
-}
sumaPares :: Num a => [(a,a)] -> (a,a)
sumaPares [] = (0,0)
sumaPares (x:xs) = (fst x + fst (sumaPares xs), snd x + snd (sumaPares xs))

{-|
  La funcion productoCartesiano nos da el producto cartesiano de dos listas.
  Toma dos argumentos de tipo '[a]' y '[b]', las listas.
  Retorna un valor de tipo '[(a,b)]', el producto cartesiano de las listas.
  La funcion tiene tres casos, en los dos primeros son de una lista vacia y una cualquiera, y retorna una lista vacia.
  En el tercer caso, se hace una lista con los pares de los elementos de las listas.
-}
productoCartesiano :: [a] -> [b] -> [(a,b)]
productoCartesiano [] ys = []
productoCartesiano xs [] = []
productoCartesiano xs ys = [(x,y) | x <- xs, y <- ys]

{-|
  La funcion aplica nos aplica una funcion a cada elemento de una lista.
  Toma un argumento de tipo 'a -> b' y '[a]', la funcion y la lista.
  Retorna un valor de tipo '[b]', la lista con los resultados de aplicar la funcion.
  La funcion tiene un caso base, una funcion y la lista vacia, que retorna una lista vacia.
-}
aplica :: (a -> b) -> [a] -> [b]
aplica f [] = []
aplica f (x:xs) = (f x) : (aplica f xs)

{-|
  La funcion modulo nos da el residuo de la division de dos numeros.
  Toma un argumento de tipo 'Integral a => a' y 'a', los numeros a dividir.
  Retorna un valor de tipo 'a', el residuo de la division.
  La funcion evalua si el segundo numero es cero, y si no lo es, retorna el residuo de la division.
-}
modulo :: Integral a => a -> a -> a
modulo a 0 = error "No se puede dividir entre cero"
modulo a b = a - c where c = b * (a `div` b)

{-|
  La funcion cadenaPar nos dice si una cadena es par o no.
  Toma un argumento de tipo 'String', la cadena a evaluar.
  Retorna un valor de tipo 'Bool', si es par o no.
  La funcion tiene dos casos, el primero es con la cadena vacia, que retorna True.
  En el segundo caso, se evalua si la longitud de la cadena es par, y si lo es, retorna True.
-}
cadenaPar :: String -> Bool
cadenaPar "" = True
cadenaPar cadena = if (length cadena) `mod` 2 == 0 then True else False

{-|
  La funcion eliminaRepetidos nos una lista sin elementos repetidos.
  Toma un argumento de tipo 'Eq a => [a]', la lista de la que eliminar los repetidos.
  Retorna un valor de tipo '[a]', la lista sin elementos repetidos.
  La funcion tiene un caso base, la lista vacia, que retorna una lista vacia.
  En el caso recursivo, se evalua si el primer elemento esta otra vez en la lista,
  si esta entonces hacemos recursion con el resto de la lista, si no, 
  concatenamos el primer elemento con la recursion del resto de la lista.
-}
eliminaRepetidos :: Eq a => [a] -> [a]
eliminaRepetidos [] = []
eliminaRepetidos (x:xs) = if elem x xs then eliminaRepetidos xs else x : eliminaRepetidos xs

{-|
  La funcion ackermann nos da el resultado de la funcion de ackermann.
  Toma un argumento de tipo 'Integral a => a' y 'a', los numeros a evaluar.
  Retorna un valor de tipo 'a', el resultado de la funcion.
  La funcion creo que hace lo que dice la funcion de ackermann.
-}
ackermann :: Integral a => a -> a -> a
ackermann 0 y = if y < 0 then error "No se puede calcular ackermann" else y + 1
ackermann x 0 = if x < 0 then error "No se puede calcular ackermann" else ackermann (x - 1) 1
ackermann x y = if x < 0 || y < 0 then error "No se puede calcular ackermann" else ackermann (x - 1) (ackermann x (y - 1))