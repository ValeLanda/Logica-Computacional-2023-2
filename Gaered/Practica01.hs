{-1.esPalindromo, recibe como parametro una lista y devuelve un boolean,
 True en caso de que la lista sea un palíndromo y False en el caso contrario.
-}

--Funcion auxiliar para calcular la reversa de una lista
reversa :: [a] -> [a]
reversa [] = []
reversa (x:xs) = reversa xs ++ [x]

--Funcion principal del ejercicio
esPalindromo :: Eq a => [a] -> Bool
esPalindromo xs = reversa xs == xs

{-2.divisores, recibe como parametro un natural n y 
 devuelve una lista con todos los divisores de n.
-}
divisores :: Integer -> [Integer]
divisores n = if n > 0 
    then [x | x <- [1..n], (modulo n x) == 0]
    else error "No es un número natural"

{-3.primos, recibe como parámetro un natural n y 
 devuelve una lista con todos los números primos entre 1 y n.-}
--Devolvemos todos los que solo tengan dos divisores, el 1 y el mismo numero
primos :: Integer -> [Integer]
primos n = if n > 0
    then [x | x <- [2..n], (divisores x)==[1,x]]
    else error "No es un número natural"

{-4.sumaPares, recibe como parámetro una lista de pares ordenados
 y devuelve una par con el resultado de sumar todos los pares 
 ordenados de la lista.-}

--Funcion auxiliar que saca la suma de la primer coordenada en las tuplas
sumaX :: Num a => [(a,a)] -> a
sumaX [] = 0
sumaX ((x,y):xs) = x + sumaX xs 

--Funcion auxiliar que saca la suma de la segunda coordenada en las tuplas
sumaY :: Num a => [(a,a)] -> a
sumaY [] = 0
sumaY ((x,y):ys) = y + sumaY ys

--Funcion principal del ejercicio
sumaPares :: Num a => [(a,a)] -> (a,a)
sumaPares xs = (sumaX xs, sumaY xs)

{-5. productoCartesiano, recibe como parametros dos listas, A y B,
 y devuelve una lista con el producto cartesiano, AxB.-}
productoCartesiano :: [a] -> [b] -> [(a,b)]
productoCartesiano xs ys = [(x,y)| x <- xs, y <- ys]

{-6.aplica, recibe como parametros una función y una lista,
 y devuelve una lista con el resultado de evaluar cada elemento.-}
aplica :: (a -> b) -> [a] -> [b]
aplica f [] = []
aplica f (x:xs) = [f (x)] ++ aplica f xs

{-7.modulo, sin usar la funcion modulo predefinida en Haskell.-}
--Hacemos restas hasta que n sea menor a m
modulo :: Integer -> Integer -> Integer
modulo 0 m = 0
modulo n 0 = error "División entre cero"
modulo n m = if n<m then n else modulo (n-m) m

{-8. cadenaPar, recibe como parametro una cadena y devuelve True
 si la longitud de la cadena es par y False en el caso contrario.-}

--Funcion auxiliar que devuelve la longitud de una lista
longitud :: [a] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

--Funcion principal del ejercicio
cadenaPar :: [a] -> Bool
cadenaPar xs = if mod (longitud xs) 2 == 0 
    then True 
    else False

{-9.eliminaRepetidos, recibe como parámetro una lista y
 devuelve la lista sin repetidos.-}

--Funcion auxiliar que determina si un elemento esta en una lista dada
contiene :: Eq a => [a] -> a -> Bool
contiene [] x = False
contiene (x:xs) y = if x == y then True else contiene xs y

--Funcion principal del ejercicio
eliminaRepetidos :: Eq a => [a] -> [a]
eliminaRepetidos [] = []
eliminaRepetidos (x:xs) = if contiene xs x then eliminaRepetidos xs else [x] ++ eliminaRepetidos xs

{-10.Funcion de ackermann-}
ackermann :: Int -> Int -> Int
ackermann 0 m = m+1
ackermann n 0 = ackermann (n-1) 1
ackermann n m = ackermann (n-1) (ackermann n (m-1))