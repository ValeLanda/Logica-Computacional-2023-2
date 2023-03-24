{-
- Lógica computacional 2023-2
- Práctica 2
-}
--Ejercicio 01
{-Crea el tipo de dato Elemento 
Define manualmente la relacion para la 
clase Enum
Establece un orden personalizado
El tipo de dato debe de poder mostrarse
-}


--Creacion del tipo de dato elementos
data Elemento = Agua | Tierra | Aire | Fuego | Metal | Electrico | Diamante | Hielo  deriving(Eq, Show)

--Orden personalizado de Elementos
instance Enum Elemento where  
    toEnum 1 = Agua 
    toEnum 2 = Tierra 
    toEnum 3 = Aire
    toEnum 4 = Fuego
    toEnum 5 = Metal
    toEnum 6 = Electrico
    toEnum 7 = Diamante
    toEnum 8 = Hielo

    fromEnum Agua = 1
    fromEnum Tierra = 2
    fromEnum Aire = 3
    fromEnum Fuego = 4
    fromEnum Metal = 5
    fromEnum Electrico = 6
    fromEnum Diamante = 7
    fromEnum Hielo = 8