--Modulo: MisFunciones
module Practica01 where

    -- Función que dada una lista, regresa la reversa de dicha lista --
    reversa :: [a] -> [a]
    reversa xs = foldl (\x y -> [y] ++ x) [] xs

    -- Función que dada una frase te dice si es palindormo o no --
    esPalindromo :: Eq a => [a] -> Bool
    esPalindromo xs = (reversa xs) == xs

    -- Función que dado un entero, te regresa una lista con sus divisores --
    divisores :: Int -> [Int]
    divisores n 
        | n <= 0 = error "No se encuentra en el dominio"
        | otherwise = [i | i <- [1..n], (mod n i) == 0]     

    -- Función auxiliar para la función primos que te dice si es un primo o no --
    esPrimo :: Int -> Bool
    esPrimo k = if k > 1 then null [ x | x <- [2..k - 1], k `mod` x == 0] else False
    
    -- Función que dado un entero regresa una lista de primos hasta ese número
    primos :: Int -> [Int]
    primos n 
        | n <= 0 = error "No se encuentra en el dominio"
        | n == 1 = [] 
        | otherwise = if esPrimo n then n:(primos (n-1)) else (primos (n-1))

    --Función que dada una lista de pares ordendos, regresa un par or
    sumaPares :: [(Integer, Integer)] -> (Integer, Integer)
    sumaPares [] = (0,0)
    sumaPares ((a,b):xs) = 
        let (c,d) = sumaPares xs
        in
            (a+c, b+d)

    sumaPares' :: [(Integer, Integer)] -> (Integer, Integer)
    sumaPares' xs = foldl (sumaTuplas) (0,0) xs

    --Función auxiliar para la función sumaPares, toma dos pares ordenados
    --los suma entrada con entrada. 
    sumaTuplas :: (Integer, Integer) -> (Integer, Integer) -> (Integer, Integer)
    sumaTuplas (a,b) (c,d) = (a+c,b+d)

    --Dadas dos listas, regresa una lista de todos los posibles pares ordenados
    --que se pueden formar entre ambas listas.
    productoCartesiano :: [a] -> [b] -> [(a,b)]
    productoCartesiano xs ys = [ (x,y) | x <- xs, y <- ys]

    --Dada una función y una lista, regresa una lista con los resultados de aplicar
    --la función a cada uno de los elementos de la lista.
    aplica :: (a -> b) -> [a] -> [b]
    aplica f [] = [] 
    aplica f (x:xs) = (f x): (aplica f xs)

    modulo :: Int -> Int -> Int
    modulo a b =  a - b*(a `div` b)

    -- Dada una cadena revisa si es de longitud par y regresa un booleano.
    cadenaPar :: String -> Bool
    cadenaPar xs = if length xs `mod` 2 == 0 then True else False

    --Recibe una lista y devuelve la lista sin repetidos.
    eliminaRepetidos :: Eq a => [a] -> [a]
    eliminaRepetidos [] = []
    eliminaRepetidos (x:xs) = if contenido x xs then eliminaRepetidos xs else x: eliminaRepetidos xs

    --Función auxiliar para la función eliminaRepetidos, que verifica si un 
    --elemento se encuentre en la lista.
    contenido :: Eq a => a -> [a] -> Bool
    contenido a [] = False
    contenido a (x:xs) = if a == x then True else (contenido a xs)

    --Dado dos números regresa un único número generado con ciertas normas.
    ackermann :: (Integral n) => n -> n -> n
    ackermann 0 n = n + 1
    ackermann m 0 = ackermann (m-1) 1
    ackermann m n = ackermann (m-1) (ackermann m (n-1))