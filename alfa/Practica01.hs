
-- Ejercicio 1 esPalindromo
-- Función que recibe como parámetro una lista y devuelve un booleano.
reversa :: [Char] -> [Char]
reversa[] = []
reversa (x:xs) = reversa(xs) ++ [x]

esPalindromo :: [Char] -> Bool
esPalindromo[] = True
esPalindromo xs = xs == reversa xs

-- Ejercicio 2 divisores
-- Recibe un número natural n y devuelve todos los divisores de ese número.
divisores :: Int -> [Int]
divisores a = [b | b <- [1..a], a `mod` b == 0]

-- EJercicio 3 primos
-- Recibe un número y devuelve la losta de primos desde el 2 hasta el número.
esPrimo :: Integer -> Bool
esPrimo n = if (length [x | x <- [2..n-1],mod n x == 0]) >0 then False else True  
  
primos :: Integer -> [Integer]
primos n = [x | x <- [1..n], esPrimo x]

-- Ejercicio 4 sumaPares
-- Recibe una lista de pares ordenados y regresa una con el resultado de sumar todos los pares ordenados
sumaPares:: (Num a) => (a,a) -> (a,a)-> (a,a)
sumaPares (x1, y1) (x2,y2)= (x1+x2, y1+y2)

-- Ejercicios 5 productoCartesiano
-- Recibe dos listas y devuelve una losta luego de aplicar el producto cartesiano a las anteriores.
productoCartesiano :: [[a]] -> [[a]]
productoCartesiano [] = [[]]
productoCartesiano (xs:xss) = [x:ys | x <- xs, ys <- productoCartesiano xss]

-- Ejercicio 6 aplica
-- Recibe una lista y una función para aplicarlo a ella.
aplica f [] = []
aplica f (x:xs) = (f x):(aplica f xs)

-- Ejercicio 7 modulo
-- Dados dos números nos devuelve su modulo
modulo :: Integral a => a -> a -> a
modulo 0 m = 0
modulo n m = if n == m then 0
                else if m < n then (modulo (n-m) m) 
                    else n

-- EJercicio 8 cadenaPar
-- Recibe una cadena y devuelve True si la longitud de la cadena es par y False si no lo es.
cadenaPar :: String -> Bool
cadenaPar "" = True
cadenaPar str = if (mod (length str) 2) == 0 then True else False

--Ejercicio 9 eliminaRepetidos
-- Recibe una lista y devuelve la misma lista sin repetidos
eliminarRepetidos :: [Int] -> [Int]
eliminarRepetidos [] = []
eliminarRepetidos (x : xs) =
  if estaEn x xs
    then eliminarRepetidos xs
    else x : eliminarRepetidos xs

estaEn :: Eq a => a -> [a] -> Bool
estaEn x [] = False
estaEn x (y : ys) =
  if x == y
    then True
    else estaEn x ys

-- Ejercicio 10 ackermann
-- Dados un par de números aplica la definición de la función Ackerman
ackerman :: Int -> Int -> Int
ackerman 0 n = n+1
ackerman m 0 = ackerman (m-1) 1
ackerman m n = ackerman (m-1) (ackerman m (n-1))