-- | Práctica 01. Lógica Computacional
-- | Integrantes:
-- | Zhang Liu Xin Wen
-- | Sánchez Correa Diego Sebastián
module Practica1 where

{- | esPalindromo
'esPalindromo' recibe una lista y dice si se trata de
un palíndromo.
-}
esPalindromo :: Eq a => [a] -> Bool
esPalindromo xs = xs == reverse xs

{- | divisores
'divisores' recibe un número y devuelve una lista
con los divisores de este.
-}
divisores :: Integral a => a -> [a]
divisores n = [ x | x <- [1..n], n `mod` x == 0]

{- | primos
'primos' recibe un número y devuelve una lista
con los números primos acotados superiormente  por este.
-}
primos :: Integral a => a -> [a]
primos a = [ x | x <- [1..a], length(divisores x) == 2]

{- | sumaPares
'sumaPares' recibe una lista de pares ordenados
y devuelve una tupla de la suma de ellas.
-}
sumaPares :: (Num a, Num b) => [(a,b)] -> (a,b)
-- sumaPares [] = (0,0)
-- sumaPares [(a,b)] = (a,b)
-- sumaPares (x:xs) =  sumaTupla x (sumaPares xs)
sumaPares [] = (0,0)
sumaPares [(a,b)] = (a,b)
sumaPares ((x,y):[(a,b)]) = (x+a,y+b)
sumaPares (x:xs) = sumaPares (x:[(sumaPares xs)])

-- `sumaTupla`. Función auxiliar que define la suma de dos tuplas.
sumaTupla :: (Num a, Num b) => (a, b) -> (a, b) -> (a, b)
sumaTupla (x,y) (a,b) = (x+a, y+b)

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
(Para operar con números negativos, pasar entre paréntesis).
-}
modulo :: Integral a => a -> a -> a
modulo a b = a - ((div a b) * b)

{- | Cadena Par
'cadenaPar' recibe una cadena y dice si su longitud es par.
-}
cadenaPar :: [Char] -> Bool
cadenaPar [] = True
cadenaPar [x] = False
cadenaPar (x:xs) = False == (cadenaPar(xs))

{- | Elimina Repetidos
'eliminaRepetidos' recibe una lista y devuelve una lista
sin repetidos.
-}
eliminaRepetidos :: Eq a => [a] -> [a]
eliminaRepetidos [] = []
eliminaRepetidos (x:xs) = [x] ++ [n | n <- eliminaRepetidos (xs), n /= x]

-- eliminaRepetidos [] = []
-- eliminaRepetidos (x:xs) = x : filtra (/= x) (eliminaRepetidos xs)

{- | filtra
'filtra' devuelve los elementos de una lista que
cumplen una propiedad dada.
-}
filtra :: (a->Bool) -> [a] -> [a]
filtra _ [] = []
filtra f (x:xs)
  | f x = x : filtra f xs
  | otherwise = filtra f xs

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
