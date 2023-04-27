data Elementos = Agua | Fuego | Aire | Tierra 
    deriving (Show)
instance Enum Elementos where 
    toEnum 0 = Fuego
    toEnum 1 = Agua
    toEnum 2 = Tierra
    toEnum 3 = Aire
    toEnum _ = error "No existe tal elemento."
    fromEnum Fuego  = 0
    fromEnum Agua   = 1
    fromEnum Tierra = 2
    fromEnum Aire   = 3
    succ Fuego  = Agua
    succ Agua   = Tierra
    succ Tierra = Aire
    succ Aire   = Fuego
    pred Agua   = Fuego
    pred Tierra = Agua 
    pred Aire   = Tierra 
    enumFromTo Fuego Aire = [Fuego,Agua,Tierra,Aire]
    enumFromTo _ _ = error "Rango Invalido."



data ArbolBin' a = Vacio | Nodo a (ArbolBin' a) (ArbolBin' a) | NodoHD a (ArbolBin' a) | NodoHI (ArbolBin' a) a
              deriving (Show, Eq)

-- Función que saca el tamaño de un arbol binario
tamanio :: (ArbolBin' a) -> Int
tamanio Vacio = 0
tamanio (NodoHD a (b)) = 1 + tamanio b
tamanio (NodoHI (b) a) = 1 + tamanio b
tamanio (Nodo _ b c) = 1 + (tamanio b) + (tamanio c)

-- Función que saca la altura de un arbol binario
altura :: (ArbolBin' a) -> Int
altura Vacio = 0
altura (NodoHD a (b)) = 1 + altura b
altura (NodoHI (b) a) = 1 + altura b
altura (Nodo _ b c) = 1 + max (altura b) (altura c)

-- Función que cuenta las apariciones en un arbol binario
ocurrencias :: (Eq a) => (ArbolBin' a) -> a -> Int
ocurrencias Vacio a = 0
ocurrencias (NodoHD a (b)) a' = if a == a' then 1 + ocurrencias b a' else ocurrencias b a'
ocurrencias (NodoHI (b) a) a' = if a == a' then 1 + ocurrencias b a' else ocurrencias b a'
ocurrencias (Nodo a b c) a'
    | a == a' = 1 + ocurrencias b a' + ocurrencias c a'
    | otherwise = ocurrencias b a' + ocurrencias c a'

-- Función que que aplica una función al arbol binario
aplicaArbol :: (ArbolBin' a) -> (a -> b) -> (ArbolBin' b)
aplicaArbol Vacio _ = Vacio
aplicaArbol (NodoHD a (b)) f = NodoHD (f a) (aplicaArbol b f)
aplicaArbol (NodoHI (b) a) f = NodoHI (aplicaArbol b f) (f a)
aplicaArbol (Nodo a b c) f = Nodo (f a) (aplicaArbol b f) (aplicaArbol c f)

data DigBinario = Cero | Uno
    deriving (Show, Eq)

type NumBinario = [DigBinario]

--Final | NumBinario  DigBinario deriving (Show)

-- Función que suma dos numeros binarios
suma :: NumBinario -> NumBinario -> NumBinario
suma xs ys
    | length xs == length ys = reverse (suma' (reverse (xs)) (reverse (ys)))
    | length xs > length ys = suma xs (reverse (ajustaTamano (reverse ys) xs))
    | otherwise = suma (reverse (ajustaTamano (reverse xs) ys))  ys 

-- Función que ajusta el tamaño de dos numeros binarios para que tengan la misma cantidad de longitud
ajustaTamano :: NumBinario -> NumBinario -> NumBinario
ajustaTamano [] [] = []
ajustaTamano [] (y:ys) = Cero : ajustaTamano [] ys
ajustaTamano (x:xs) (y:ys) = x : ajustaTamano xs ys

-- Función que lleva el acarreo en un asuma binaria
acarreo :: NumBinario -> NumBinario -> NumBinario
acarreo = zipWith (andBits)
        where
            andBits x y 
                | x == Uno && y == Uno = Uno
                | otherwise = Cero
                
-- Funcion auxiliar para la suma binaria
suma' ::  NumBinario -> NumBinario -> NumBinario
suma' [] [] = []
suma' xs [] = xs
suma' [] ys = ys
suma' xs ys 
    | isCero ys = xs
    | otherwise = suma' (xorBits (ajustaTamano xs ys) ys) ((++) [Cero] (acarreo xs ys))
    where
        xorBits = zipWith (xorBit)
        xorBit x y 
            | x /= y = Uno
            | otherwise = Cero
        isCero [] = True
        isCero (x:xs) = if x == Uno then False else isCero xs
