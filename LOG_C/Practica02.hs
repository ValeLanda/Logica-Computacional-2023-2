{-
 1.
 Funcion para crear un nuevo tipo de dato  Elemento
 Los elementos tienen un orden cronologico de 1 .. 6 
-}

data Elemento = ICC | EDD | LOG_COM | MODELADO | ING_SOFTWARE | INTELIGENCIA_ARTIFICIAL deriving (Eq, Show)


instance Enum Elemento where
    toEnum 1 = ICC
    toEnum 2 = EDD
    toEnum 3 = MODELADO
    toEnum 4 = LOG_COM
    toEnum 5 = ING_SOFTWARE
    toEnum 6 = INTELIGENCIA_ARTIFICIAL
    fromEnum ICC = 1
    fromEnum EDD = 2
    fromEnum MODELADO = 3
    fromEnum LOG_COM = 4
    fromEnum ING_SOFTWARE = 5
    fromEnum INTELIGENCIA_ARTIFICIAL = 6

{-
 2. 
 Implementación de un Arbol Binario con informacion el las hojas y en los nodos
-}
data Arbol a = Nil | Node a (Arbol a ) (Arbol a) deriving Show

--Funcion auxiliar que verifica si un arbol no tiene elementos
esNil :: Arbol a -> Bool
esNil Nil    = True
esNil (Node a i d) = False

--Precondicion: El arbol no debe ser vacio
hijoIz :: Arbol a -> Arbol a
hijoIz (Node a i d) =  i

--Precondicion: El arbol no debe ser vacio
hijoDer :: Arbol a -> Arbol a
hijoDer (Node a i d) = d

--Funcion que calcula el número de nodos de un arbol binario
numeroNodos :: Arbol a -> Int
numeroNodos Nil   = 0
numeroNodos (Node a i d) = 1 + numeroNodos i + numeroNodos d

-- Funcion que determina el número de hojas de un arbol binario
tamanio :: Arbol a -> Int
tamanio Nil    = 0
tamanio (Node a i d)
    | esNil i && esNil d       = 1
    | otherwise                = tamanio i + tamanio d

-- Funcion auxiliar para obtener el mayor de dos números
mayor :: Int -> Int -> Int
mayor n m 
    | n >= m    = n
    | otherwise = m

-- Funcion que calcula la distancia entre la ultima hija del arbol y la raiz del mismo
altura :: Arbol a -> Int
altura Nil           = 0
altura (Node a i d)  = 1 + mayor(altura i) (altura d)

-- Funcion que proyecta en la consola una lista con la informacion de las hojas y nodos en inorden
listaHojas :: Arbol a -> [a]
listaHojas (Node a Nil Nil) = [a]
listaHojas (Node a i d)     = listaHojas i ++ [a] ++ listaHojas d

{-
 3.
 Tipo de dato DigBinario solo contiene al Cero y Uno
-}

data DigBinario = Cero | Uno deriving(Eq, Ord, Show, Enum)
type NumBinario = [DigBinario]

--Primer elemento es el resultado y el segundo es el acarreo
suma :: DigBinario -> DigBinario -> (DigBinario, DigBinario)
suma Cero Cero =  (Cero, Cero)
suma Cero Uno =  (Uno, Cero)
suma Uno Cero =  (Uno, Cero)
suma Uno Uno  =  (Uno, Uno)