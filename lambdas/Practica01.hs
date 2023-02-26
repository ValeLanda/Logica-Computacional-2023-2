-- | Práctica 01. Lógica Computacional
module Practica1 where

{- | esPalindromo
'esPalindromo' recibe una lista y dice si se trata de
un palíndromo.
-}
esPalindromo :: Eq a => [a] -> Bool
esPalindromo [] = True

{- | divisores
'divisores' recibe un número y devuelve una lista
con los divisores de este.
-}
divisores :: Num a => [a] -> [a]
divisores [] = [1]

{- | primos
'primos' recibe un número y devuelve una lista
con los números primos acotados superiormente  por este.
-}
primos :: Num a => [a] -> [a]
primos [] = [1]

{- | sumaPares
'sumaPares' recibe una lista de pares ordenados
y devuelve una tupla de la suma de ellas.
-}
sumaPares :: (Num a, Num b) => [(a,b)] -> (a,a)
sumaPares [(a,b)] = (a,a)

{- | Producto Cartesiano
'productoCartesiano' regresa el producto cartesiano de dos listas.
-}
productoCartesiano :: [a] -> [b] -> [(a, b)]
productoCartesiano xs ys  = [(x,y) | x <- xs, y <- ys]

{- | Aplica
'aplica' recibe una función y una lista, devuelve una lista
con el resultado de evaluar cada elemento de la lista con
la función.
-}
aplica :: (a->b) -> [a] -> [b]
aplica _ [] = []
aplica f (x:xs) = f x : aplica f xs

{- | Modulo
'modulo' recibe dos números a y b y devuelve a `mod` b.
-}
modulo :: Integral a => a -> a -> a
modulo a b = a

{- | Cadena Par
'cadenaPar' recibe una cádena y dice si su longitud es par.
-}
cadenaPar :: [Char] -> Bool
cadenaPar [] = True

{- | Elimina Repetidos
'eliminaRepetidos' recibe una lista y devuelve una lista
sin repetidos.
-}
eliminaRepetidos :: Eq a => [a] -> [a]
eliminaRepetidos [] = []

{- | Ackermann.
     'ackermann' define la función de Ackermann.
     A(0, n) = n+1
     A(m+1, 0) = A(m, 1)
     A(m+1, n+1) = A(m, A(m+1, n))
-}
ackermann :: Int -> Integer -> Integer
ackermann 0 0 = 1
ackermann 0 n = n+1 
ackermann m 0 = ackermann (m-1) 1
ackermann m n = ackermann (m-1) (ackermann m (n-1))
