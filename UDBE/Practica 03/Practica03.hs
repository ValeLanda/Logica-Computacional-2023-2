import Data.Char

--Practica 03

-- Ejercicio 1 eliminarVocales
elimVocales :: String -> String
elimVocales [] = [] -- caso base: si la cadena está vacía, nos regresa la cadena vacía
elimVocales (x:xs)
  | x `elem` "aeiouAEIOU" = elimVocales xs --se elimina si el primer caracter es una vocal
  | otherwise = x : elimVocales xs -- si no es una vocal, se mantiene asi como esta y seguimos con  el resto de la cadena

-- Ejericio 2 cifrar
-- Si el carácter es una letra minúscula (isLower char es True), esta convierte su valor ASCII a un número entre 0 y 25 (low2int char), despues sumamos el número de posiciones que se debe desplazar y calculamos el resto de la división entre 26 para asegurarse de que el resultado esté dentro del rango de letras del alfabeto que estamos usando. Y aplicamos algo similar para las mayusculas
caesar :: Int -> String -> String --La función caesar toma dos argumentos: el número de posiciones que se deben desplazar las letras y la cadena de texto que se debe cifrar.
caesar shift text = map (shiftChar shift) text
  where shiftChar shift char
          | isLower char = int2low ((low2int char + shift) `mod` 26)
          | isUpper char = int2upp ((upp2int char + shift) `mod` 26)
          | otherwise = char
        int2upp x = chr (x + ord 'A')
        int2low x = chr (x + ord 'a')
        upp2int y = ord y - ord 'A'
        low2int y = ord y - ord 'a'


-- Ejercicio 3 ExpB

--Crea el tipo de dato ExpB, Expresiones booleanas,
--que contenga literales booleanas, Equal, Not, y And.
data ExpB = V | F | And ExpB ExpB | Or ExpB ExpB | Not ExpB | Equal ExpB ExpB deriving Show


-- Ejercicio 4 Exp

data Expr = Lit Int | Sum Expr Expr | Mult Expr Expr | Mod Expr Expr | IfThEl ExpB Expr Expr deriving Show

-- Ejercicip 5 Exp y ExpB

--Evaluar

--Expr
eval :: Expr -> Int
eval (Lit x) = x
eval (Sum x y) = eval(x) + eval(y)
eval (Mult x y) = eval(x) * eval(y)
eval (IfThEl p x y ) = if evalB(p) then eval(x) else eval(y)
--
--ExpB
evalB :: ExpB -> Bool
evalB V = True
evalB F = False
evalB (Not p) = not (evalB(p))
evalB (Or p q) = evalB(p) || evalB(q)
evalB (And p q) = evalB(p) && evalB(q)
evalB (Equal p q) = evalB(p) == evalB(q)

--Contar operadores

--Expr
countExp :: Expr -> Int
countExp (Lit x) = 0
countExp (Sum x y) = countExp(x) + countExp(y) + 1
countExp (Mult x y) = countExp(x) + countExp(y) + 1
countExp (IfThEl p x y) = if evalB(p) then countExp(x) + 1 else countExp(y) + 1

--ExpB
countExpB :: ExpB -> Int
countExpB V = 0
countExpB F = 0
countExpB (And p q) = 1 + (countExpB p) + (countExpB q)
countExpB (Or p q) = 1 + (countExpB p) + (countExpB q)
countExpB (Not p) = 1 + (countExpB p)
countExpB (Equal p q) = 1 + (countExpB p) + (countExpB q)



--Personaliza Show para que muestre las expresiones
-- aritméticas con los operadores usuales
--ExpB
showExpB:: ExpB -> String
showExpB V = "V"
showExpB F = "F"
showExpB (And p q) = "("++ (showExpB p ) ++ "∧" ++ (showExpB q) ++ ")"
showExpB (Or p q) = "("++ (showExpB p ) ++ "∨" ++ (showExpB q) ++ ")"
showExpB (Not p) = "¬" ++ (showExpB p)
showExpB (Equal p q ) = "("++ (showExpB p ) ++ "=" ++ (showExpB q) ++ ")"
