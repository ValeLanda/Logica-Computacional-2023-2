module Practica01 where

    import GHC.Natural


    --Esta función recibe un entero y regresa la lista con todos los divisores del número
    divisores :: Integer -> [Integer]
    -- Se checarán todos los número entre 1 y n y si el módulo de n por x es 0, entonces este será un divisor
    -- nótese que el 1 y n siempre serán divisores (esto nos servira para la función primos)
    divisores n = [x | x <- [1..n], n `mod` x == 0]

    -- Esta función recibe un entero y regresa todos los primos desde 0 hasta ese número
    --primos :: Integer -> [Integer]
    -- Se checarán todos los números entre 1 y n y en los casos en los que la lista sea sólo el 1 y n mismo 
    -- tendremos que ese número es primo
    --primos n = [n]
    
    -- producto cartesiano de 2 listas
    -- Utiliza una lista por comprensión.
    productoCartesiano :: [a] -> [b] -> [(a, b)]
    -- Para cada elemento x en xs y cada elemento y en ys, se crea un par ordenado (x,y) y se agrega a la lista resultante.
    productoCartesiano xs ys = [(x, y) | x <- xs, y <- ys]


    -- Esta función recibira una función y una lista y regresará una lista donde la función ha sido aplicada a
    -- todos los elementos de la lista
    aplica func [] = []
    aplica func (x:xs) = func x : aplica func xs
    
    --Esta función recibe dos enteros y regresa un entero
    modulo :: Int -> Int -> Int
    --Multiplicamos el cociente por el segundo valor y le restamos eso al primero, para así obtener el residuo de la división.
    modulo n m = n - m * div n m

    --Esta función recibe una cadena y regresa un booleano
    cadenaPar :: String -> Bool
    --Sacamos el módulo 2 de la longitud de la cadena para ver si es par, si lo es regresa True, si no regresa False
    cadenaPar s = length s `mod` 2 == 0
    
    -- funcion elimina repetidos soporte cualquier tipo de dato  ya que usamos Eq para hacer equivalencia especial de haskell
    eliminaRepetidos :: Eq a => [a] -> [a]
    eliminaRepetidos [] = []
    -- Usamos filter para eliminar todos los elementos que son iguales a x de la lista restante, y llamamos recursivamente a eliminaRepetidos sobre esa lista para --continuar eliminando elementos repetidos
    eliminaRepetidos (x : xs) = x : eliminaRepetidos (filter (/= x) xs)

    --Esta función recibe dos naturales y regresa un natural
    ackermann :: Natural -> Natural -> Natural
    --Solo seguimos tal cual la definición de la función
    ackermann 0 n = n + 1
    ackermann m 0 = ackermann (m-1) 1
    ackermann m n = ackermann (m - 1) (ackermann m (n - 1))
