{-
- Lógica computacional 2023-2
- Práctica 2
-}


module Arboles where

    -- La estructura permite Void para representar el arbol vacìo y para
    -- facilitar su escritura y hacer más legibles los árboles.
    data ArbolBin a = Hoja a | Nodo (ArbolBin a) a (ArbolBin a) | NodoConHI (ArbolBin a) a | NodoConHD a (ArbolBin a) deriving (Show, Eq)

    -- Función recursiva que cuenta primero el nodo raíz y después cuenta los subárboles con el mismo proceso.
    tamanio :: ArbolBin a -> Int
    tamanio (Hoja a) = 1
    tamanio (Nodo (hijoI) a (hijoD)) = 1 + tamanio hijoI + tamanio hijoD

    -- La función tamanio utiliza la función auxiliar max para conocer el máximo de las alturas de los subárboles y asì 
    -- saber la altura total del árbol.
    altura :: ArbolBin a -> Int
    altura (Hoja a) = 1
    altura (Nodo (hijoI) a (hijoD)) = 1 + max (altura hijoI)(altura hijoD)

    -- Esta función recibe un árbol y una función y regresa el árbol con cada elemento evaluado con esa función.
    aplicaArbol :: (a -> a) -> ArbolBin a -> ArbolBin a
    aplicaArbol funcion (Hoja a) = Hoja (funcion a)
    aplicaArbol funcion (Nodo (hijoI) a (hijoD)) = (Nodo (aplicaArbol funcion hijoI) (funcion a) (aplicaArbol funcion hijoD))

    -- En el recorrido inorden primero se visita el subárbol izq, luego la raíz y al final el subárbol derecho.
    -- Esta función regresa una lista con los elementos en los nodos del árbol en inorden.
    listaHojas :: ArbolBin a -> [a]
    listaHojas (Hoja a) = [a]
    listaHojas (Nodo (hijoI) a (hijoD)) = listaHojas hijoI ++ [a] ++ listaHojas hijoD
    


-----------------------------------------------------------
------------------       PRUEBAS       -------------------- 
-----------------------------------------------------------

    tree1 :: ArbolBin Int
    tree1 = Nodo (Nodo (Hoja 4) 2 (Hoja 3)) 1 (Hoja 5)

    tree2 :: ArbolBin Int
    tree2 = Nodo (Hoja 3) 2 (Nodo (Hoja 4) 3 (Hoja 7))

<<<<<<< HEAD
    tree3 :: ArbolBin Int
    tree3 = Hoja 6
=======
    tree3 :: ArbolB Int
    tree3 = Nodo 6 (Void)(Void)

    tree4 :: ArbolB Int
    tree4 = Hoja 99

    tree5 :: ArbolB Int
    tree5 = unir tree1 tree6 4

    tree6 :: ArbolB Int
    tree6 = Void





