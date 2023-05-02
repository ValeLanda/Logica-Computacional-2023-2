--Practica 3

-- Tipos expresiones aritméticas y lógicas

data BExp = V | F | Or BExp BExp deriving Show

eval :: Expr -> Int
eval (Lit x) = x

evalB :: BExp -> Bool
evalB V = True
evalB F = False

{- EJERCICIO 1: -}

--esVocal, funcion que dado un caracter regresa True si es vocal, False en caso contrario.
esVocal :: Char -> Bool
esVocal c = c `elem` ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U']
--eliminarVocales, dada una cadena elimine todas las vocales de la misma y devuelva la cadena resultante.
eliminarVocales :: String -> String
eliminarVocales "" = ""
eliminarVocales (x:xs) = if esVocal(x) then eliminarVocales(xs) else x:eliminarVocales(xs)

{- EJERCICIO 2: -}
--Crea una función llamada cifrar, que reciba una cadena de texto y un número, y que aplique un cifrado César.
cifrar :: String -> Int -> String
cifrar texto n = [desplazar c n | c <- texto]

--La función auxiliar "desplazar" verifica si el carácter es una letra minúscula, mayúscula o un carácter especial. 
desplazar :: Char -> Int -> Char
desplazar c n
    | c >= 'a' && c <= 'z' = rotar 'a' c n
    | c >= 'A' && c <= 'Z' = rotar 'A' c n
    | otherwise = c

--La función auxiliar "rotar" toma la letra base por ejemplo ('a' o 'A'), y la letra que se va a desplazar, y así es como nos devuelve la letra desplazada por el int dado.
rotar :: Char -> Char -> Int -> Char
rotar base c n = toEnum $ ((fromEnum c - fromEnum base + n) `mod` 26) + fromEnum base:

--EJEMPLOS DE USO Y FUNCIONAMIENTO. 
--El cifrado César se clasifica como un cifrado por sustitución en el que el alfabeto en el texto plano se desplaza por un número fijo en el alfabeto.
--Podemos usar este tipo de cifrado para encriptar, esto en el ambito computacional, algunos ejemplos de cifrado cesar son:
--cifrar "Hola Mundo" 3 -> "krod pxqgr"
--cifrar "La vida es bella" 5 -> "Qf anif jx gjqqf"

{- EJERCICIO 3: -}

--Tipo de dato ExpB, que contiene literales booleanas, Equal, Not, y And.
-- Equal compara los dos elementos booleano y si son iguales regresa True.
-- Not regresa el booleano contrario al valor que se le proporciona.
-- And regresa un booleano resultante de la conjuncion de dos booleanos.
data ExpB = LitB Bool | Equal ExpB ExpB | Not ExpB | And ExpB ExpB 

{- EJERCICIO 4: -}

--Se añade la expresión aritmética Div, que representa la división.
--Se añade IfThEl <b> <e1> <e2>, donde e1 y e2 son expresiones Expr y b es una expresión booleana ExpB.
data Expr = Lit Int | Sum Expr Expr | Mult Expr Expr | Div Expr Expr | IfThEl ExpB Expr Expr 

{- EJERCICIO 5: -}

{- INCISO a) -}
--Evalua las Expresiones aritméticas recibida y devuelve el resultado numérico.
evaluarExpr :: Expr -> Int
evaluarExpr (Lit x)= x
evaluarExpr (Sum (x) (y))= (evaluarExpr x)+(evaluarExpr y)
evaluarExpr (Mult (x) (y))= (evaluarExpr x)*(evaluarExpr y)
evaluarExpr (Div (x) (y))= div (evaluarExpr x) (evaluarExpr y)
evaluarExpr (IfThEl (x) (y) (z))= if (evaluarExpB x) then (evaluarExpr y) else (evaluarExpr z)

--Evalua la expresion booleana recibida y devuelve el resultado final booleano True o False.
evaluarExpB :: ExpB -> Bool
evaluarExpB (LitB x) = x
evaluarExpB (Not x) = not (evaluarExpB x)
evaluarExpB (Equal (x) (y)) = (evaluarExpB x) == (evaluarExpB y)
evaluarExpB (And (x) (y)) = (evaluarExpB x) && (evaluarExpB y)

{- INCISO b) -}
--Cuenta el número de operaciones aritméticas que hay en la expresion recibida y devuelve ese número.
contarExpr :: Expr -> Int
contarExpr (Lit x)= 0
contarExpr (Sum (x) (y))= 1 + contarExpr x + contarExpr y
contarExpr (Mult (x) (y))= 1+ contarExpr x + contarExpr y
contarExpr (Div (x) (y))= 1+ contarExpr x + contarExpr y

--Cuenta el número de operadores booleanos que hay en la expresion recibida y devuelve ese número.
contarExpB :: ExpB -> Int
contarExpB (LitB x) = 0
contarExpB (Not x) = 1 + (contarExpB x)
contarExpB (Equal (x) (y)) = 1+(contarExpB x)+(contarExpB y)
contarExpB (And (x) (y)) = 1+(contarExpB x) + (contarExpB y)

{- INCISO c) -}
--Personaliza Show para que muestre las expresiones aritméticas con los operadores usuales
instance Show Expr where
  show (Lit a) = show a
  show (Sum a b) = "("++show a ++ "+" ++show b++")"
  show (Mult a b) = "("++show a ++ "*"++ show b++")"
  show (Div a b) = "("++show a ++ "/" ++ show b++")"
  show (IfThEl a b c) = "if " ++ show a ++ " then " ++ show b ++ " else " ++ show c

--Personaliza Show para que muestre las expresiones booleanas con los operadores usuales
instance Show ExpB where
  show (LitB x) = show x
  show (Equal a b) = "("++show a ++ "=" ++ show b++")"
  show (Not b) = "("++"¬" ++show b++")"
  show (And a b) = "("++show a ++ " ∧ " ++ show b++")"