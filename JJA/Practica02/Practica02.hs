--Tipos usando data

data Elemento = Agua | Tierra | Aire | Electrico | Fuego | Planta deriving(Enum, Show)

--Declaración de funciones de Enum
--fromEnum :: a -> Int

instance Enum Elemento where
fromEnum Agua = 1
fromEnum Tierra = 2
fromEnum Planta = 3
fromEnum Aire = 4
fromEnum Electrico = 5
fromEnum Fuego = 6

--El orden está dado por, llamemosle, "una relación en la naturaleza" con un enfoque
--de antecesores y subsecuentes
--Agua es el primero, por ser la base del resto
--Tierra es el segundo pues con este y con agua se dan más materias
--Planta es el tercero pues es el resultado de los dos anteriores
--Aire es el cuarto por la reaccion del ciclo de carbono, de CO2 a oxígeno
--Electrico es el quinto porque puede existir en tormentas u otros fenomenos meteorologicos
--Fuego es el sexto porque puede provenir a partir de un rayo

--Arboles

-- Definicion del arbol binario
data ArbolBin a = Hoja a | Nodo a (ArbolBin a) (ArbolBin a) deriving (Show,Eq)

-- Devuelve el numero de hojas de un arbol binario
tamanio :: ArbolBin a -> Int
tamanio (Hoja _) = 1
tamanio (Nodo _ i d ) = tamanio i + tamanio d

-- Devuelve la distancia a la que se encuentre la hoja mas lejana e la raiz
altura :: ArbolBin a -> Int
altura (Hoja _) = 0
altura (Nodo _ i d) = 1 + max (altura i) (altura d)

-- Dado un árbol binario, regresa una lista con la información de las hojas y nodos en inorden.
listaHojas :: ArbolBin a -> [a]
listaHojas (Hoja h) = [h]
listaHojas (Nodo h a b) = listaHojas a ++ [h] ++ listaHojas b

-- Dados dos árboles y un valor regresa un nuevo árbol teniendo como nodo raiz el valor dado, el primer arbol como subárbol izquierdo y el segundo arbol como subarbol derecho

unir :: ArbolBin a -> ArbolBin a -> a -> ArbolBin a
unir i d x = Nodo x i d

--Numeros Binarios

data DigBinario = Cero | Uno deriving (Show)

--Declaracion de NumBinario

data NumBinario = Null | Binario DigBinario NumBinario deriving (Show)

--Funcion suma de binarios
suma :: NumBinario -> NumBinario -> NumBinario
suma Null n = n --Caso por si el segundo vale 0
suma n Null = n --Caso por si el primero vale 0
suma (Binario d1 n1) (Binario d2 n2) =
  case (d1, d2) of
    (Cero, Cero) -> Binario Cero (suma n1 n2)
    (Cero, Uno) -> Binario Uno (suma n1 n2)
    (Uno, Cero) -> Binario Uno (suma n1 n2)
    (Uno, Uno) -> Binario Cero (suma (suma (Binario Uno Null) n1) n2)






