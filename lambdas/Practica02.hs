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
data Tree t = Void | Node t (Tree t) (Tree t) deriving (Show)

-- tamanio :: Tree t -> Int
tamanio :: Num p => Tree t -> p
tamanio Void = 0
tamanio (Node t (Void) (Void)) = 1
tamanio (Node t (a) (b))  = tamanio (a) + tamanio (b)

altura Void = 0
altura (Node t (a)(b)) = 1 + max (altura a)(altura b)

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
