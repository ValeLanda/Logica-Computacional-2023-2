{-

                EJERCICIO 1
                 Palindromo
-palindromo, verifica si una lista es un palindromo
-}

palindromo ::(Eq a) => [a] -> Bool
palindromo [] = False
palindromo [x] = True
palindromo(x:xs)
          | (x:xs) == reversa (x:xs) = True
          | otherwise = False

{-Funcion auxiliar reversa que ordena del ultimo al primer elemento de una lista-}
reversa :: [a] -> [a]  
reversa [] = []  
reversa (x:xs) = reversa xs ++ [x]

{-
  
                EJERCICIO 2
                 divisores
-divisores, devuelve una lista con todos los divisores positivos de un núumero entero positivo.
-}

divisores :: Integer -> [Integer]
divisores x = [d | d <- [1..x], x `rem` d == 0]


{-
  
                EJERCICIO 3
                  primos
-primos, recibe como parámetro un natural n y devuelve una lista con todos los números primos entre 1 y n.
-}

primos :: Integer -> [Integer]
primos n = filter esPrimo [1..n]

{-Funcion auxiliar esPrimo que nos permite saber si un numero es primo-}
esPrimo :: Integer -> Bool
esPrimo n = n > 1 && all (\x -> n `mod` x /= 0) [2..floor (sqrt (fromIntegral n))]

{-
  
                EJERCICIO 4
                 sumaPares
-sumaPares, recibe como parámetro una lista de pares ordenados y devuelve una par con el resultado
 de sumar todos los pares ordenados de la lista.
-}

sumaPares :: Num a => [(a,a)] -> (a,a)
sumaPares [] = (0,0)
sumaPares ((x1,y1):xs) = (x1 + xx , y1 + yy) where (xx,yy) = sumaPares xs

{-
  
                EJERCICIO 5
             productoCartesiano
-productoCartesiano, recibe como parámetros dos listas, A y B, y devuelve una lista con el producto
 cartesiano, AxB.
-}

productoCartesiano :: [a] -> [a] -> [(a,a)]
productoCartesiano [] [] = []
productoCartesiano (x:xs) (y:ys) = [(x,y) | x <- x:xs, y <- y:ys]

{-
  
                EJERCICIO 6
                   aplica
-aplica, recibe como parámetros una función y una lista, y devuelve una lista con el
resultado de evaluar cada elemento.
-}

aplica :: (a -> b) -> [a] -> [b]
aplica _ [] = []
aplica f (x:xs) = f x : aplica f xs

{-
  
                EJERCICIO 7
                   modulo
-modulo, sin usar la función módulo predefinida en Haskell. Recibe como parametros dos 
numeros x y tal que regresa el residuo de dividir x/y
-}

modulo :: Integer -> Integer -> Integer
modulo x y = if x-y < 0  then x 
				else if x-y < y then x-y 
				else modulo (x-y) y


{-
  
                EJERCICIO 8
                 cadenaPar
-cadenaPar, recibe como parámetro una cadena y devuelve True si la longitud de la cadena
es par y False en el caso contrario.
-}

cadenaPar :: String -> Bool
cadenaPar (x:xs) = if mod (longitud (x:xs)) 2 == 0 then True else False


{-Función auxiliar longitud, recibe una lista y devuelve la longitud de la lista-}
longitud :: [a] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud (xs)

{-
  
                EJERCICIO 9
              eliminaRepetidos
-Función eliminaRepetidos, recibe como parámetro una lista y devuelve la lista sin repetidos.
-}

eliminaRepetidos :: (Eq a) => [a] -> [a]
eliminaRepetidos [] = []
eliminaRepetidos (x:xs) = if (contiene x (xs)) then eliminaRepetidos (xs) else [x] ++ eliminaRepetidos (xs)


 
{-Función auxiliar "contiene", recibe un elemento y una lista, busca si el elemento dado esta 
contenido en la lista, si es así regresa True , en caso contrario regresa False-}
contiene :: (Eq a) => a -> [a] -> Bool
contiene a [] = False
contiene a (x:xs) = if a == x then True else contiene a (xs)


{-
  
                EJERCICIO 10
                  ackermann
-ackermann Esta función toma dos números naturales como argumentos y devuelve un único número natural. 
Como norma general se define como sigue:
-}

ackermann :: Integer -> Integer -> Integer
ackermann 0 n = n+1
ackermann m 0 = ackermann (m-1) 1
ackermann m n = ackermann (m-1) (ackermann m (n-1))
