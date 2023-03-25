-- Módulo: Practica01
module Practica01 where

esPalindromo :: Eq x -> [x] -> Bool
esPalindromo xs = xs == reverse xs


divisores :: Int -> [Int]
divisores n = [x | x <- [1..n], n 'mod' x == 0]


primos :: Int -> [Int]
primos n = filter aux [2..n]


aux :: Int -> Bool
aux n = n > 1 && all (\x -> n 'mod' x /= 0) [2..n-1]


sumaPares :: [(Int,Int)] -> (Int,Int)
sumaPares [] = (0,0)
sumaPares ((x,y):xs) = (x + a, y +b)
    where (a,b) = sumaPares xs


productoCartesiano :: [a] -> [b] -> [(a,b)]
productoCartesiano xs ys = [(x,y) | x <- xs, y <- ys]


aplica :: (a -> b) -> [a] -> [b]
aplica f [] = []
aplica f (x:xs) = f x : aplica f xs


modulo :: Integral a => a -> a -> a
modulo a b = if a >= 0 then resto else b + resto
    where resto = if abs a < abs b then a else modulo (a - b) b



cadenaPar :: String -> Bool
cadenaPar str = even (length str)


eliminaRepetidos :: Eq a => [a] -> [a]
eliminaRepetidos [] = []
eliminaRepetidos (x:xs) = x : eliminaRepetidos (filter (/= x) xs)


