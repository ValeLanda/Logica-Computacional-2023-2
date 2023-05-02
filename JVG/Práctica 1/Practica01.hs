{- Función que recibe como parámetro una lista y devuelve un booleano, True en caso de que la
   lista sea un palíndromo y False en el caso contrario. -}
-- Ejemplo: palindromo [1,2,3,2,1] = True
esPalindromo :: Eq a => [a] -> Bool
esPalindromo lista = lista == reverse lista


{- Función que  recibe como parámetro un natural n y devuelve una lista con todos los divisores
   de n. -}
-- Ejemplo: divisores 10 = [1,2,5,10]
divisores :: Integer -> [Integer]
divisores n = [x | x <- [1..n], n `mod` x == 0]


{- Función que recibe como parámetro un natural n y devuelve una lista con todos los números
   primos entre 1 y n. -}
-- Ejemplo: primos 10 = [2,3,5,7]
primos :: Integer -> [Integer]
primos n = [x | x <- [2..n], esPrimo x]

{- Función auxiliar que recibe como parámetro un natural n y devuelve True si n es primo y
   False en caso contrario. -}
-- Ejemplo: esPrimo 7 = True
esPrimo :: Integer -> Bool
esPrimo n = [x | x <- [2..n], módulo n x == 0] == [n]


{- Función que recibe como parámetro una lista de pares ordenados y devuelve una par con el
   resultado de sumar todos los pares ordenados de la lista. -}
-- Ejemplo: sumaPares [(1,2),(3,4),(5,6)] = (9,12)
sumaPares :: Num a => [(a, a)] -> (a, a)
sumaPares = foldr (\(x,y) (a,b) -> (x+a, y+b)) (0,0)


{- Función que recibe como parámetros dos listas, A y B, y devuelve una lista con el producto
   cartesiano, AxB. -}
-- Ejemplo: productoCartesiano [1,2,3] [4,5,6] = [(1,4),(1,5),(1,6),(2,4),(2,5),(2,6),(3,4),(3,5),(3,6)]
productoCartesiano :: [a] -> [b] -> [(a, b)]
productoCartesiano listaA listaB = [(x,y) | x <- listaA, y <- listaB]


{- Función que recibe como parámetros una función y una lista, y devuelve una lista con el
   resultado de evaluar cada elemento. -}
-- Ejemplo: aplicaFuncion (\x -> x + 1) [1,2,3] = [2,3,4]
aplica :: (a -> b) -> [a] -> [b]
aplica f lista = [f x | x <- lista]


{- Función que devuelve el residuo de la división de un número dado por otro número (operación
módulo). -}
-- Ejemplo: 7 `mod` 2 = 1
módulo :: Integer -> Integer -> Integer
módulo x y = x - (x `div` y) * y


{- Función que recibe como parámetro una cadena y devuelve True si la longitud de la cadena es
   par y False en el caso contrario. -}
-- Ejemplo: cadenaPar "hola" = False
cadenaPar :: String -> Bool
cadenaPar cadena = length cadena `mod` 2 == 0


-- Función que recibe como parámetro una lista y devuelve la lista sin repetidos.
-- Ejemplo: eliminaRepetidos [1,2,3,4,5,1,2,3,4,5] = [1,2,3,4,5]
eliminaRepetidos :: Eq a => [a] -> [a]
eliminaRepetidos [] = []
eliminaRepetidos (x:xs) = x : eliminaRepetidos (filter (/= x) xs)


{- 
   Función Ackerman que recibe dos números naturales m y n, y devuelve un natural resultante de la definición de la función.
   Definición:
                        n + 1                                   ai m = 0
    Ackerman(m, n)  =   Ackerman(m - 1, 1)                      si m > 0 y n = 0
                        Ackerman(m - 1, Ackerman(m, n - 1))     si m > 0 y n > 0
    
    Ejemplos:
    Ackerman(0, 8) = 9
    Ackerman(4, 0) = 13
    Ackerman(3, 4) = 125
    Ackerman(3, 3) = 61
 -}
ackerman :: Integer -> Integer -> Integer
ackerman m n
    | m == 0 = n + 1
    | m > 0 && n == 0 = ackerman (m - 1) 1
    | m > 0 && n > 0 = ackerman (m - 1) (ackerman m (n - 1))