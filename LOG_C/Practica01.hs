
--PRACTICA 01 LOGICA COMPUTACIONAL.

--1.esPalindromo determina si una lista en haskell es palindromo

--Funcion auxuliar para determinar si una lista es un palindromo
reversaLista :: [a] -> [a]
reversaLista [] = []
reversaLista [x] = [x]
reversaLista (x:xs) = reversaLista xs ++ [x]

esPalindromo :: (Eq a) => [a] -> Bool
esPalindromo [] = True
esPalindromo [x] = True
esPalindromo (x:xs) = x:xs == reversaLista (x:xs)

--2.divisores usando listas por comprension determina los divisores de n numero entero

divisores :: Int -> [Int]
divisores n = [x | x <- [1..n],  n `mod` x == 0 ]

--3.primo utilizando listas por comprension la funcion determina la lista de primos entre 1 y un numero entero "m"

--Funcion auxiliar booleana para determinar si un numero tiene como divsores solo el 1 y n, asi tambien
--uso la funcion del segundo ejercicio.
esPrimo :: Int -> Bool
esPrimo n = divisores n == [1,n]

primos :: Int -> [Int]
primos m = [y | y <- [1..m], esPrimo y]

 

--6.aplica Una función aux a una lista, y devuelve una lista con el resultado de evaluar cada elemento.
aux :: Int -> Int
aux x = x*x*x

aplica :: [Int] -> [Int]
aplica [] = []
aplica (x:xs) = aux x : aplica xs

--7.modulo Funcion que de determina el residuo de dos numeros enteros
modulo :: Integer -> Integer -> Integer
modulo x y
    | (x == y) = 0
    | (y > x) = x
    | otherwise = modulo (x-y) y

--8.cadenaPar Funcion que recibe un dato de tipo String para determinar si tiene longitud par
--Funcion auxiliar para calucular la longitud de una cadena
longCadena :: String -> Int
longCadena [] = 0
longCadena (x:xs) = 1+longCadena(xs)

cadenaPar :: String -> Bool
cadenaPar xs = longCadena (xs) `mod` 2 == 0

--9.eliminaRepetidos de una lista de enteros 
eliminaRepetidos :: [Int] -> [Int]
eliminaRepetidos [] = []
eliminaRepetidos (x:xs) = x: (eliminaRepetidos (elimina x xs))
     where
         elimina :: Int -> [Int] -> [Int]
         elimina x [] = []
         elimina x (y:ys)
             | x==y = elimina x ys
             | otherwise = y:(elimina x ys)
 

--10.ackermann Funcion recursiva que toma dos números naturales y devuelve un número natural
ackermann :: Integer -> Integer -> Integer
ackermann m n
    | (m==0) = n+1
    | (m > 0) && (n==0) = ackermann (m-1) 1
    | otherwise = ackermann (m-1) (ackermann m (n-1))
