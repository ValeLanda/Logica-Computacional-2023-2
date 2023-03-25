-- Practica 02

-- Equipo KFP
-- Jose Camilo Garcia Ponce 319210536

{-|
    Tipo de dato para representar elementos
    Los elementos se pueden comparar entre si, mostrar y enumerar
-}
data Elementos = Planta | Fuego | Agua | Hielo | Siniestro | Dragon

{-|
    Forma de mostrar los elementos
-}
instance Show Elementos where
    show Planta = "Planta"
    show Fuego = "Fuego"
    show Agua = "Agua"
    show Hielo = "Hielo"
    show Siniestro = "Siniestro"
    show Dragon = "Dragon"

{-|
    Forma de comparar si los elementos son iguales
-}
instance Eq Elementos where
    Planta == Planta = True
    Fuego == Fuego = True
    Agua == Agua = True
    Hielo == Hielo = True
    Siniestro == Siniestro = True
    Dragon == Dragon = True
    _ == _ = False

{-|
    Forma de comparar si un elemento es menor o igual que otro
    La forma de comparar es la siguiente:
    Planta <= Fuego <= Agua <= Hielo <= Siniestro <= Dragon
-}
instance Ord Elementos where
    Planta <= Planta = True
    Planta <= Fuego = True
    Planta <= Agua = True
    Planta <= Hielo = True
    Planta <= Siniestro = True
    Planta <= Dragon = True
    Fuego <= Fuego = True
    Fuego <= Agua = True
    Fuego <= Hielo = True
    Fuego <= Siniestro = True
    Fuego <= Dragon = True
    Agua <= Agua = True
    Agua <= Hielo = True
    Agua <= Siniestro = True
    Agua <= Dragon = True
    Hielo <= Hielo = True
    Hielo <= Siniestro = True
    Hielo <= Dragon = True
    Siniestro <= Siniestro = True
    Siniestro <= Dragon = True
    Dragon <= Dragon = True
    _ <= _ = False

{-|
    Forma de enumerar los elementos
-}
instance Enum Elementos where
    toEnum 0 = Planta
    toEnum 1 = Fuego
    toEnum 2 = Agua
    toEnum 3 = Hielo
    toEnum 4 = Siniestro
    toEnum 5 = Dragon
    toEnum _ = error "No existe el elemento"
    fromEnum Planta = 0
    fromEnum Fuego = 1
    fromEnum Agua = 2
    fromEnum Hielo = 3
    fromEnum Siniestro = 4
    fromEnum Dragon = 5


{-|
    Tipo de dato para representar un arbol binario (completo?)
    Los arboles binarios se pueden mostrar
-}
data ArbolBin a = Hoja a | Nodo a (ArbolBin a) (ArbolBin a) | NodoConHI a (ArbolBin a) | NodoConHD a (ArbolBin a)

{-|
    Forma de mostrar los arboles binarios
-}
instance Show a => Show (ArbolBin a) where
    show (Hoja x) = "Hoja " ++ show x
    show (Nodo x izq der) = "Nodo " ++ show x ++ " (" ++ show izq ++ ") (" ++ show der ++ ")"
    show (NodoConHI x izq) = "NodoConHI " ++ show x ++ " (" ++ show izq ++ ")"
    show (NodoConHD x der) = "NodoConHD " ++ show x ++ " (" ++ show der ++ ")"

{-|
  La funcion tamanio nos dice el numero de hojas de un arbol binario
  Toma un argumento de tipo 'ArbolBin a', el arbol binario a evaluar
  Retorna un valor de tipo 'Int', el tamanio del arbol binario
  La funcion tiene un caso base, la hoja, que regresa 1
  En los casos recursivos se suman los tamanios de los hijos que tenga el nodo
-}
tamanio :: ArbolBin a -> Int
tamanio (Hoja _) = 1
tamanio (Nodo _ izq der) = tamanio izq + tamanio der
tamanio (NodoConHI _ izq) = tamanio izq
tamanio (NodoConHD _ der) = tamanio der

{-|
  La funcion altura nos dice la altura de un arbol binario
  Toma un argumento de tipo 'ArbolBin a', el arbol binario a evaluar
  Retorna un valor de tipo 'Int', la altura del arbol binario
  La funcion tiene un caso base, la hoja, que regresa 1
  En los casos recursivos se toma el maximo entre las alturas de los hijos que tenga el nodo y se le suma 1
-}
altura :: ArbolBin a -> Int
altura (Hoja _) = 1
altura (Nodo _ izq der) = 1 + max (altura izq) (altura der)
altura (NodoConHI _ izq) = 1 + altura izq
altura (NodoConHD _ der) = 1 + altura der

{-|
  La funcion aplicaArbol aplica una funcion a todos los elementos de un arbol binario
  Toma un argumento de tipo '(a -> b)', la funcion a aplicar y un argumento de tipo 'ArbolBin a', el arbol binario
  Retorna un valor de tipo 'ArbolBin b', el arbol binario con los elementos modificados
  La funcion tiene un caso base, la hoja, que aplica la funcion al elemento del nodo
  En los casos recursivos se aplica la funcion a los elementos de los hijos que tenga el nodo y se crea un nuevo nodo con el elemento modificado y los hijos modificados
-}
aplicaArbol :: (a -> b) -> ArbolBin a -> ArbolBin b
aplicaArbol f (Hoja x) = Hoja (f x)
aplicaArbol f (Nodo x izq der) = Nodo (f x) (aplicaArbol f izq) (aplicaArbol f der)
aplicaArbol f (NodoConHI x izq) = NodoConHI (f x) (aplicaArbol f izq)
aplicaArbol f (NodoConHD x der) = NodoConHD (f x) (aplicaArbol f der)

{-|
  La funcion unir une dos arboles binarios en un solo arbol binario
  Toma dos argumentos de tipo 'ArbolBin a', los dos arboles binarios a unir y un elemento de tipo 'a', el elemento que se pondra en el nodo raiz
  Retorna un valor de tipo 'ArbolBin a', el arbol binario resultante de unir los dos arboles binarios
  Se crea un nuevo nodo con el elemento dado y los dos arboles binarios dados se vuelven los subarboles izquierdo y derecho del nuevo nodo
-}
unir :: ArbolBin a -> ArbolBin a -> a -> ArbolBin a
unir izq der x = Nodo x izq der


{-|
    Tipo de dato para digitos binarios
    Los digitos binarios se pueden mostrar
-}
data DigBinario = Cero | Uno

{-|
    Forma de mostrar los digitos binarios
-}
instance Show DigBinario where
    show Cero = "0"
    show Uno = "1"

{-|
  La funcion sumaCompleta suma dos digitos binarios y un digito binario de acarreo
  Toma tres argumentos de tipo 'DigBinario', los dos digitos binarios a sumar y el digito binario de acarreo
  Retorna un valor de tipo '(DigBinario, DigBinario)', el digito binario resultante de la suma y el digito binario de acarreo resultante de la suma
  La funcion 8 casos, cada uno representa una combinacion de los tres digitos binarios
-}
sumaCompleta :: DigBinario -> DigBinario -> DigBinario -> (DigBinario, DigBinario)
sumaCompleta Cero Cero Cero = (Cero, Cero)
sumaCompleta Cero Cero Uno = (Uno, Cero)
sumaCompleta Cero Uno Cero = (Uno, Cero)
sumaCompleta Cero Uno Uno = (Cero, Uno)
sumaCompleta Uno Cero Cero = (Uno, Cero)
sumaCompleta Uno Cero Uno = (Cero, Uno)
sumaCompleta Uno Uno Cero = (Cero, Uno)
sumaCompleta Uno Uno Uno = (Uno, Uno)

{-|
    Tipo de dato para representar numeros binarios
-}
type NumBinario = [DigBinario]

{-|
  La funcion suma suma dos numeros binarios
  Toma dos argumentos de tipo 'NumBinario', los dos numeros binarios a sumar
  Retorna un valor de tipo 'NumBinario', el numero binario resultante de la suma
  La funcion tiene tres casos base, los dos numeros binarios vacios, que regresa el mismo numero binario vacio, y un numero binario vacio y un numero binario no vacio, que regresa el numero binario no vacio
  En el caso recursivo, se invoca la funcion sumaAux, que recibe los dos numeros binarios dados, los invierte y los suma, y el digito binario de acarreo Cero
-}
suma :: NumBinario -> NumBinario -> NumBinario
suma [] [] = []
suma [] (y:ys) = (y:ys)
suma (x:xs) [] = (x:xs)
suma (x:xs) (y:ys) = (reverse (sumaAux (reverse (x:xs)) (reverse (y:ys)) Cero))

{-|
  La funcion sumaAux suma dos numeros binarios y un digito binario de acarreo
  Toma tres argumentos de tipo 'NumBinario', los dos numeros binarios a sumar y el digito binario de acarreo
  Retorna un valor de tipo 'NumBinario', el numero binario resultante de la suma
  La funcion tiene dos casos base, cuando ambos numeros binarios son vacios, en el primer caso tiene acarreo Cero y regresa el mismo numero binario vacio, y en el segundo caso tiene acarreo Uno y regresa el numero binario [Uno]
  En el caso recursivo, se invoca la funcion sumaCompleta, que recibe los dos primeros digitos binarios de los dos numeros binarios dados y el digito binario de acarreo, y se agrega el digito binario resultante de la suma del resto de la lista
-}
sumaAux :: [DigBinario] -> [DigBinario] -> DigBinario -> [DigBinario]
sumaAux [] [] Cero = []
sumaAux [] [] Uno = [Uno]
sumaAux [] (y:ys) c = (fst (sumaCompleta Cero y c)) : sumaAux [] ys (snd (sumaCompleta Cero y c))
sumaAux (x:xs) [] c = (fst (sumaCompleta x Cero c)) : sumaAux xs [] (snd (sumaCompleta x Cero c))
sumaAux (x:xs) (y:ys) c = (fst (sumaCompleta x y c)) : sumaAux xs ys (snd (sumaCompleta x y c))
