{-PRACTICA 01
Integrantes:
1. Mora Hernandez Dulce Julieta (319236448)
2. Noriega Rodriguez Marcos Julian (319284061)
3. Palomo Valle Samantha Charlize (319273841)
4. Resendiz Mendoza Brenda Paola (319041356)
-}


--Ejercicio 1
--esPalindromo: recibe como parámetro una lista y devuelve un booleano, True en caso de que la lista sea un palíndromo y False en el caso contrario.
esPalindromo :: Eq a => [a] -> Bool
esPalindromo (x:xs) = reversa (x:xs) == (x:xs)

--función auxiliar reversa que permite darle la vuelta a una lista
reversa :: [a] -> [a]
reversa [] = []
reversa (x:xs) = reversa xs ++ [x]


--Ejercicio 2
--divisores: recibe como parámetro un natural n y devuelve una lista con todos los divisores de n.
divisores :: Int -> [Int]  --(Da todos los divisores de un numero dado)
divisores x = [y | y <-[1..x],divisor x y]

--funcion auxiliar que comprueba si un numero es divisor de otro
divisor :: Int -> Int -> Bool 
divisor x y = (mod x y) == 0


--Ejercicio 3
--primos: recibe como parámetro un natural n y devuelve una lista con todos los números primos entre 1 y n.

{-funcion auxiliar que filtra la lista eliminando los numeros que son multiplos de n-}
elimina :: Integer -> [Integer] -> [Integer]
elimina n xs = [ x | x <- xs, x `mod` n /= 0 ]

{-funcion auxiliar que criba la lista con el anterior metodo-}
criba :: [Integer] -> [Integer]
criba []     = []
criba (n:ns) = n : criba (elimina n ns)

{-funcion auxiliar que muestra una lista con los numeros primos-}
primos :: [Integer]
primos = criba [2..]

--{funcion que verifica si n es primo}
esPrimo :: Integer -> Bool
esPrimo n = head (dropWhile (<n) primos) == n


--Ejercicio 4
--sumaPares: recibe como parámetro una lista de pares ordenados y devuelve un par con el resultado de sumar todos los pares ordenados de la lista.
sumaPares :: [(Int , Int)] -> (Int , Int)
sumaPares (x:xs) = (sumaPrimeraEntrada (x:xs), sumaSegundaEntrada (x:xs))

{-función auxiliar que suma las primeras entradas de un par ordenado. Recibe una lista de pares ordenados y devuelve un int que indica
la suma de las primeras entradas-}
sumaPrimeraEntrada :: [(Int,Int)] -> Int
sumaPrimeraEntrada [] = 0
sumaPrimeraEntrada (x:xs) = (fst x) + sumaPrimeraEntrada xs

{-función auxiliar que suma las segundas entradas de un par ordenado. Recibe una lista de pares ordenados y devuelve un int que indica
la suma de las segundas entradas-}
sumaSegundaEntrada :: [(Int , Int)] -> Int
sumaSegundaEntrada [] = 0
sumaSegundaEntrada (x:xs) = (snd x) + sumaSegundaEntrada xs 


--Ejercicio 5
--productoCartesiano: recibe como parámetros dos listas, A y B, y devuelve una lista con el producto cartesiano, AxB.
cartProd :: [a] -> [b] -> [(a,b)] 
cartProd xs[] = []
cartProd [] ys = []
cartProd (x:xs) ys = map (\y -> (x,y)) ys ++ cartProd xs ys


--Ejercicio 6
--aplica: recibe como parámetros una función y una lista, y devuelve una lista con el resultado de evaluar cada elemento.
aplica :: (a -> a -> a) -> [a] -> a
aplica f [a] = a --ya que en la lista vacia no pasa nada
aplica f (x:y:xs) = aplica f ( (f x y) : xs) 


--Ejercicio 7
--modulo: sin usar la función módulo predefinida en Haskell.
modulo :: Int -> Int -> Int
modulo 0 y = 0
modulo x y = if x < 0 then (x + y) else modulo (x-y) y


--Ejercicio 8
--cadenaPar: recibe como parámetro una cadena y devuelve True si la longitud de la cadena es par y False en el caso contrario.
cadenaPar :: String -> Bool
cadenaPar a = (longitud a) `mod` 2 == 0

--Función auxiliar para saber la longitud de una cadena dada
longitud :: String -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs


--Ejercicio 9
--eliminaRepetidos: recibe como parámetro una lista y devuelve la lista sin repetidos.
eliminaRepetidos :: Eq a => [a] -> [a]
eliminaRepetidos [] = []
eliminaRepetidos [x] = [x]
eliminaRepetidos (x:xs) = x : filter (/= x) (eliminaRepetidos xs)


--Ejercicio 10
--ackermann
ackermann :: Integer-> Integer -> Integer
ackermann 0 n = n+1
ackermann m 0 = ackermann (m-1) 1
ackermann m n = ackermann (m-1) (ackermann m (n-1))