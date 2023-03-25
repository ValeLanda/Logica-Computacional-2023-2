-- Modulo: Practica01
module Practica01 where

{-Funcion 1: recibe una lista y dice si es un palindromo o no-}
esPalindromo :: Eq a => [a] -> Bool
esPalindromo xs = xs == reverse xs

{- Funcion 2: recibe un numero n y devuelve una lista con sus divisores -}
divisores :: Integer -> [Integer]
divisores n = [x | x <- [1.. (n `div` 2)], n `mod` x == 0] ++ [n]

{- Funcion 3: dado un numero n, da una lista con todos los numeros primos de 1 a n -}
primos :: Integer -> [Integer]
primos n = [x | x <- [2..n], length (divisores x) == 2]

{-Funcion 4: Suma una lista de pares ordenados, devuelve una tupla resultante de la suma de los primeros elementos y los segundos elementos-}
sumaPares :: (Num a, Num b) => [(a, b)] -> (a, b)
sumaPares xs = (sum(map fst xs) , sum (map snd xs))

--Funcion 5: Recibe 2 listas y devuelve su producto cartesiano NxN
productoCartesiano :: [a] -> [b] -> [(a,b)]
productoCartesiano xs [] = []
productoCartesiano [] ys = []
productoCartesiano xs ys = [(x,y) | x <- xs, y <- ys]

--Funcion 6: Recibe una funcion y una lista, devuelve los elementos evaluados
aplica :: (a -> b) -> [a] -> [b]
aplica f [] = []
aplica f (x:xs) = [ f x | x <- xs ]

--Funcion 7: Devuelve el sobrante de una operacion entre dos numeros
modulo :: Int -> Int -> Int
modulo 0 x = x
modulo x y|  x >= y =  (modulo (x-y) y)
          | otherwise = x

--Funcion 8: Evalua la longitud de la cadena, devuelve un boolean dependiendo si es par o no
cadenaPar :: String -> Bool
cadenaPar a = (length a) `mod` 2 == 0 -- Si es par devuelve True

--Funcion 9: Recibe una lista y la devuelve sin elementos que se repiten
eliminaRepetidos :: Int -> [a] -> [a]
eliminaRepetidos _ []     = []
eliminaRepetidos n (x:y)
    | n == 0    = y
    | otherwise = x : eliminaRepetidos (n-1) y

--Funcion 10: Realiza la funcion de ackerman
ackermann :: Int -> Int -> Int
ackermann 0 n = n+1
ackermann m 0 = ackermann (m-1) 1
ackermann m n = ackermann (m-1) (ackermann m (n-1))        
