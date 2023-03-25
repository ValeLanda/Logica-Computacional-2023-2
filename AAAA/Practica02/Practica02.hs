data Elemento = Asahelio | Arturano | Arsenico | Alaneon | Quirozono |Johnson deriving(Eq, Show)

instance Enum Elemento where
  toEnum 6 = Johnson
  toEnum 5 = Quirozono
  toEnum 4 = Alaneon
  toEnum 3 = Arsenico
  toEnum 2 = Asahelio
  toEnum 1 = Arturano

  fromEnum Johnson = 6
  fromEnum Quirozono = 5
  fromEnum Alaneon = 4
  fromEnum Arsenico = 3
  fromEnum Asahelio = 2
  fromEnum Arturano = 1

-- Árbol binario con información en las hojas y en los nodos internos
data ArbolBin a = Hoja a | Nodo a (ArbolBin a) (ArbolBin a) deriving (Show, Eq)

-- Indica el número de hojas en un árbol binario.
-- Recibe un árbol binario y regresa el número de hojas.
tamanio :: ArbolBin a -> Int
tamanio (Hoja _) = 1
tamanio (Nodo _ izquierda derecha) = tamanio izquierda + tamanio derecha

-- Indica la distancia a la que se encuentra la hoja más lejana de la raíz.
-- Recibe un árbol binario y devuelve la distancia a la que se encuentra la hoja
-- más lejana de la raíz.
-- Consideramos la altura de una hoja como 0, ya que si el árbol consta únicamente
-- de esa hoja, la distancia a sí misma es 0.
altura :: ArbolBin a -> Int
altura (Hoja _) = 0
altura (Nodo _ izquierda derecha) = 1 + max (altura izquierda) (altura derecha)

-- Indica el número de apariciones de un valor en un árbol binario.
-- Recibe un elemento y un árbol binario y devuelve el número
-- de apariciones del elemento en el árbol.
ocurrencias :: Eq a => a -> ArbolBin a -> Int
ocurrencias x (Hoja a)
  | a == x = 1
  | otherwise = 0
ocurrencias x (Nodo y izquierda derecha)
 | x == y = 1 + ocs
 | otherwise = ocs
 where ocs = (ocurrencias x izquierda) + (ocurrencias x derecha)

-- Aplica una función a los elementos de un árbol binario.
-- Recibe una función y un árbol binario y devuelve un árbol binario
-- obtenido al aplicar la función a cada nodo.
aplicaArbol :: (a -> b) -> ArbolBin a -> ArbolBin b
aplicaArbol f (Hoja a) = Hoja $ f a
aplicaArbol f (Nodo x izquierda derecha) = (Nodo (f x) (aplicaArbol f izquierda) (aplicaArbol f derecha))

-- Une dos árboles binarios con un nodo raíz dada.
-- Recibe dos árboles binarios y un valor y devuelve un
-- nuevo árbol teniendo como nodo raíz el valor y el primer
-- árbol como subárbol izquierdo y el segundo como
-- subárbol derecho.
unir :: ArbolBin a -> ArbolBin a -> a -> ArbolBin a
unir izq der a = Nodo a izq der

{-|
  Tipo de dato de dígito binario
-}
data DigBinario = Uno | Cero deriving(Eq)

instance Show DigBinario where
      show Cero = "0"
      show Uno = "1"

{-|
 Tipo de dato número binario creado a partir de dígitos binarios
-}
type NumBinario = [DigBinario]


{-|
  Función principal. Suma dos números binarios
-}
suma :: NumBinario -> NumBinario -> NumBinario
suma [] [] = []
suma xs [] = xs
suma [] ys = ys
suma (x:xs) (y:ys)
     | length (x:xs) < length (y:ys) = suma(replicate (length (y:ys) - length (x:xs)) Cero ++ (x:xs)) (y:ys)
     | length (y:ys) < length (x:xs) = suma(replicate (length (x:xs) - length (y:ys)) Cero ++ (y:ys)) (x:xs)
     | otherwise = reverse(sumaAuxiliar Cero (reverse (x:xs)) (reverse (y:ys)))


{-|
  Función auxiliar que suma números binarios y los suma dígito por
  dígito tomando en cuenta el acarreo
-}
sumaAuxiliar :: DigBinario -> NumBinario -> NumBinario -> NumBinario
sumaAuxiliar Cero [] [] = []
sumaAuxiliar Uno [] [] = [Uno]
sumaAuxiliar b (x:xs) (y:ys) = [sumaParcial (sumaParcial x y) b] ++ sumaAuxiliar (acarreo b x y) xs ys

{-|
  Función auxiliar que suma dos dígitos binarios
-}
sumaParcial :: DigBinario -> DigBinario -> DigBinario
sumaParcial Cero Uno = Uno
sumaParcial Uno Cero = Uno
sumaParcial _ _ = Cero

{-|
  Función auxiliar que obtiene el acarreo al sumar tres dígitos binarios
-}
acarreo :: DigBinario -> DigBinario -> DigBinario -> DigBinario
acarreo Cero Cero _ = Cero
acarreo Cero _ Cero = Cero
acarreo _ Cero Cero = Cero
acarreo _ _ _ = Uno
