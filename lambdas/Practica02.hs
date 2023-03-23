-- | Practica 02
-- | Integrantes
-- | Sanchez Correa Diego Sebastián
-- | Zhang Liu Xin Wen
module Practica2 where 


{-
Tipo de datos Elemento deriving Enum
-}
data Elemento = Lunes | Martes | Miercoles | Jueves | Viernes | Sabado | Domingo  deriving(Show , Ord , Eq)

instance Enum Elemento where
toEnum 0 = Lunes
toEnum 1 = Martes 
toEnum 2 = Miercoles
toEnum 3 = Jueves
toEnum 4 = Viernes
toEnum 5 = Sabado
toEnum 6 = Domingo

fromEnum Lunes = 0 
fromEnum Martes = 1
fromEnum Miercoles = 2
fromEnum Jueves = 3
fromEnum Viernes = 4
fromEnum Sabado = 5
fromEnum Domingo = 6

{-
ArbolBin, arbol binario con informacion en las hojas y en los nodos internos.
-}



{-
Tipo de dato DigBinario, el cual contiene unicaamente al Cero y Uno.
-}
data DigBinario = Cero | Uno deriving(Eq, Ord, Show, Enum)

{-
Tipo de dato NumBinario creado a partir de DigBinario.
-}
type NumBinario = [DigBinario]


{-
suma. recibe un NumBinario y regresa la suma binaria.
-}
suma :: DigBinario -> DigBinario -> DigBinario
suma a b = if a<b || a>b then Uno
           else Cero 


-- data Alumno' = Local Alumno | Intercambio Alumno Pais


-- --Tipos usando sata , recusivos
-- data ArbolBin a = Hoja a | Nodo (ArbolBin a) (ArbolBin a)

-- data ArbolBin' a = Nil | Nodo' ( ArbolBin' a ) a (ArbolBin' a)
--    /
--   (a)
--  /  \
--Nil  Nil







