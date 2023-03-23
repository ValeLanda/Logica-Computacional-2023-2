-- | Practica 02
-- | Integrantes
-- | Sanchez Correa Diego Sebastián
-- | Zhang Liu Xin Wen
module Practica2 where


{-
Tipo de datos Elemento deriving Enum
El orden va de Lunes a Domingo , enumerados del 0 al 6.
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
data Tree t = Void | Node t (Tree t) (Tree t) deriving (Show)

{- | tamanio
Recibe un arbol y regresa la cantidad de hojas que contiene.
-}
tamanio :: Num p => Tree t -> p
tamanio Void = 0
tamanio (Node t (Void) (Void)) = 1
tamanio (Node t (a) (b))  = tamanio (a) + tamanio (b)

{- | altura 
Recibe un arbol y regresa la altura de este contando la raiz.
-}
altura :: (Num p, Ord p) => Tree t -> p
altura Void = 0
altura (Node t (a)(b)) = 1 + max (altura a)(altura b)
                   
{- | ocurrecias
Recibe un elemento y un arbol y recibe el numero de ocurrencias de este en el arbol.
-}
ocurrencias :: (Num a, Eq t) => t -> Tree t -> a
ocurrencias _ Void = 0
ocurrencias x (Node t (a) (b)) = if x == t
                                 then 1 + ocurrencias x a + ocurrencias x b
                                 else  ocurrencias x a + ocurrencias x b

{- | aplicaArbol 
Recibe una funcion y un arbol y aplica dicha funcion a cada nodo del arbol.
-}
aplicaArbol :: (t1 -> t2) -> Tree t1 -> Tree t2
aplicaArbol _ Void = Void
aplicaArbol f (Node t (a) (b)) = Node (f t)
                                 (aplicaArbol f a)
                                 (aplicaArbol f b)

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

