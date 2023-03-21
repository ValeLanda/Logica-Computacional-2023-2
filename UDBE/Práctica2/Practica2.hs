{-
- Lógica computacional 2023-2
- Práctica 2
-}


module Arboles where

    data ArbolB a = Void | Nodo a (ArbolB a) (ArbolB a) deriving (Show, Eq)



    tamanio :: ArbolB a -> Int
    tamanio Void = 0
    tamanio (Nodo a (hijoI)(hijoD)) = 1 + (tamanio hijoI) + (tamanio hijoD)

    altura :: ArbolB a -> Int
    altura Void = 0
    altura (Nodo a (Void)(Void)) = 1
    altura (Nodo a (hijoI)(hijoD)) = 1 + maximum(altura hijoI, altura hijoD)


-----------------------------------------------------------
------------------       PRUEBAS       -------------------- 
-----------------------------------------------------------

    tree1 :: ArbolB Int
    tree1 = Nodo 1(Nodo 2(Nodo 4 (Void)(Void))(Void))(Nodo 5(Void)(Void))
