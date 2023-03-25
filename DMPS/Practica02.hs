{-PRACTICA 02
Integrantes:
1. Mora Hernandez Dulce Julieta (319236448)
2. Noriega Rodriguez Marcos Julian (319284061)
3. Palomo Valle Samantha Charlize (319273841)
4. Resendiz Mendoza Brenda Paola (319041356)
-}


--Ejercicio 1: Elemento
data Elemento = Agua | Fuego | Planta | Tierra | Electricidad | Roca | Acero deriving(Eq, Show)

--Asignamos un valor numérico a cada dato
instance Enum Elemento where
    toEnum 7 = Roca
    toEnum 6 = Electricidad
    toEnum 5 = Agua
    toEnum 4 = Fuego
    toEnum 3 = Planta
    toEnum 2 = Tierra
    toEnum 1 = Acero

    fromEnum Roca = 7
    fromEnum Electricidad = 6
    fromEnum Agua = 5
    fromEnum Fuego = 4
    fromEnum Planta = 3
    fromEnum Tierra = 2
    fromEnum Acero = 1

--Establecemos un orden, el cual está basado parcialmente en los tipos pokémon y contra cuál es efectivo cada uno.
instance Ord Elemento where
    compare e1 e2 = compare (fromEnum e1) (fromEnum e2)

    e1 <= e2 = case compare e1 e2 of
        LT -> True
        EQ -> True
        GT -> False


--Ejercicio 02: Arboles binarios

--ArbolBin
data ArbolBin a = Hoja a | Nodo a (ArbolBin a) (ArbolBin a)

-- Devuelve el número de elementos en el árbol
numeroNodos :: (Num a) => ArbolBin t -> a
numeroNodos (Hoja x) = 0
numeroNodos (Nodo x i d) = 1 + numeroNodos i + numeroNodos d

-- función que devulve la suma de los nodos
sumNodos :: Num a => ArbolBin a -> a
sumNodos (Hoja x) = x
sumNodos (Nodo x left right) = x + sumNodos left + sumNodos right

-- función que devuelve la suma de las hojas
sumHojas :: Num a => ArbolBin a -> a
sumHojas (Hoja x) = x
sumHojas (Nodo _ left right) = sumHojas left + sumHojas right

-- A) función que devuelve la altura de un arbol binario
altura :: ArbolBin a -> Integer
altura (Hoja _ ) = 0
altura (Nodo _ left right) = 1 + max (altura left) (altura right)

--B) tamanio,función que devuelve el numero de hojas de un arbol binario
tamanio :: ArbolBin a -> Integer
tamanio (Hoja x) = 1
tamanio (Nodo x i d) = tamanio i + tamanio d

--arbol :: ArbolBin Integer
--arbol = Nodo 1 (Nodo 2 (Hoja 3) (Hoja 4) (Hoja 5))

--C) Ocurrencia: las ocurrencias de un valor dado en un árbol binario
data ArbolBin' a = Hoja' a | Nodo' a (ArbolBin' a) (ArbolBin' a)
    
countOccurrences :: (Eq a) => a -> ArbolBin' a -> Int
countOccurrences _ a = 0
countOccurrences x (Nodo' y left right)
    | x == y = 1 + countOccurrences x left + countOccurrences x right
    | otherwise = countOccurrences x left + countOccurrences x right

--D)ListHojas: Un arbol binario regresa una lista con la informacion de las hojas y nodos en inorden 
--data ArbolBin a = Hoja a | Nodo a (Arbol a) (Arbol a)

inordenlistaHojas :: ArbolBin' a -> [(Bool, a)]
inordenlistaHojas (Hoja' x) = [(True, x)]
inordenlistaHojas (Nodo' x left right) = inordenlistaHojas left ++ [(False, x)] ++ inordenlistaHojas right


--Ejercicio 03: DigBinario 
data DigBinario = Cero | Uno deriving(Eq, Ord, Show, Enum)
type NumBinario = [DigBinario]

--suma: recibe un NumBinario y nos regresa la suma binaria
reversa :: NumBinario -> NumBinario
reversa [] = []
reversa (x:xs) = reversa xs ++ [x]

sumaDig :: DigBinario -> DigBinario -> DigBinario
sumaDig Cero Cero = Cero
sumaDig Cero Uno = Uno
sumaDig Uno Cero = Uno
sumaDig Uno Uno = Cero

replica :: Int -> DigBinario -> NumBinario
replica 0 y = []
replica x y = y : replica (x-1) y

suma :: NumBinario -> NumBinario -> NumBinario
suma xs ys = reversa(sumaAux (reversa xs) (reversa ys))

sumaAux :: NumBinario -> NumBinario -> NumBinario
sumaAux xs ys
 | length xs < length ys = (sumaAux (xs ++ (replica (length ys - length xs) Cero)) ys)
 | length ys < length xs = (sumaAux xs (ys ++ (replica (length xs - length ys) Cero)))
 | otherwise = sumaAcarreo xs ys Cero
 where
  sumaAcarreo :: NumBinario -> NumBinario -> DigBinario -> NumBinario
  sumaAcarreo [] [] a
   | a == Cero = []
   | otherwise = [Uno]
  sumaAcarreo (x:xs) [] a
   | x == Cero && a == Cero = (Cero:(sumaAcarreo xs [] Cero))
   | x == Cero && a == Uno = (Cero:(sumaAcarreo xs [] Uno))
   | x == Uno && a == Cero = (Uno:(sumaAcarreo xs [] Cero))
   | x == Uno && a == Uno = (Cero:(sumaAcarreo xs [] Uno))
  sumaAcarreo [] (y:ys) a
   | y == Cero && a == Cero = (Cero:(sumaAcarreo ys [] Cero))
   | y == Cero && a == Uno = (Cero:(sumaAcarreo ys [] Uno))
   | y == Uno && a == Cero = (Uno:(sumaAcarreo ys [] Cero))
   | y == Uno && a == Uno = (Cero:(sumaAcarreo ys [] Uno))
  sumaAcarreo (x:xs) (y:ys) a
   | x == Cero && y == Cero && a == Cero = (Cero:(sumaAcarreo xs ys Cero))
   | x == Cero && y == Uno && a == Cero = (Uno:(sumaAcarreo xs ys Cero))
   | x == Cero && y == Cero && a == Uno = (Uno:(sumaAcarreo xs ys Cero))
   | x == Cero && y == Uno && a == Uno = (Cero:(sumaAcarreo xs ys Uno))
   | x == Uno && y == Cero && a == Cero = (Uno:(sumaAcarreo xs ys Cero))
   | x == Uno && y == Uno && a == Cero = (Cero:(sumaAcarreo xs ys Uno))
   | x == Uno && y == Cero && a == Uno = (Cero:(sumaAcarreo xs ys Uno))
   | x == Uno && y == Uno && a == Uno = (Uno:(sumaAcarreo xs ys Uno))
