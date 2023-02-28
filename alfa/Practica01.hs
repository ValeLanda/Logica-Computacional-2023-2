
-- Ejercicio 1 esPalindromo
reversa :: [Char] -> [Char]
reversa[] = []
reversa (x:xs) = reversa(xs) ++ [x]

esPalindromo :: [Char] -> Bool
esPalindromo[] = True
esPalindromo xs = xs == reversa xs

-- Ejercicio 2 divisores
divisores :: Int -> [Int]
divisores a = [b | b <- [1..a], a `mod` b == 0]

-- EJercicio 3 primos
esPrimo :: Integer -> Bool
esPrimo n = if (length [x | x <- [2..n-1],mod n x == 0]) >0 then False else True  
  
primos :: Integer -> [Integer]
primos n = [x | x <- [1..n], esPrimo x]

-- Ejercicio 4 sumaPares
sumaPares:: (Num a) => (a,a) -> (a,a)-> (a,a)
sumaPares (x1, y1) (x2,y2)= (x1+x2, y1+y2)

-- Ejercicios 5 productoCartesiano
productoCartesiano :: [[a]] -> [[a]]
productoCartesiano [] = [[]]
productoCartesiano (xs:xss) = [x:ys | x <- xs, ys <- productoCartesiano xss]

-- Ejercicio 6 aplica
aplica f [] = []
aplica f (x:xs) = (f x):(aplica f xs)

-- Ejercicio 7 modulo
modulo :: Integral a => a -> a -> a
modulo 0 m = 0
modulo n m = if n == m then 0
                else if m < n then (modulo (n-m) m) 
                    else n

-- EJercicio 8 cadenaPar
cadenaPar :: String -> Bool
cadenaPar "" = True
cadenaPar str = if (mod (length str) 2) == 0 then True else False

--Ejercicio 9 eliminaRepetidos
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
ackerman :: Int -> Int -> Int
ackerman 0 n = n+1
ackerman m 0 = ackerman (m-1) 1
ackerman m n = ackerman (m-1) (ackerman m (n-1))