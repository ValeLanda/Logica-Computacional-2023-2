-- | Practica 03
-- | Integrantes
-- | Sanchez Correa Diego Sebastián
-- | Zhang Liu Xin Wen
module Practica3 where

{- | eliminarVocales
'eliminarVocales' recibe una cadena y remueve las cadenas
de ella.
-}
eliminarVocales :: [Char] -> [Char]
eliminarVocales [] = []
eliminarVocales (x:xs)
  | esVocal x = eliminarVocales xs
  | otherwise = x: eliminarVocales xs

{- | esVocal
'esVocal' recibe un caracter y devuelve
'True' si el caracter se trata de una vocal;
o 'False', en otro caso.
-}
esVocal :: Char -> Bool
esVocal c
  | c == 'a' || c == 'A' = True
  | c == 'e' || c == 'E' = True
  | c == 'i' || c == 'I' = True
  | c == 'o' || c == 'O' = True
  | c == 'u' || c == 'U' = True
  | otherwise = False

{- | Ejemplos:
cifrar "Hola, mundo." 56
cifrar "Stay awhile and listen." 66
descifrar (cifrar "Hola, mundo." 56) 56
descifrar (cifrar "Stay awhile and listen." 66) 66
-}

{- | cifrar
'cifrar' recibe una cadena y un número;
se encripta la cadena con el cifrado de
César, con el valor de desplazamiento
pasado como parámetro.
Cifra cadenas representadas en ASCII
exrendido.
-}
cifrar :: [Char] -> Int -> [Char]
cifrar [] _ = []
cifrar (x:xs) a = shift x a : cifrar xs a

{- | descrifrar
'descrifrar' recibe una cadena y un número.
Descifra la cadena recibida, usando el número
como valor de desplazamiento para un cifrado
de César.
-}
descifrar :: [Char] -> Int -> [Char]
descifrar [] _ = []
descifrar (x:xs) a = shift x (255 - a) : descifrar xs a

{- | shift
'shift' desplaza el caracter recibido x veces.
-}
shift :: Char -> Int -> Char
shift c x = toEnum(mod (fromEnum(c) + x) 255)

{- | cifrar_alfabeto
'cifar_alfabeto' es una función alternativa utilizada
solo para cifrar carácteres del pertenecientes al
alfabeto.
-}
cifrar_alfabeto :: [Char] -> Int -> [Char]
cifrar_alfabeto [] _ = []
cifrar_alfabeto (x:xs) a
  | isUpperCase x = shift_upp x a : cifrar_alfabeto xs a
  | isLowerCase x = shift_low x a : cifrar_alfabeto xs a
  | otherwise = x : cifrar_alfabeto xs a

{- | shift_low
'shift_low' es una función alternativa utilizada
para desplazar las minúsculas.
-}
shift_low :: Char -> Int -> Char
shift_low c a = toEnum((mod (fromEnum(c) - 96) 26) + 96 + a)

{- | shift_upp
'shift_upp' es una función alternativa utilizada
para desplazar las mayúsculas.
-}
shift_upp :: Char -> Int -> Char
shift_upp c a = toEnum((mod (fromEnum(c) - 64) 26) + 64 + a)

{- | isUpperCase
'isUpperCase' devuelve True, si el caracter recibido
se trata de una mayúscula; o False, en otro caso.
-}
isUpperCase :: Char -> Bool
isUpperCase c = c >= 'A' && c <= 'Z'

{- | isLowerCase
'isLowerCase' devuelve True, si el caracter recibido
se trata de una minúscula; o False, en otro caso.
-}
isLowerCase :: Char -> Bool
isLowerCase c = c >= 'a' && c <= 'z'

-- Tipo que representa expresiones booleanas.
data ExpB = T | F | Equal ExpB ExpB | Not ExpB | And ExpB ExpB | Or ExpB ExpB
  deriving Show

-- Tipo que representa expresiones aritméticas.
data Expr = Lit Int | Sum Expr Expr | Mult Expr Expr | Div Expr Expr
  | IfThEl ExpB Expr Expr

{- | evalB
'evalB' evalúa expresiones booleanas representadas por el tipo `ExpB`.
-}
evalB :: ExpB -> Bool
evalB T = True
evalB F = False
evalB (Equal x y) = evalB x == evalB y
evalB (Not x) = not (evalB x)
evalB (And x y) = (evalB x) && (evalB y)
evalB (Or x y) = (evalB x) || (evalB y)

{- | contarB
'contarB' cuenta el número de operadores booleanos contenidos
en una expresión booleana.
-}
contarB :: ExpB -> Int
contarB T = 0
contarB F = 0
contarB (Equal x y) = 1 + contarB x + contarB y
contarB (Not x) = 1 + contarB x
contarB (And x y) = 1 + contarB x + contarB y
contarB (Or x y) = 1 + contarB x + contarB y

{- | eval
'eval' evalúa expresiones aritméticas representadas por el tipo `Expr`.
-}
eval :: Expr -> Int
eval (Lit x) = x
eval (Sum x y) = (eval x) + (eval y)
eval (Mult x y) = (eval x) * (eval y)
eval (Div x y)
  | (eval y) /= 0 = (eval x) `div` (eval y)
  | otherwise = error "División entre cero."
eval (IfThEl a x y)
  | evalB a = eval x
  | otherwise = eval y

{- | contar
'contar' cuenta el número de operadores aritméticos contenidos
en una expresión aritmética.
-}
contar :: Expr -> Int
contar (Lit x) = 0
contar (Sum x y) = 1 + contar x + contar y
contar (Mult x y) = 1 + contar x + contar y
contar (Div x y) = 1 + contar x + contar y
contar (IfThEl a x y) = 1 + contarB a + contar x + contar y

-- Permite definir la representación en cadena del tipo `Expr`
instance Show Expr where
  show e = showExpr e

{- | showExpr
'showExpr' define la representación en cadena del tipo `Expr`.
-}
showExpr :: Expr -> String
showExpr (Lit x) = show x
showExpr (Sum x y) = "(" ++ showExpr x ++ " + " ++ showExpr y ++ ")"
showExpr (Mult x y) = "(" ++ showExpr x ++ " * " ++ showExpr y ++ ")"
showExpr (Div x y) = "(" ++ showExpr x ++ " / " ++ showExpr y ++ ")"
showExpr (IfThEl a x y)
  | evalB a =  showExpr x
  | otherwise = showExpr y
