import Data.Char
--PRACTICA 03 Logica Computacional

{-Funcion eliminarVocales, que dada una cadena elimina todas
las vocales de la misma y devuelva la cadena resultante.

Ejemplo: Input: String -> "aAeEiIoOuUBCDFG" Output -> "BCDFG"
-}

eliminarVocales :: String -> String
eliminarVocales [] = []
eliminarVocales (x:xs)
  | x `elem` "aAeEiIoOuU" = eliminarVocales xs
  | otherwise = x : eliminarVocales xs



{-Crea una funcion llamada cifrar, que reciba una cadena de texto y un
numero, y que aplique un cifrado Cesar. Incluir ejemplos de uso, y de composicion.
-}

--Funcion Auxiliar que convierte un caracter a un entero de 1 a 26 que es la posicion númerica en el alfabeto(minusculas)
letratoNum :: Char -> Int
letratoNum x = fromEnum x - fromEnum 'a' + 1

--Funcion que convierte un entero entre 1 y 26 al caracter del alfabeto en esa posicion(minusculas)
numToLetra :: Int -> Char
numToLetra c 
    | (c > 0) && (c < 27) = toEnum(fromEnum 'a' + c -1)
    | otherwise           = error "Fuera de rango"
--                          1 = toEnum(97+1-1)

--Funcion que convierte un caracter a un entero de 1 a 26 que es la posicion numerica en el alfabeto(mayusculas) 
mayusToNum :: Char -> Int
mayusToNum x = fromEnum x - fromEnum 'A' + 1

--Funcion que convierte un entero entre 1 y 26 al caracter del alfabeto en esa posicion numerica(mayusculas)
numToMayus :: Int -> Char
numToMayus c 
    | (c > 0) && (c < 27) = toEnum(fromEnum 'A' + c -1)
    | otherwise           = error "Fuera de Rango"
--                        2 = toEnum(65+2-1) = 'B'

{-
cifrarCaracter :: Int -> Char -> Char
cifrarCaracter n x 
      | isLower x = numToLetra ((letratoNum x + n) `mod` 26)
      | otherwise = x
-}

cifrar :: Int -> String -> String 
cifrar n [] = []
cifrar n (x:xs)
    | isLower x  = numToLetra ((letratoNum x + n) `mod` 26) : cifrar n xs
    | isUpper x  = numToMayus ((mayusToNum x + n) `mod` 26) : cifrar n xs
    | otherwise = x : cifrar n xs
{-Ejemplos:
 cifrar 1 "ABCDabcd"
 = "BCDEbcde"
 cifrar 5 "VWXYZvwxyz"
 = "ABCDEabcde"
 cifrar 26 "ABCDEabcde"
 = "ABCDEabcde"
-}

{-
Crea el tipo de dato ExpB, Expresiones booleanas, que contenga
literales booleanas, Equal, Not, y And.
-}

data ExpB = Lit Bool | Equal ExpB ExpB | Not ExpB | And ExpB ExpB


{-Completa el tipo Exp para que este contenga:
a. Una expresion aritmetica mas, ademas de la suma y la multiplicacion.
b. IfThEl b e1 e2, donde e1 y e2 son expresiones y b es una expresion
booleana.

-Sum -> suma
-SUb -> resta
-Mult -> multiplicacion
-}

data Exp = Lit1 Int | IfThEl ExpB Exp Exp | Sum Exp Exp | Sub Exp Exp | Mult Exp Exp 

--Ejemplos de Exp Donde "Lit1"
--expr1 = Lit1 2
--expr2 = Sum (Lit1 2) (Lit1 3)
--expr3 = Sum (Sub (Lit1 3) (Lit1 1)) (Lit1 3)
--expr4 = Sub (Lit1 2) (Lit1 2)

{-Para el tipo Exp y ExpB, crea las funciones:
a. evaluar
b. contar, cuenta operadores
c. [1 punto] Personaliza Show para que muestre las expresiones aritméticas
con los operadores usuales.
-}

--(a)
evalB :: ExpB -> Bool 
evalB (Lit b) = b
evalB (Equal e1 e2)  = evalB e1 == evalB e2
evalB (Not e)  = not (evalB e)
evalB (And e1 e2) = (evalB e1) && (evalB e2)
{-Ejemplos:
  evalB (Lit True)
  = True
  evalB (Lit False)
  = False
  evalB (And (Lit True) (Lit True))
  = True
  evalB (And (Lit True) (Lit False))
  = False
  evalB (Equal (Lit False) (Lit False))
  = True
  evalB (Not (Lit True))
  = False
-}

eval :: Exp -> Int
eval (Lit1 x) = x
eval (Sum e1 e2)  = (eval e1) + (eval e2)
eval (Sub e1 e2)  = (eval e1) - (eval e2)
eval (Mult e1 e2) = (eval e1) * (eval e2)
eval (IfThEl b e1 e2) = if evalB b then eval e1 else eval e2
{-Ejemplos:
 eval (Sub (Lit1 2) (Lit1 2)) 
 = 0
 eval (Sum expr1 expr4)
 = 2
 eval (IfThEl (Lit True) (Lit1 1) (Lit1 100))
 = 1
 eval (IfThEl (Lit False) (Lit1 1) (Lit1 100))
 = 100
 eval (IfThEl (And (Lit True) (Lit False)) (Sum (Lit1 10) (Lit1 10)) (Sum (Lit1 20) (Lit1 20)))
 = 40
-}


--(b)
contarB :: ExpB -> Int 
contarB (Lit _) = 0
contarB (Equal e1 e2) = 1 + contarB e1 + contarB e2
contarB (Not e) = 1 + contarB e
contarB (And e1 e2) = 1 + contarB e1 + contarB e2
{-Ejemplos:
 contarB (And (Lit True) (Lit False))
 = 1
 contarB (Lit True)
 = 0
 contarB (And(Equal (Lit True) (Lit True)) (Equal (Lit True) (Lit True)))
 = 3
-}

contar :: Exp -> Int 
contar (Lit1 _) = 0
contar (Sum e1 e2) = 1 + contar e1 + contar e2
contar (Sub e1 e2) = 1 + contar e1 + contar e2
contar (Mult e1 e2) = 1 + contar e1 + contar e2
contar (IfThEl b e1 e2) = contarB b + contar e1 + contar e2
{-Ejemplos:
 contar (Lit1 5)
 = 0
 contar (Sum (Sum (Lit1 4)(Lit1 4)) (Lit1 10))
 = 2
 contar (IfThEl (And (Lit True) (Lit False)) (Sum (Lit1 10) (Lit1 10)) (Sum (Lit1 20) (Lit1 20)))
 = 3
-}

--(c)
instance Show ExpB where
    show (Lit b) = show b
    show (Equal e1 e2) = "(" ++ show e1 ++ "==" ++ show e2 ++ ")"
    show (Not e) = "not(" ++ show e ++ ")"
    show (And e1 e2) = "(" ++ show e1 ++ "&&"++ show e2 ++ ")"

{-Ejemplos:
  show (Equal (Lit True) (Lit True))
  = "(True==True)"
  show (Lit True)
  = "True"
  show (Not (Lit True))
  = "not(True)"
  show (And (Lit True) (Lit True))
  = "(True&&True)"
-}

instance Show Exp where
    show (Lit1 x) = show x
    show (Sum e1 e2) = "(" ++ show e1 ++ "+" ++ show e2 ++ ")"
    show (Sub e1 e2) = "(" ++ show e1 ++ "-" ++ show e2 ++ ")"
    show (Mult e1 e2) = "(" ++ show e1 ++ "*" ++ show e2 ++ ")"
    show (IfThEl b e1 e2) = "if" ++ show b ++ "then" ++ show e1 ++ "else" ++ show e2 

{-Ejemplos:
 show (Lit1 5)
 = "5"
 show (Sum (Lit1 10) (Lit1 10))
 = "(10+10)"
 show (Sub (Lit1 20) (Lit1 10)) 
 = "(20-10)"
 show (Mult (Lit1 2020) (Lit1 20))
 = "(2020*20)"
 show (IfThEl (And (Lit True) (Lit False)) (Sum (Lit1 10) (Lit1 10)) (Sum (Lit1 20) (Lit1 20)))
 = "if(True&&False)then(10+10)esle(20+20)"
-}



