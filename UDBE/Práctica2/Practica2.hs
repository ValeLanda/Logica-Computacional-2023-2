{-
- Lógica computacional 2023-2
- Práctica 2
-}


module Arboles where

    -- La estructura permite Void para representar el arbol vacìo y para
    -- facilitar su escritura y hacer más legibles los árboles.
    data ArbolB a = Void | Hoja a | Nodo a (ArbolB a) (ArbolB a) deriving (Show, Eq)

    -- Función recursiva que cuenta primero el nodo raíz y después cuenta los subárboles con el mismo proceso.
    tamanio :: ArbolB a -> Int
    tamanio Void = 0
    tamanio (Nodo a (hijoI) (hijoD)) = 1 + tamanio hijoI + tamanio hijoD

    -- La función tamanio utiliza la función auxiliar max para conocer el máximo de las alturas de los subárboles y asì 
    -- saber la altura total del árbol.
    altura :: ArbolB a -> Int
    altura Void = 0
    altura (Nodo a (hijoI) (hijoD)) = 1 + max (altura hijoI)(altura hijoD)

    -- Esta función recibe un árbol y una función y regresa el árbol con cada elemento evaluado con esa función.
    aplicaArbol :: (a -> a) -> ArbolB a -> ArbolB a
    aplicaArbol funcion Void = Void
    aplicaArbol funcion (Hoja a) = Hoja (funcion a)
    aplicaArbol funcion (Nodo a (hijoI)(hijoD)) = (Nodo (funcion a) (aplicaArbol funcion hijoI) (aplicaArbol funcion hijoD))

    -- En el recorrido inorden primero se visita el subárbol izq, luego la raíz y al final el subárbol derecho.
    -- Esta función regresa una lista con los elementos en los nodos del árbol en inorden.
    listaHojas :: ArbolB a -> [a]
    listaHojas Void = []
    listaHojas (Hoja a) = [a]
    listaHojas (Nodo a (hijoI)(hijoD)) = listaHojas hijoI ++ [a] ++ listaHojas hijoD
    
    --Recibe dos árboles y un elemento a, después une los árboles y toma como raíz el elemento que le pasamos. 
    unir :: ArbolB a -> ArbolB a -> a -> ArbolB a
    unir Void Void a = Hoja a
    unir hi hd c = Nodo c (hi) (hd) 


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

    tree5 :: ArbolB Int
    tree5 = unir tree1 tree6 4

    tree6 :: ArbolB Int
    tree6 = Void