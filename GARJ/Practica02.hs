-- Ejercicio 1. Tipo de dato Elemento, con los elementos ordenados en orden alfabetico
data Elemento = Agua | Aire | Éter | Fuego | Planta | Tierra deriving(Eq, Show)

--Declaramos la clase Enum, asignando cada elemento a su respectiva posicion
instance Enum Elemento where
    toEnum 0 = Agua
    toEnum 1 = Aire
    toEnum 2 = Éter
    toEnum 3 = Fuego
    toEnum 4 = Planta
    toEnum 5 = Tierra

    fromEnum Agua = 0
    fromEnum Aire = 1
    fromEnum Éter = 2
    fromEnum Fuego = 3
    fromEnum Planta = 4
    fromEnum Tierra = 5


-- Ejercicio 2. Arbol binario con informacion en las hojas y en los nodos internos.
data ArbolBinario a = Hoja a | NodoConHI (ArbolBinario a) a | NodoConHD a (ArbolBinario a) | Nodo (ArbolBinario a) a (ArbolBinario a) deriving(Show, Eq)

{-
    Recibe un arbol binario.
    Devuelve la cantidad de hojas que tiene el arbol binario.
-}
tamanio (Hoja a) = 0
tamanio (NodoConHI (Hoja a) b) = 1
tamanio (NodoConHD b (Hoja a)) = 1
tamanio (Nodo (Hoja a) b (Hoja c)) = 2
tamanio (NodoConHI (a) b) = tamanio a
tamanio (NodoConHD b (c)) = tamanio c
tamanio (Nodo (a) b (c)) = (tamanio a) + (tamanio c)

{-
    Recibe un arbol binario.
    Devuelve la distancia a la que se encuentra la hoja mas lejana de la raiz.
-}
altura (Hoja a) = 0
altura (NodoConHI (Hoja a) b) = 1
altura (NodoConHD b (Hoja a)) = 1
altura (Nodo (Hoja a) b (Hoja c)) = 1
altura (NodoConHI (a) b) = 1 + (altura a)
altura (NodoConHD b (a)) = 1 + (altura a)
altura (Nodo (a) b (c)) = if tamanio a > tamanio c then 1 + (altura a) else 1 + (altura c)

{-
    Recibe un arbol binario.
    Devuelve una lista con los elementos del arbol haciendo un recorrido inorden.
-}
listaHojas (Hoja a) = [a]
listaHojas (NodoConHI (a) b) = listaHojas(a) ++ [b]
listaHojas (NodoConHD b (c)) = [b] ++ listaHojas(c)
listaHojas (Nodo (a) b (c)) = listaHojas(a) ++ [b] ++ listaHojas(c)

{-
    Recibe dos arboles binarios y un valor del mismo tipo que los arboles.
    Devuelve un arbol con el valor recibido como raiz del nuevo arbol, como hijo izquierdo 
    de la raiz el primer arbol y el segundo arbol como hijo derecho de la raiz del nuevo arbol.
-}
unir (Hoja a) (Hoja b) n = (Nodo (Hoja a) n (Hoja b))
unir (NodoConHI (a) b) (Hoja c) n = (Nodo (NodoConHI (a) b) n (Hoja c))
unir (NodoConHI (a) b) (NodoConHI (c) d) n = (Nodo (NodoConHI (a) b) n (NodoConHI (c) d))
unir (NodoConHI (a) b) (NodoConHD c (d)) n = (Nodo (NodoConHI (a) b) n (NodoConHD c (d)))
unir (NodoConHI (a) b) (Nodo (c) d (e)) n = (Nodo (NodoConHI (a) b) n (Nodo (c) d (e)))
unir (Hoja c) (NodoConHI (a) b) n = (Nodo (Hoja c) n (NodoConHI (a) b))
unir (NodoConHD c (d)) (NodoConHI (a) b) n = (Nodo (NodoConHD c (d)) n (NodoConHI (a) b))
unir (Nodo (c) d (e)) (NodoConHI (a) b) n = (Nodo (Nodo (c) d (e)) n (NodoConHI (a) b))
unir (NodoConHD a (b)) (Hoja c) n = (Nodo (NodoConHD a (b)) n (Hoja c))
unir (NodoConHD a (b)) (NodoConHD c (d)) n = (Nodo (NodoConHD a (b)) n (NodoConHD c (d)))
unir (NodoConHD a (b)) (Nodo (c) d (e)) n = (Nodo (NodoConHD a (b)) n (Nodo (c) d (e)))
unir (Hoja c) (NodoConHD a (b)) n = (Nodo (Hoja c) n (NodoConHD a (b)))
unir (Nodo (c) d (e)) (NodoConHD a (b)) n = (Nodo (Nodo (c) d (e)) n (NodoConHD a (b)))
unir (Nodo (a) b (c)) (Hoja d) n = (Nodo (Nodo (a) b (c)) n (Hoja d))
unir (Hoja d) (Nodo (a) b (c)) n = (Nodo (Hoja d) n (Nodo (a) b (c)))
unir (Nodo (a) b (c)) (Nodo (d) e (f)) n = (Nodo (Nodo (a) b (c)) n (Nodo (d) e (f)))


--Ejercicio 3

--Definimos el tipo de dato Digito binario, que solo contiene al Uno y al Cero
data DigBinario = Cero | Uno deriving (Show, Eq)

--Definimos el tipo de dato, Numero Binario, que en escencia es una lista de Digitos Binarios
type NumBinario = [DigBinario]

--Función que invierte un númeroBinario
reversaBinaria :: NumBinario -> NumBinario
reversaBinaria [] = []
reversaBinaria (x:xs) = reversaBinaria xs ++ [x]

{-Esta función es la primera "capa" de nuestra función, lo que hace es basicamente invertir
Las entradas de los numeros binarios, pues nuestra función comenzará por la cabeza es decir
por el bit de mayor peso, y lo que queremos es que comience desde el bit menos significativo
a su vez la salida de la función está invertida, pues nuestra función va metiendo los valores
conforme va efectuando las operaciones, dejando el resultado invertido, pues se empieza desde
la cabeza y los valores poco a poco se van metiendo, dejando el bit menos significativo hasta 
el final, una vez invertidos ahora si comienza con la operación-}
sumaBinaria :: NumBinario -> NumBinario -> NumBinario
sumaBinaria xs ys = reversaBinaria (sumaBinaria' (reversaBinaria xs) (reversaBinaria ys))   

{-Esta es nuestra función "Principal", pues tenemos los casos para las sumas de un solo
digito binario, notemos que la recursión termina cuando ambas o una de los 2 listas es vacía
así recorriendo ambas listas hasta efectuar la opreción, al final se devuelve el NumBinario 
que da como resultado
-}
sumaBinaria' :: NumBinario -> NumBinario -> NumBinario
sumaBinaria' [] [] = []
sumaBinaria' [] ys = ys
sumaBinaria' xs [] = xs
sumaBinaria' (x:xs) (y:ys) = case (x, y) of
    (Cero, Cero) -> Cero : sumaBinaria' xs ys
    (Cero, Uno) -> Uno : sumaBinaria' xs ys
    (Uno, Cero) -> Uno : sumaBinaria' xs ys
    (Uno, Uno) -> Cero : sumaBinaria' xs (sumaBinaria' [Uno] ys)  