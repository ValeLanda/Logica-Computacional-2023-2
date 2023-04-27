-- Ejercicio 1
-- Función que pone a prueba la creación de Elementos y la función Enum
data Elemento = Agua | Fuego | Aire | Tierra | Eter | Trueno deriving(Show) 
instance Enum Elemento where
    toEnum 0 = Agua
    toEnum 1 = Fuego
    toEnum 2 = Aire
    toEnum 3 = Tierra
    toEnum 4 = Eter
    toEnum 5 = Trueno
    toEnum _ = error "Elemento invalido"
    fromEnum Agua = 0
    fromEnum Fuego = 1
    fromEnum Aire = 2
    fromEnum Tierra = 3
    fromEnum Eter = 4
    fromEnum Trueno = 5
    succ Agua = Fuego
    succ Fuego = Aire
    succ Aire = Tierra
    succ Tierra =Eter
    succ Eter = Trueno
    succ Trueno = Agua
    pred Agua = Trueno
    pred Fuego = Agua
    pred Aire = Fuego
    pred Tierra = Aire
    pred Eter = Tierra
    pred Trueno = Eter
    enumFromTo Agua Trueno =[Agua,Fuego,Aire,Tierra,Eter,Trueno]

-- main :: IO()
-- main = mapM_ print [Fuego .. Agua]
-- Ejercicio 2
data ArbolBinario a = Hoja a | Nodo (ArbolBinario a) a (ArbolBinario a) | NodoHI (ArbolBinario a) a | NodoHD a (ArbolBinario a) deriving (Eq, Show)

-- tamanio: número de hojas
tamanio :: (ArbolBinario a) -> Int
tamanio (Hoja _) = 1
tamanio (Nodo hi a hd) = 1 + tamanio(hi) + tamanio(hd)
tamanio (NodoHI hi a) = 1 + tamanio(hi)
tamanio (NodoHD a hd) = 1 + tamanio(hd)

-- altura: distancia a la que se encuentra la hoja más lejana a la raíz
altura :: (ArbolBinario a) -> Int
altura (Hoja _) = 1
altura (Nodo hi a hd) = 1 + max (altura hi) (altura hd)
altura (NodoHI hi a) = 1 + (altura hi)
altura (NodoHD a hd) = 1 + (altura hd)

-- ocurrencias: apariciones de un valor 
ocurrencias :: (Eq a) => (ArbolBinario a) -> a -> Int
ocurrencias (Hoja h) x = if x == h then 1 else 0
ocurrencias (Nodo hi e hd) x = if x == e then 1 + (ocurrencias hi x) + (ocurrencias hd x) else (ocurrencias hi x) + (ocurrencias hd x)
ocurrencias (NodoHI hi e) x = if x == e then 1 + (ocurrencias hi x) else (ocurrencias hi x)
ocurrencias (NodoHD e hd) x = if x == e then 1 + (ocurrencias hd x) else (ocurrencias hd x) 

-- aplicaArbol: dada una función y un árbol, devuelve el árbol que se obtiene de aplicar la función a cada nodo
aplicaArbol :: (a -> a) -> (ArbolBinario a) -> (ArbolBinario a)
aplicaArbol f (Hoja h) = Hoja (f h)
aplicaArbol f (Nodo hi a hd) = Nodo (aplicaArbol f hi) (f a) (aplicaArbol f hd)
aplicaArbol f (NodoHI hi a) = NodoHI (aplicaArbol f hi) (f a)
aplicaArbol f (NodoHD a hd) = NodoHD (f a) (aplicaArbol f hd)

-- listaHojas: dado un árbol regresa una lista con la información de las hojas y nodos en inorden.
listaHojas :: (ArbolBinario a) -> [a]
listaHojas (Hoja h) = [h]
listaHojas (Nodo hi a hd) = (listaHojas hi) ++ [a] ++ (listaHojas hd)
listaHojas (NodoHI hi a) = (listaHojas hi) ++ [a]
listaHojas (NodoHD a hd) = [a] ++ (listaHojas hd)

-- unir: dados dos árboles y un valor regresa un nuevo árbol teniendo como nodo raíz el valor y el primer árbol
-- como subárbol izquierdo y el segundo como subárbol derecho. 
unir :: (ArbolBinario a) -> (ArbolBinario a) -> a -> (ArbolBinario a)
unir arbol1 arbol2 n = Nodo arbol1 n arbol2

--Pruebas
arbol1 = Nodo (Hoja 5) 1 (Nodo (Nodo (Hoja 2) 3 (Hoja 3)) 2 (Hoja 0))
arbol2 = Nodo (NodoHI (Hoja 1) 2) 1 (Nodo (NodoHI (Hoja 1) 4) 3 (Hoja 4))
arbol3 = Nodo (Nodo (Hoja 1) 2 (Hoja 3)) 4 (Nodo (Hoja 5) 6 (Hoja 7))

cuadrado n = n * n
ejemploAplica = listaHojas (aplicaArbol cuadrado arbol3)
-- Ejercicio 3
data DigBinario = Cero | Uno deriving (Eq, Ord, Show)
type NumBinario = [DigBinario]

-- Funcion que suma bits
sumaBit :: DigBinario -> DigBinario -> DigBinario -> (DigBinario, DigBinario)
sumaBit Cero Cero Cero = (Cero, Cero)
sumaBit Cero Uno Cero = (Uno, Cero)
sumaBit Cero Cero Uno = (Uno, Cero)
sumaBit Cero Uno Uno = (Cero, Uno)
sumaBit Uno Cero Cero = (Uno, Cero)
sumaBit Uno Uno Cero = (Cero, Uno)
sumaBit Uno Cero Uno = (Cero, Uno)
sumaBit Uno Uno Uno = (Uno, Uno)

-- Función que suma números binarios
suma :: NumBinario -> NumBinario -> NumBinario
suma x y = sumaAux (rev x) (rev y) Cero

-- Función auxiliar de la función suma
sumaAux :: [DigBinario] -> [DigBinario] -> DigBinario -> [DigBinario]
sumaAux [] [] Cero = [Cero]
sumaAux [] [] Uno = [Uno]
sumaAux (x:xs) (y:ys) c = first (sumaBit x y c) : sumaAux xs ys (second(sumaBit x y c))

first :: (DigBinario, DigBinario) -> DigBinario
first (x, y) = x

second :: (DigBinario, DigBinario) -> DigBinario
second (x, y) = y

rev :: [DigBinario] -> [DigBinario]
rev [] = []
rev (x:xs) = rev xs ++ [x] 
