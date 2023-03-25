--Crea el tipo de datos Elemento, con al menos 6, define
--manualmente la relación para la clase Enum, establece
--un orden personalizado y en el comentario explica el
--orden propuesto. Además, el tipo de dato debe poder mostrarse.


--Utlizamos la clase Enum con el tipo data para poder definir el orden.
--La clase Enum permite la enumeración de los elementos de un tipo de datos
--de manera secuencial, entonces definimos el valor de cada elemento
--así como el sucesor y el predecesor de cada elemento.
data Elemento= Agua | Fuego | Tierra | Aire | Luz | Oscuridad deriving(Eq, Ord, Show)
instance Enum Elemento where
    toEnum :: Int -> Elemento
    toEnum 0 = Agua
    toEnum 1 = Fuego
    toEnum 2 = Tierra
    toEnum 3 = Aire
    toEnum 4 = Luz
    toEnum 5 = Oscuridad
    toEnum _ = error "No existe"
    fromEnum :: Elemento -> Int
    fromEnum Agua = 0
    fromEnum Fuego = 1
    fromEnum Tierra = 2
    fromEnum Aire = 3
    fromEnum Luz = 4
    fromEnum Oscuridad = 5
    succ :: Elemento -> Elemento
    succ Agua = Fuego
    succ Fuego = Tierra
    succ Tierra = Aire
    succ Aire = Luz
    succ Luz = Oscuridad
    succ Oscuridad = error "No existe"
    pred :: Elemento -> Elemento
    pred Agua = error "No existe"
    pred Fuego = Agua
    pred Tierra = Fuego
    pred Aire = Tierra
    pred Luz = Aire
    pred Oscuridad = Luz

--Funcion que indica que tiene informacion en hojas y en los nodos
-- data ArbolBinario a = Hoja a | Nodo (ArbolBinario a) (ArbolBinario a)

data Arbol a = Nil | Hoja a | A a (Arbol a) (Arbol a) deriving(Show)
maximoAux :: Ord a => [a] ->a ->a
maximoAux [] x = x
maximoAux (x:xs) y = if x > y then maximoAux xs x else maximoAux xs y

maximo :: Ord a => [a]-> a
maximo (x:xs)  = maximoAux xs x

-- altura de un arbol que tiene informacion en hojas y en los nodos
altura :: Arbol a -> Integer 
altura Nil =0
altura (Hoja a) = 1
altura (A a l r ) = 1 + maximo [altura l , altura r]


--Numero de hojas de un arbol
tamanio :: Arbol a -> Integer 
tamanio Nil =0
tamanio (Hoja a) =1
tamanio (A a l r) = tamanio l +tamanio r

-- listaHojas donde se almacenan las hojas de un arbol
listaHojas :: Arbol a -> [a]
listaHojas Nil =[]
listaHojas (Hoja a)=[a]
listaHojas (A a l r)= listaHojas l ++ [a] ++listaHojas r 


--Funcion unir donde se unen arboles en un solo arbol
unir :: Arbol a -> Arbol a -> a -> Arbol a
unir (A b l r) (Hoja c) a = (A a (A b l r) (Hoja c) )
unir (Hoja c) (A b l r) a = (A a (Hoja c) (A b l r))
unir (Hoja c) (Hoja b) a = (A a (Hoja c) (Hoja b))
unir (A a l r) (A b le ri) c = (A c (A a l r) (A b le ri))
unir  _  _   _ = Nil
