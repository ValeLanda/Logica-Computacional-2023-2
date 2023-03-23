-- | Practica 02
-- | Integrantes
-- | Sanchez Correa Diego Sebastián
-- | Zhang Liu Xin Wen
module Practica2 where 


{-
Tipo de datos Elemento deriving Enum
-}


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







data Dia = Lunes | Martes | Miercoles deriving(Show , Ord , Eq)
instance Enum Dia where
toEnum Lunes = 0
toEnum Martes = 1
toEnum Miercoles = 2
fromEnum 0 = Lunes
fromEnum 1 = Martes
fromEnum 2 = Miercoles



