--Practica 03

-- Ejercicio 1 eliminarVocales

-- Ejericio 2 cifrar

-- Ejercicio 3 ExpB

--Crea el tipo de dato ExpB, Expresiones booleanas, 
--que contenga literales booleanas, Equal, Not, y And.
data ExpB = V | F | And ExpB ExpB | Or ExpB ExpB | Not ExpB | Equal ExpB ExpB deriving Show 


-- Ejercicio 4 Exp

data Expr = Lit Int | Sum Expr Expr | Mult Expr Expr | Mod Expr Expr | IfThEl ExpB Expr Expr deriving Show



-- Ejercicip 5 Exp y ExpB

--Evaluar

--Contar operadores
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

