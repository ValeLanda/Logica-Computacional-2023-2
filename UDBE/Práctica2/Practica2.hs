{-
- Lógica computacional 2023-2
- Práctica 2
-}


module Arboles where

    data ArbolB a = Void | Hoja a | Nodo a (ArbolB a) (ArbolB a) deriving (Show, Eq)


    tamanio :: ArbolB a -> Int
    tamanio Void = 0
    tamanio (Nodo a (hijoI) (hijoD)) = 1 + tamanio hijoI + tamanio hijoD

    altura :: ArbolB a -> Int
    altura Void = 0
    altura (Nodo a (hijoI) (hijoD)) = 1 + max (altura hijoI)(altura hijoD)

    aplicaArbol :: (a -> a) -> ArbolB a -> ArbolB a
    aplicaArbol funcion Void = Void
    aplicaArbol funcion (Hoja a) = Hoja (funcion a)
    aplicaArbol funcion (Nodo a (hijoI)(hijoD)) = (Nodo (funcion a) (aplicaArbol funcion hijoI) (aplicaArbol funcion hijoD))

    listaHojas :: ArbolB a -> [a]
    listaHojas Void = []
    listaHojas (Hoja a) = [a]
    listaHojas (Nodo a (hijoI)(hijoD)) = listaHojas hijoI ++ [a] ++ listaHojas hijoD



-----------------------------------------------------------
------------------       PRUEBAS       -------------------- 
-----------------------------------------------------------

    tree1 :: ArbolB Int
    tree1 = Nodo 1 (Nodo 2(Hoja 4)(Void))(Hoja 5)

    tree2 :: ArbolB Int
    tree2 = Nodo 2 (Void)(Nodo 3 (Hoja 4)(Hoja 7))

    tree3 :: ArbolB Int
    tree3 = Nodo 6 (Void)(Void)

    tree4 :: ArbolB Int
    tree4 = Hoja 99