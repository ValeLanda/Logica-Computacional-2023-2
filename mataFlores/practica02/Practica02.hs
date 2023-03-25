module Practica02 where

{- Ejercicio 1. -}
data Elementos = 
    Hidrogeno | Helio | Litio |
    Berilio | Boro | Carbono deriving(Show)

instance Enum Elementos where
    toEnum 1 = Hidrogeno
    toEnum 2 = Helio
    toEnum 3 = Litio
    toEnum 4 = Berilio
    toEnum 5 = Boro
    toEnum 6 = Carbono
    fromEnum Hidrogeno = 1
    fromEnum Helio = 2
    fromEnum Litio = 3
    fromEnum Berilio = 4
    fromEnum Boro = 5
    fromEnum Carbono = 6
{- Se sigue el orden respecto al número atómico del elemento químico. -}



{- Ejercicio 2. -}

data ArbolBin a = ArbolVacio | Nodo a (ArbolBin a) (ArbolBin a)
                deriving(Show, Eq)

{-
    Funsión agrega:
    Agrega un elemento a un arbolBinario de forma 
    ordenada.
-}
agrega :: (Ord e) => e -> (ArbolBin e) -> (ArbolBin e)
agrega e ArbolVacio = Nodo e ArbolVacio ArbolVacio
agrega e (Nodo a l r) 
    | e == a = Nodo e l r
    | e < a = Nodo a (agrega e l) r
    | e > a = Nodo a l (agrega e r)

{-
    Construye un árbol binario ordenado
    a partir de una lista de elementos.
-}
construyeArbolBinOredenado :: (Ord e) => [e] -> (ArbolBin e)
construyeArbolBinOredenado elementos = 
    foldr agrega ArbolVacio elementos

-- Función tamaño: Calcula el número de hojas.
tamanio :: (ArbolBin a) -> Int
tamanio ArbolVacio = 0
tamanio (Nodo _ ArbolVacio ArbolVacio) = 1
tamanio (Nodo _ l r) = (tamanio l) + (tamanio r)

{-
    Función altura: 
    Calcula la distancia a la que se encuentra
    la hoja mas lejana de la raiz. 
-}
altura :: (ArbolBin a) -> Int
altura ArbolVacio = 0
altura (Nodo _ l r) = 1 + (max (altura l) (altura r))

{-
    Funsión ocurrencias:
    Nos diece el núemro de veces que aparece
    un elemento en el árbol.
-}
ocurrencias :: (Ord a) => a -> (ArbolBin a) -> Int
ocurrencias _ ArbolVacio = 0
ocurrencias a (Nodo n l r) = 
    if a == n
        then 1 + (ocurrencias a l ) + (ocurrencias a r)
        else (ocurrencias a l ) + (ocurrencias a r)

{-
    Funsión aplicaArbol:
    Dada una funsión y un árbol,
    devuelve el árbol que se obtiene de
    aplicar la funsión a cada nodo.
-}
aplicaArbol :: (a -> b) -> (ArbolBin a) -> (ArbolBin b)
aplicaArbol _ ArbolVacio = ArbolVacio
aplicaArbol f (Nodo a l r) = 
    Nodo (f a) (aplicaArbol f l) (aplicaArbol f r)

{-
    Funsión lista de hojas:
    Recibe un árbol binario ordenado y regresa
    una lista con sus elementos in-order.
-}
listahojas :: (ArbolBin a) -> [a]
listahojas ArbolVacio = []
listahojas (Nodo a l r) = (listahojas l) ++ [a] ++ (listahojas r) 

{-
    Función unir:
    Dados dos árboles binarios y un valor,
    regresa un nuevo árbol teniendo como 
    nodo raiz el el valor y el primer árbol
    como subárbolizquierdo y el segundo como
    subárbol derecho.
-}
unir :: a -> (ArbolBin a) -> (ArbolBin a) -> (ArbolBin a)
unir a l r = Nodo a l r  



{- Ejercicio 3. -}

-- Dígito Binario.
data DigBinario = Cero | Uno deriving(Show, Eq)

-- Número Binario.
type NumBinario = [DigBinario]

{-
    Función de binario a decimal:
    Convierte un NumBinario a decimal.
-}
binDecimal :: (Integral a, Num b) => NumBinario -> a -> b
binDecimal [] _ = 0
binDecimal numBin p = 
    if (last numBin) == Uno 
        then (2^p) + (binDecimal (init numBin) (p + 1))
        else binDecimal (init numBin) (p + 1)

{-
    Función de decimal a binario:
    Convierte un decimal a NumBinario.
-}
decimalBin :: (Integral a) => a -> NumBinario
decimalBin 0 = []
decimalBin n = 
    if (mod n 2) == 1
        then (decimalBin (div n 2)) ++ [Uno]
        else (decimalBin (div n 2)) ++ [Cero]

{-
    Suma números binarios:
    Suma dos núemros del tipo NumBinario.
-}
sumaNumBin :: NumBinario -> NumBinario -> NumBinario
sumaNumBin n1 n2 = 
    let n = decimalBin ((binDecimal n1 0) + (binDecimal n2 0))
    in 
        if (n == [])
            then [Cero]
            else n