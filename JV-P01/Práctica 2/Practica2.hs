{- 1.- Creación del tipo de dato Elemento con un orden personalizado -}
data Elemento = Aire | Tierra | Agua | Fuego | Lava | Magma deriving (Eq, Show)
toEnum :: Int -> Elemento
fromEnum :: Elemento -> Int

-- El orden de los elementos se define a la temperatura de fusión --
instance Enum Elemento where
fromEnum Aire = 0
fromEnum Tierra = 1
fromEnum Agua = 2
fromEnum Fuego = 3
fromEnum Lava = 4
fromEnum Magma = 5

toEnum 0 = Aire
toEnum 1 = Tierra
toEnum 2 = Agua
toEnum 3 = Fuego
toEnum 4 = Lava
toEnum 5 = Magma


{- 2.- Constructor Árbol Binario con información en las hojas y en los nodos internos -}
data ArbolBin a = Hoja a | Nodo (ArbolBin a) (ArbolBin a) deriving (Eq, Ord, Show)

-- Función que determina el número de hojas de este árbol --
tamaño :: ArbolBin a -> Int
tamaño (Hoja a) = 1
tamaño (Nodo a b) = tamaño a + tamaño b

-- Función que determina la distancia a la que se encuentra la hoja más lejana de la raíz --
altura :: ArbolBin a -> Int
altura (Hoja a) = 0
altura (Nodo a b) = 1 + max (altura a) (altura b)

-- Función que regresa una lista con la información de las hojas y nodos del árbol en inorden --
listaHojas :: ArbolBin a -> [a]
listaHojas (Hoja a) = [a]
listaHojas (Nodo a b) = listaHojas a ++ listaHojas b

-- Función que une dos árboles y un valor regresando un árbol con el valor en la raíz y los dos árboles como hijos (subárbol izquierdo y derecho respectivamente) --
unir :: ArbolBin a -> ArbolBin a -> a -> ArbolBin a
unir a b c = Nodo a (Nodo b (Hoja c))


{- 3.- Creación de Tipo de dato DigBinario -}
data DigBinario = Cero | Uno deriving (Eq, Ord, Show)
type NumBinario = [DigBinario]

suma :: DigBinario -> DigBinario -> DigBinario
suma Cero Cero = Cero
suma Cero Uno = Uno
suma Uno Cero = Uno
suma Uno Uno = Cero