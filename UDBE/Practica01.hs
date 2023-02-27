--Practica 01

--Ejercicio 1 esPalindromo
--nos dice si una lista es palindromo
esPalindromo xs = xs == reverse xs

--Ejercicio 2 Divisores
divisores :: Int -> [Int]
divisores a = [b | b <- [1..a], a `mod` b == 0]

--Ejercicio 3 Primos
primos:: Integer -> [Integer]
primos n
    | n <= 0 = []
    | otherwise = [x| x <- [2..n], esPrimo x]

--Ejercicio 4 SumaPares
sumaPares:: (Num a) => (a,a) -> (a,a)-> (a,a)
sumaPares (x1, y1) (x2,y2)= (x1+x2, y1+y2)

--Ejercicio 5 ProductoCartesiano
productoC :: [[a]] -> [[a]]
productoC [] = [[]]
productoC (xs:xss) = [x:ys | x <- xs, ys <- productoC xss]

--Ejercicio 7 Modulo
modulo :: Int -> Int -> Int
modulo x 0 = error "Argumenos invalidos"
modulo x y = x - (y * (div x y))

--ejercicio 8 CadenaPar
--nos dice si la longitud de una cadena es par
cadenaPar :: [Int] -> Bool
cadenaPar xs = (length xs) `mod` 2 == 0






--Funciones auxiliares
--Nos dice si un numero es primo o no
esPrimo :: Integer -> Bool
esPrimo n |(length [x | x <- [2..n-1],mod n x == 0]) >0 = False | otherwise = True 



