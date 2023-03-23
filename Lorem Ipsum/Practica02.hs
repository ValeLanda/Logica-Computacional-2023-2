module Practica02 where

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
