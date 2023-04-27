{-EJERCICIO 1-}
data Frutas = Cereza | Fresa | Mandarina | Toronja | Piña | Sandia deriving (Show,Ord,Eq)
instance Enum Frutas where 
    --Ordemos las Frutas de la más chica(0) a la más grande (5)
toEnum :: Int -> Frutas
toEnum 0 = Cereza
toEnum 1 = Fresa
toEnum 2 = Mandarina
toEnum 3 = Toronja
toEnum 4 = Piña
toEnum 5 = Sandia
fromEnum Cereza  = 0
fromEnum Fresa   = 1
fromEnum Mandarina = 2
fromEnum Toronja = 3
fromEnum Piña = 4
fromEnum Sandia = 5
--fromEnum _ = error "Inexistente."

{- EJERCICIO 2: arboles binarios -}
data ArbolBinario a = Hoja a | Node (ArbolBinario a) a (ArbolBinario a) | NodeHI (ArbolBinario a) a | NodeHD a (ArbolBinario a) deriving(Show)
{-Tamanio, calcula el total de hojas -}
tamanio :: ArbolBinario a -> Int
tamanio (Hoja _) = 1
tamanio (Node left a right)= (tamanio left) + (tamanio right)
tamanio (NodeHI left _ ) = tamanio left
tamanio (NodeHD _ right ) = tamanio right
{-Altura, distancia a la que se encuentra la hoja más lejana de la raíz -}
altura :: ArbolBinario a -> Int
altura (Hoja _) = 1
altura (Node left a right) = 1 + max (altura left) (altura right)
altura (NodeHI left _ ) = 1 + altura left
altura (NodeHD _ right ) = 1 + altura right
{-aplicaArbol, recibe una función y la aplica al árbol -}
aplicaArbol :: (a->b) -> ArbolBinario a -> ArbolBinario b
aplicaArbol f (Hoja a) = Hoja (f a)
aplicaArbol f (Node left a right) = Node (aplicaArbol f left) (f a) (aplicaArbol f right)
aplicaArbol f (NodeHI left a)= NodeHI (aplicaArbol f left) (f a)
aplicaArbol f (NodeHD a right)= NodeHD (f a) (aplicaArbol f right)
{-ocurrencias, calcula el numero de ocurrencias de un elemento en un árbol-} 
ocurrencias :: Eq a => a -> ArbolBinario a -> Int
ocurrencias c (Hoja a) = if (c==a) then 1 else 0
ocurrencias a (Node left c right)= if (c==a) then 1 + (ocurrencias a left) + (ocurrencias a right) else ((ocurrencias a left) + (ocurrencias a right))
ocurrencias a (NodeHI left c) = if(c==a) then 1+(ocurrencias a left) else (ocurrencias a left)
ocurrencias a (NodeHD c right)= if(c==a) then 1+(ocurrencias a right) else (ocurrencias a right)

{-EJERCICIO 3-}

{-Crea el tipo de dato digito binario, solo contiene ceros y unos-}
data DigBinario = Cero | Uno deriving(Eq, Ord, Show, Enum)
{-Crea el tipo de numeros binarios como una lista de digitos binarios-}
type NumBinario = [DigBinario]
{-Suma dos digitos binarios y devuelve el resultado sin importar el acarreo-}
sumaDigBinarios :: DigBinario -> DigBinario -> DigBinario
sumaDigBinarios Cero Cero = Cero
sumaDigBinarios Uno Uno = Cero
sumaDigBinarios _ _ = Uno
{-Suma tres Digitos Binarios y devuelve el acarreo que genera sin importar el resultado completo-}
sumaAcarreo :: DigBinario -> DigBinario -> DigBinario -> DigBinario
sumaAcarreo Uno Uno _ = Uno
sumaAcarreo _ Uno Uno = Uno
sumaAcarreo Uno _ Uno = Uno
sumaAcarreo _ _ _ = Cero
{-Suma dos numeros Binarios y devuelve el resultado, no importa que los numeros tengan distinta longitud.-}
sumaNumBinarios :: NumBinario -> NumBinario -> NumBinario
sumaNumBinarios xs ys = if (length xs) >= (length ys) then sumaNumBinariosAux Cero xs (regularTamanoAux (diferenciaLongitud xs ys) ys) else sumaNumBinariosAux Cero (regularTamanoAux (diferenciaLongitud xs ys) xs) ys
{-Funcion auxiliar de la suma de numeros binarios, necesita recibir aparte de los dos numeros binarios el acarreo.-}
sumaNumBinariosAux :: DigBinario -> NumBinario -> NumBinario -> NumBinario
sumaNumBinariosAux a [] [] = [a]
sumaNumBinariosAux a (xs) (ys) =sumaNumBinariosAux (sumaAcarreo a (last xs) (last ys)) (init xs) (init ys)++[sumaDigBinarios a (sumaDigBinarios (last xs) (last ys))]
{-Funcion auxiliar que agrega n numeros de Ceros a la izquierda de un numero binario, con n en los natures
recibe en entero y un NunBinario, regresa un NumBinario-}
regularTamanoAux :: Int -> NumBinario -> NumBinario
regularTamanoAux 0 xs = xs
regularTamanoAux a xs = [Cero]++regularTamanoAux (a-1) xs
{-Recibe dos numeros Binarios y devuelve la diferencia de longitud entre ambos números-}
diferenciaLongitud :: NumBinario -> NumBinario -> Int
diferenciaLongitud xs ys = abs ((length xs)-(length ys))
