{- 1.- Creación de la función eliminarVocales, que dada una cadena elimine todas las vocales de la misma y devuelva la cadena resultante. -}
eliminarVocales :: String -> String
eliminarVocales [] = []
eliminarVocales (x:xs) = if x `elem` "aeiouAEIOU" then eliminarVocales xs else x : eliminarVocales xs


{- 2.- Creación de una función llamada -cifrar-, que reciba una cadena de texto y un número, y que aplique un cifrado César. Incluir ejemplos de uso, y de composición. 
    Criterio de cifrado:
        - Si el carácter es una letra minúscula, se sustituye por la letra que se encuentra n posiciones más adelante en el alfabeto.
        - Si el carácter es una letra mayúscula, se sustituye por la letra que se encuentra n posiciones más atrás en el alfabeto.
        - Si el carácter no es una letra, se deja igual.

    Ejemplos:
        - cifrar "hola" 3 = "krod"
        - cifrar "texto no cifrado" 3 = "whawr qr flidugr"
        - cifrar "whawr qr flidugr" (-3) = "texto no cifrado"
        - cifrar "no cifrado" 0 = "no cifrado"
    -}
cifrar :: String -> Int -> String
cifrar [] _ = []
cifrar (x:xs) n = if x `elem` ['a'..'z'] then toEnum (fromEnum 'a' + mod (fromEnum x - fromEnum 'a' + n) 26) : cifrar xs n else x : cifrar xs n


{- 3.- Creación del tipo de dato BExp, expresiones booleanas, que contenga literales booleanas, Equal, Not, y And. -}
data BExp = LitB Bool | Equal BExp BExp | Not BExp | And BExp BExp deriving Show


{- 4.- Operaciones añadidas en el tipo Exp: -}

-- a) y b) Tipo Exp con la operación potencia y la operación IfThEl b e1 e2 añadida (donde e1 y e2 son expresiones y b es una expresión booleana).
data Exp = Lit Int | Sum Exp Exp | Mult Exp Exp | Pot Exp Exp | IfThEl BExp Exp Exp


{- 5.- Para el tipo Exp y BExp, creación de las funciones: -}

-- a) evaluar.
evaluar :: Exp -> Int
evaluar (Lit n) = n
evaluar (Sum e1 e2) = evaluar e1 + evaluar e2
evaluar (Mult e1 e2) = evaluar e1 * evaluar e2
evaluar (Pot e1 e2) = evaluar e1 ^ evaluar e2
evaluar (IfThEl b e1 e2) = if evaluarB b then evaluar e1 else evaluar e2
--Ejemplos:
-- evaluar (Lit 3) = 3
-- evaluar (Sum (Lit 3) (Lit 4)) = 7
-- evaluar (Pot (Lit 2) (Lit 4)) = 16
-- evaluar (IfThEl (LitB True) (Lit 3) (Lit 4)) = 3

evaluarB :: BExp -> Bool
evaluarB (LitB b) = b
evaluarB (Equal e1 e2) = evaluarB e1 == evaluarB e2
evaluarB (Not e) = not (evaluarB e)
evaluarB (And e1 e2) = evaluarB e1 && evaluarB e2
-- Ejemplos:
-- evaluarB (And (Not (LitB False)) (LitB True)) = True
-- evaluarB (Equal (LitB False) (LitB True)) = False
-- evaluarB (And (LitB False) (Equal (LitB False) (LitB True))) = False


-- b) contar (operadores).
contar :: Exp -> Int
contar (Lit _) = 0
contar (Sum e1 e2) = 1 + contar e1 + contar e2
contar (Mult e1 e2) = 1 + contar e1 + contar e2
contar (Pot e1 e2) = 1 + contar e1 + contar e2
contar (IfThEl b e1 e2) = 1 + contarB b + contar e1 + contar e2
-- Ejemplos:
-- contar (Lit 3) = 0
-- contar (Sum (Lit 3) (Lit 4)) = 1
-- contar (Pot (Lit 3) (Lit 4)) = 1
-- contar (IfThEl (LitB True) (Lit 3) (Lit 4)) = 1
-- contar (Pot (Sum (Lit 3) (Lit 3)) (Lit 4)) = 2

contarB :: BExp -> Int
contarB (LitB _) = 0
contarB (Equal e1 e2) = 1 + contarB e1 + contarB e2
contarB (Not e) = 1 + contarB e
contarB (And e1 e2) = 1 + contarB e1 + contarB e2
-- Ejemplos:
-- contarB (And (Not (LitB False)) (LitB True)) = 2
-- contarB (Equal (LitB False) (LitB True)) = 1
-- contarB (And (LitB False) (Equal (LitB False) (LitB True))) = 2
-- contar (LitB True) = 0


-- c) Personalización de Show para que muestre las expresiones aritméticas con los operadores usuales.
instance Show Exp where
    show (Lit n) = show n
    show (Sum e1 e2) = "(" ++ show e1 ++ " + " ++ show e2 ++ ")"
    show (Mult e1 e2) = "(" ++ show e1 ++ " * " ++ show e2 ++ ")"
    show (Pot e1 e2) = "(" ++ show e1 ++ " ^ " ++ show e2 ++ ")"
    show (IfThEl b e1 e2) = "if " ++ show b ++ " then " ++ show e1 ++ " else " ++ show e2
-- Ejemplos de uso:
-- show (Lit 3) = "3"
-- show (Sum (Lit 3) (Lit 4)) = "(3 + 4)"
-- show (Pot (Lit 3) (Lit 4)) = "(3 ^ 4)"