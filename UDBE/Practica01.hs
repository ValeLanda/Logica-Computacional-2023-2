--Practica 01

--Ejercicio 1 esPalindromo
--nos dice si una lista es palindromo
esPalindromo xs = xs == reverse xs

--Ejercicio 2 Divisores
--recibe como parámetro un natural n y 
--devuelve una lista con todos los divisores de n
divisores :: Int -> [Int]
divisores a = [b | b <- [1..a], a `mod` b == 0]

--Ejercicio 3 Primos
--recibe como parámetro un natural n 
--devuelve una lista con todos los 
--números primos entre 1 y n.
primos:: Integer -> [Integer]
primos n
    | n <= 0 = []
    | otherwise = [x | x <- [2..n], esPrimo x]

--Ejercicio 4 SumaPares
--ecibe como parámetro una lista de pares ordenados 
-- devuelve una par con el resultado de sumar todos
-- los pares ordenados de la lista
sumaPares:: (Num a) => (a,a) -> (a,a)-> (a,a)
sumaPares (x1, y1) (x2,y2)= (x1+x2, y1+y2)

--Ejercicio 5 ProductoCartesiano
--funcion que recibe dos listas, A y B, 
--devuelve una lista con el producto cartesiano, AxB.
productoC :: [[a]] -> [[a]]
productoC [] = [[]]
productoC (xs:xss) = [x:ys | x <- xs, ys <- productoC xss]

-- Ejercicio 6 Aplica
-- Esta implementación utiliza listas por comprensión. Recibe una lista y una función, esta última 
-- puede ser de haskell o una propia. 
aplica :: (a -> b) -> [a] -> [b]
aplica funcion xs = [funcion x | x <- xs]


--Ejercicio 7 Modulo
modulo :: Int -> Int -> Int
modulo x 0 = error "Argumenos invalidos"
modulo x y = x - (y * (div x y))

--ejercicio 8 CadenaPar
--nos dice si la longitud de una cadena es par
cadenaPar :: [Int] -> Bool
cadenaPar xs = (length xs) `mod` 2 == 0


--Ejercicio 9 Eliminar repetidos
-- Esta funcion nos ayuda a eliminar los elementos que se encunetren duplicados, en este caso en una lista de enteros.
elimdup :: [Int] -> [Int]
elimdup [] = []
elimdup (x:xs) = x: (elimdup (elim x xs))
 where
  elim :: Int -> [Int] -> [Int]
  elim x [] = []
  elim x (y:ys)
   | x==y = elim x ys
   |otherwise = y:(elim x ys)



--Funciones auxiliares
--Nos dice si un numero es primo o no
esPrimo :: Integer -> Bool
esPrimo n |(length [x | x <- [2..n-1],mod n x == 0]) >0 = False | otherwise = True 



