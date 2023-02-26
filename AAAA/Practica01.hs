-- 3. primos, recibe como parámetro un natural n y devuelve una lista con todos
-- los números primos entre 1 y n.

-- Función auxiliar que determina si un número natural es primo.
esPrimo :: Integer -> Bool
esPrimo p
  | p < 0 = error "El número no es natural."
  | otherwise = let divisores = [divisor | divisor <- [2..p], mod p divisor == 0]
                in length divisores == 1

primos :: Integer -> [Integer]
primos n
  | n <= 0 = error "El número no es natural."
  | otherwise = [x | x <- [2..n], esPrimo x]

-- 4. sumaPares, recibe como parámetro una lista de pares ordenados y devuelve
-- una par con el resultado de sumar todos los pares ordenados de la lista.
sumaPares :: (Num a, Num b) => [(a,b)] -> (a,b)
sumaPares xs = let primeros = map fst xs
                   segundos = map snd xs
                in (sum primeros, sum segundos)

-- 5. productoCartesiano, recibe como parámetros dos listas, A y B, y devuelve
-- una lista con el producto cartesiano, AxB.                   
productoCartesiano :: [a] -> [b] -> [(a, b)]
productoCartesiano xs ys = [(x,y) | x <- xs, y <- ys]

-- 9. eliminaRepetidos, recibe como parámetro una lista y devuelve la
-- lista sin repetidos.
eliminaRepetidos :: Eq a => [a] -> [a]
eliminaRepetidos [] = []
eliminaRepetidos (x:xs)
  | elem x xs = eliminaRepetidos xs
  | otherwise = x:eliminaRepetidos xs

-- 10. ackermann
ackermann :: Int -> Integer -> Integer
ackermann 0 n = n + 1
ackermann m 0 = ackermann (m - 1) (1)
ackermann m n = ackermann (m - 1) (ackermann (m) (n - 1))
