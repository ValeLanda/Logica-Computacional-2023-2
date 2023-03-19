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


