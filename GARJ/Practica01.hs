--1. Determina si una cadena o lista, es un palindromo
palindromo :: (Eq a) =>  [a] -> Bool
palindromo (x:xs) = if reversa(x:xs) == (x:xs) then True else False

--2. Devuelve una lista con los divisores de n
divisores :: Integer -> [Integer]
divisores n = [x | x <- [1..n], mod n x == 0]

--3. dado un número p, devuelve una lista xs que contengan los números primos
--tal que para cada r en xs r sea primo y r <= p
primos :: Integer -> [Integer]
primos n = [x | x <- [1..n], validaPrimo x]

--4. Funcion que suma un numero n de pares ordenados y devuelve un par ordenado con la suma de ellos
sumaPares :: [(Int, Int)] -> (Int, Int)
sumaPares[] = (0,0)
sumaPares((a,b):xs) = let (c,d) = sumaPares xs in (a+c, b+d) 

--5. Dadas 2 listas devuelve el producto cartesiano entre ellas
productoCartesiano xs ys = [(x,y) | x <- xs, y <- ys]

{-
    6. Recibe una funcion y una lista.
    Devuelve otra lista con elementos que son resultado de al haber aplicado
    la funcion a cada elemento de la lista recibida.
-}
aplica :: (t -> a) -> [t] -> [a]
aplica f (x:xs) = [f x | x <- (x:xs)]

--7 funcion mod sin usar mod 
modulo :: Integer -> Integer -> Integer
modulo x y = if y > x then x else modulo (x-y) y

--8. Funcion que recibe una cadena y devuelve True si la longitud es par y False en caso contrario
cadenaPar :: [Char] -> Bool
cadenaPar xs = if longitud xs `mod` 2 == 0 then True else False

{-        
    9. Recibe una lista.
    Devuelve una lista sin elementos repetidos.
-}
eliminaRepetidos :: Eq a => [a] -> [a]
eliminaRepetidos [] = []
eliminaRepetidos [x] = [x]
eliminaRepetidos (x:y:xs) = if contarRepetidos (x:y:xs) > 0 then eliminaRepetidos (y:xs) else [x] ++ eliminaRepetidos (y:xs)

{- 10. Función de Ackermann, que esta definida recursivamente,
la cual recibe un par de números naturales y devuelve otro
número natural-}

ackermann :: (Integer, Integer) -> Integer
ackermann (0, n) = n + 1
ackermann (m, 0) = ackermann((m-1), 1)
ackermann (m, n) = ackermann((m-1), (ackermann(m, (n-1))))


--Funciones auxiliares

--Valida si un número es primo o no
validaPrimo:: Integer -> Bool
validaPrimo n = (divisores n) == [1,n]

--Función que hace la reversa de una lista
reversa :: [a] -> [a]
reversa [] = []
reversa (x:xs) = (reversa xs)++[x]

--Función auxiliar que devuelve la longitud de una cadena de caracteres
longitud :: (Num b) => [Char] -> b
longitud[] = 0
longitud(_:xs) = 1 + longitud xs

{-
    Recibe una lista.
    Devuelve la cantidad de repeticiones que tiene la cabeza de la lista recibida.
-}
contarRepetidos :: (Num p, Eq a) => [a] -> p
contarRepetidos [] = 0
contarRepetidos [x] = 0
contarRepetidos (x:y:xs) = if x == y then 1 + contarRepetidos (x:xs) else contarRepetidos (x:xs)

