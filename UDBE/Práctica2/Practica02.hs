{-
- Lógica computacional 2023-2
- Práctica 2
-}

module Practica02 where

    --Ejercicio 01
    {-Crea el tipo de dato Elemento 
    Define manualmente la relacion para la 
    clase Enum
    Establece un orden personalizado
    El tipo de dato debe de poder mostrarse
    -}


    --Creacion del tipo de dato elementos
    data Elemento = Agua | Tierra | Aire | Fuego | Metal | Electrico | Diamante | Hielo  deriving(Eq, Show)

    --Orden personalizado de Elementos
    instance Enum Elemento where  
        toEnum 1 = Agua 
        toEnum 2 = Tierra 
        toEnum 3 = Aire
        toEnum 4 = Fuego
        toEnum 5 = Metal
        toEnum 6 = Electrico
        toEnum 7 = Diamante
        toEnum 8 = Hielo

        fromEnum Agua = 1
        fromEnum Tierra = 2
        fromEnum Aire = 3
        fromEnum Fuego = 4
        fromEnum Metal = 5
        fromEnum Electrico = 6
        fromEnum Diamante = 7
        fromEnum Hielo = 8

    --Ejercicio 02
    {-ArbolBin. árbol binario con infromacion en 
      las hojas y ne los nodos internos. 
      Elige a lo más 4.
    -}


    -- La estructura solo permite crear árboles binarios completos, es decir, donde cada nodo tiene 0 o 2 hijos. 
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
    
    --Ejercicio 3
    {-Crea el tipo de dato Digbinario, el cual
      unicamente debe contener al Cero y al
      Uno. A partir de DigBinario crea el tipo
      de dato NumBinario.
    -}

    --Creación del tipo de dato Digbinario
    data Digbinario = Cero | Uno

    --Creación del tipo de dato Numbinario
    data Numbinario = Numbinario [Digbinario]

    --Funcion suma que recibe un Numbinario y regresa la suma binaria
    sumNumbinario :: Numbinario -> Numbinario -> Numbinario
    sumNumbinario (Numbinario bs1) (Numbinario bs2) = Numbinario (aBinario bs1 bs2)
        where
        aBinario [] bs2 = bs2
        aBinario bs1 [] = bs1
        aBinario (b1:bs1) (b2:bs2) = case (b1, b2) of
            (Cero, Cero) -> Cero : aBinario bs1 bs2
            (Uno, Cero) -> Uno : aBinario bs1 bs2
            (Cero, Uno) -> Uno : aBinario bs1 bs2
            (Uno, Uno) -> Cero : aBinario (aBinario [Uno] bs1) bs2

-----------------------------------------------------------
------------------       PRUEBAS       -------------------- 
-----------------------------------------------------------

    tree1 :: ArbolBin Int
    tree1 = Nodo (Nodo (Hoja 4) 2 (Hoja 3)) 1 (Hoja 5)

    tree2 :: ArbolBin Int
    tree2 = Nodo (Hoja 3) 2 (Nodo (Hoja 4) 3 (Hoja 7))

    tree3 :: ArbolBin Int
    tree3 = Hoja 6









