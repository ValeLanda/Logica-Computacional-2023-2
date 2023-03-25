module Practica02 where

--Ejercicio 1 
data Elemento = Fuego | Agua | Tierra | Aire | Luz | Oscuridad
  deriving (Show)

instance Enum Elemento where
  fromEnum Fuego = 0
  fromEnum Agua = 1
  fromEnum Tierra = 2
  fromEnum Aire = 3
  fromEnum Luz = 4
  fromEnum Oscuridad = 5

  toEnum 0 = Fuego
  toEnum 1 = Agua
  toEnum 2 = Tierra
  toEnum 3 = Aire
  toEnum 4 = Luz
  toEnum 5 = Oscuridad

  -- Definimos un orden  donde los elementos son ordenados
  -- según su debilidad en batallas elementales (el elemento que sigue es más
  -- débil que el anterior)
  succ Fuego = Agua
  succ Agua = Tierra
  succ Tierra = Aire
  succ Aire = Luz
  succ Luz = Oscuridad
  succ Oscuridad = error "No hay un elemento más débil que la Oscuridad"
  pred Agua = Fuego
  pred Tierra = Agua
  pred Aire = Tierra
  pred Luz = Aire
  pred Oscuridad = Luz
  pred Fuego = error "No hay un elemento más débil que el Fuego"
  
  

    data ArbolBin a = Hoja a | Nodo (ArbolBin a) (ArbolBin a) deriving (Show, Eq)

    tamanio :: ArbolBin a -> Int
    tamanio (Hoja a) = 1
    tamanio (Nodo a1 a2) = tamanio a1 + tamanio a2

    altura :: ArbolBin a -> Int 
    altura (Hoja a) = 0
    altura (Nodo a1 a2) = 1 + max (altura a1) (altura a2)

    ocurrencias :: (Eq a) => ArbolBin a -> a -> Int 
    ocurrencias (Hoja a) n 
                    | a == n = 1
                    | otherwise = 0
    ocurrencias (Nodo a1 a2) n = ocurrencias a1 n + ocurrencias a2 n
    
    listaHojas :: ArbolBin a -> [a]
    listaHojas (Hoja a) = [a]
    listaHojas (Nodo a1 a2) = listaHojas a1 ++ [] ++ listaHojas a2


    data DigBinario = Cero | Uno deriving (Show, Enum, Eq)
    type NumBinario  = [DigBinario]

    suma :: NumBinario -> NumBinario -> NumBinario
    suma n [] = n
    suma [] n = n
    suma n m = if last n == Cero || last m == Cero then suma (init n) (init m) ++ [sumaDig (last n) (last m)] else suma (suma (init n) [Uno]) (init m) ++ [Cero]

    sumaDig :: DigBinario -> DigBinario -> DigBinario
    sumaDig Cero Cero = Cero
    sumaDig n m = Uno
