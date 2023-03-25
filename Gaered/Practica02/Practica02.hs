--Definicion Elemento
data Elemento = Violeta | Azul | Verde | Amarillo | Naranja | Rojo deriving (Show)

{-
Establece una numeración de los elementos.
Los elementos (colores) se enumeran primero los de menor longitud de onda,
hasta llegar a los de mayor longitud de onda.
-}
instance Enum Elemento where

  --Establece el sucesor de los elementos
  succ Violeta = Azul
  succ Azul = Verde
  succ Verde = Amarillo
  succ Amarillo = Naranja
  succ Naranja = Rojo
  succ Rojo = error "No hay un siguiente elemento después de Rojo"

  --Establece el predecesor de los elementos
  pred Rojo = Naranja
  pred Naranja = Amarillo
  pred Amarillo = Verde
  pred Verde = Azul
  pred Azul = Violeta
  pred Violeta = error "No hay un elemento anterior a Violeta"

  enumFrom x = enumFromTo x Rojo

  enumFromThen x y = if fromEnum y >= fromEnum x
                       then enumFromThenTo x y Rojo
                       else enumFromThenTo x y Violeta

  -- Convierte un valor entero en un valor del tipo Elemento
  toEnum n = case n of
    0 -> Violeta
    1 -> Azul
    2 -> Verde
    3 -> Amarillo
    4 -> Naranja
    5 -> Rojo
    _ -> error "Valor no válido"

  -- Convierte un valor del tipo Elemento en un valor entero
  fromEnum Violeta = 0
  fromEnum Azul = 1
  fromEnum Verde = 2
  fromEnum Amarillo = 3
  fromEnum Naranja = 4
  fromEnum Rojo = 5

--Establece un orden entre los elementos
instance Ord Elemento where
  compare a b = compare (fromEnum a) (fromEnum b)

--Compara dos elementos
instance Eq Elemento where
  a == b = fromEnum a == fromEnum b


--Definicion del tipo ArbolBin'
data ArbolBin' a = Hoja a | Nodo (ArbolBin' a) a (ArbolBin' a) | NodoHI (ArbolBin' a) a | NodoHD a (ArbolBin' a) deriving (Show)

{-
Funcion que devuelve las aparciones de un valor en el Arbol dado
-}
ocurrencias :: (Eq a) => ArbolBin' a -> a -> Int
ocurrencias (Hoja x) r = if x == r
    then 1
    else 0
ocurrencias (Nodo t1 x t2) r = if x == r
    then 1 + (ocurrencias t1 r) + (ocurrencias t2 r)
    else (ocurrencias t1 r) + (ocurrencias t2 r)
ocurrencias (NodoHI t x) r = if x == r
    then 1 + (ocurrencias t r)
    else (ocurrencias t r)
ocurrencias (NodoHD x t) r = if x == r
    then 1 + (ocurrencias t r)
    else (ocurrencias t r)
{-
Dada una funcion y un arbol, devuelve el arbol que se obtiene
de aplicar la funcion a cada nodo.
-}
aplicaArbol :: (a -> b) -> ArbolBin' a -> ArbolBin' b
aplicaArbol f (Hoja x) = (Hoja (f x))
aplicaArbol f (Nodo t1 x t2) = (Nodo (aplicaArbol f t1) (f x) (aplicaArbol f t2))
aplicaArbol f (NodoHI t x) = (NodoHI (aplicaArbol f t) (f x))
aplicaArbol f (NodoHD x t) = (NodoHD (f x) (aplicaArbol f t))

{-
Funcion que dado un arbol, devuelve una lista con la informacion de las hojas
y nodos en inorden
-}
listaHojas :: ArbolBin' a -> [a]
listaHojas (Hoja x) = [x]
listaHojas (Nodo t1 x t2) = (listaHojas t1) ++ [x] ++ (listaHojas t2)
listaHojas (NodoHI t x) = (listaHojas t) ++ [x]
listaHojas (NodoHD x t) = [x] ++ (listaHojas t)

{-
Funcion que dados dos arboles binarios y un valor, devuelve
un nuevo arbol teniendo como nodo raiz el valor, el primer arbol como subarbol
izquierdo y el segundo arbol como subarbol derecho
-}
unir :: ArbolBin' a -> ArbolBin' a -> a -> ArbolBin' a
unir t1 t2 x = Nodo t1 x t2


--Definicion DigBinario
data DigBinario = Cero | Uno deriving (Eq)
--Definicion Show
instance Show DigBinario where
    show = showDigBinario

showDigBinario :: DigBinario -> String
showDigBinario Cero = "0"
showDigBinario Uno = "1"

--Definicion NumBinario
type NumBinario = [DigBinario]

{-
Funcion auxiliar que suma dos digitos binarios
-}
sumaDigBinario :: DigBinario -> DigBinario -> DigBinario
sumaDigBinario Cero Cero = Cero
sumaDigBinario Cero Uno = Uno
sumaDigBinario Uno Cero = Uno
sumaDigBinario Uno Uno = Cero

{-
Funcion auxiliar que calcula el acarreo de sumar 3 digitos
-}
acarreo :: DigBinario -> DigBinario -> DigBinario -> DigBinario
acarreo Uno Uno _ = Uno
acarreo Uno _ Uno = Uno
acarreo _ Uno Uno = Uno
acarreo _ _ _ = Cero

{-
Funcion auxiliar recursiva que suma digito por digito considereando los acarreos.
-}
sumaNumBinarioAcarreo :: DigBinario -> NumBinario -> NumBinario -> NumBinario
sumaNumBinarioAcarreo c [] [] = [c]
sumaNumBinarioAcarreo c xs [] = if c == Cero
    then xs
    else sumaNumBinarioAcarreo Cero xs [Uno]
sumaNumBinarioAcarreo c [] ys = if c == Cero
    then ys
    else sumaNumBinarioAcarreo Cero [Uno] ys
sumaNumBinarioAcarreo c xs ys = (sumaNumBinarioAcarreo (acarreo c (last xs) (last ys)) (init xs) (init ys)) ++
        [(sumaDigBinario c (sumaDigBinario (last xs) (last ys)))]

{-
Funcion principal del ejercicio, suma dos numeros binarios
-}
suma :: NumBinario -> NumBinario -> NumBinario
suma xs ys = sumaNumBinarioAcarreo Cero xs ys
