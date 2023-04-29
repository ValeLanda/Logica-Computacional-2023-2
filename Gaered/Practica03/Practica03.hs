-- Practica 03

-- Ejercicio 1: eliminarVocales
-- Función que recibe una cadena, elimina las vocales de la cadena y devuelve la nueva cadena.
eliminarVocales:: String -> String
eliminarVocales [] = []
eliminarVocales (x:xs) = if (elem n [65,69,73,79,85,97,101,105,111,117])
    then eliminarVocales xs
    else [x] ++ (eliminarVocales xs)
    where n = fromEnum x

-- Ejercicio 2: cifrar
-- Función que recibe una cadena y un número, y aplica un cifrado César.

-- Cifrado Cesar clasico, solo aplica el cifrado a las letras
cifrar:: String -> Int -> String
cifrar [] _ = []
cifrar (x:xs) y
    | ((n>=65 && n<=90 && (n+y)<=90) || (n>=97 && n<=122 && (n+y)<=122))= [toEnum (n+y)] ++ (cifrar xs y)
    | ((n>=65 && n<=90 && (n+y)>90) || (n>=97 && n<=122 && (n+y)>122)) = [toEnum (n+y-26)] ++ (cifrar xs y)
    | otherwise = [x] ++ (cifrar xs y)
    where n = fromEnum x

-- Cifrado Cesar aplicado a cualquier caracter de entrada
cifrar2 :: String -> Int -> String
cifrar2 [] _ = []
cifrar2 (c:cs) x = if x < 0
    then error "Ingresa un valor positivo"
    else (toEnum (mod ((fromEnum c) + x) 256)::Char):(cifrar2 cs x)

-- Ejercicio 3: ExpB
-- Tipo de dato, Expresiones Booleanas.
data ExpB = V
    | F
    | Neg ExpB
    | Or ExpB ExpB
    | And ExpB ExpB
    | Equal ExpB ExpB

-- Ejercicio 4: Exp
-- Tipo de dato, Expresiones Aritméticas.
data Exp = Lit Int
    | Sum Exp Exp
    | Mult Exp Exp
    | Pot2 Exp --Eleva al cuadrado

--ifThEl
-- Recibe una ExpB y dos Exp, si la ExpB es verdadera, devuelve la primer Exp,
-- en otro caso devuelve la segunda.
ifThEl :: ExpB -> Exp -> Exp -> Exp
ifThEl b e1 e2 = if evalB b
    then e1
    else e2

--Ejercicio 5: ExpB y Exp
--Función que evalua una ExpB
evalB :: ExpB -> Bool
evalB V = True
evalB F = False
evalB (Neg V) = False
evalB (Neg F) = True
evalB (Neg x) = evalB (Neg (evalBAux (evalB x)))
evalB (Or V _) = True
evalB (Or _ V) = True
evalB (Or F F) = False
evalB (Or x y) = evalB (Or (evalBAux (evalB x)) (evalBAux (evalB y)))
evalB (And F _) = False
evalB (And _ F) = False
evalB (And V V) = True
evalB (And x y) = evalB (And (evalBAux (evalB x)) (evalBAux (evalB y)))
evalB (Equal F F) = True
evalB (Equal V V) = True
evalB (Equal F V) = False
evalB (Equal V F) = False
evalB (Equal x y) = evalB (Equal (evalBAux (evalB x)) (evalBAux (evalB y)))

evalBAux :: Bool -> ExpB
evalBAux True = V
evalBAux False = F

-- Función que evalua una Exp
eval :: Exp -> Int
eval (Lit x) = x
eval (Sum x y) = (eval x) + (eval y)
eval (Mult x y) = (eval x) * (eval y)
eval (Pot2 x) = eval(Mult x x) 

-- Función que cuenta los operadores de una ExpB
contOpB :: ExpB -> Int
contOpB V = 0
contOpB F = 0
contOpB (Neg x) = 1 + (contOpB x)
contOpB (Or x y) = 1 + (contOpB x) + (contOpB y)
contOpB (And x y) = 1 + (contOpB x) + (contOpB y)
contOpB (Equal x y) = 1 + (contOpB x) + (contOpB y)

--Función que cuenta los operadores de una Exp
contOp :: Exp -> Int
contOp (Lit _) = 0
contOp (Sum x y) = 1 + (contOp x) + (contOp y)
contOp (Mult x y) = 1 + (contOp x) + (contOp y)
contOp (Pot2 x) = 1 + (contOp x)

-- Cadena que muestra una ExpB
instance Show ExpB where
    show = showExpB

showExpB :: ExpB -> String
showExpB V = "V"
showExpB F = "F"
showExpB (Neg x) = "~" ++ (showExpB x) ++ ""
showExpB (Or x y) = "(" ++ (showExpB x) ++ "v" ++ (showExpB y) ++ ")"
showExpB (And x y) = "(" ++ (showExpB x) ++ "^" ++ (showExpB y) ++ ")"
showExpB (Equal x y) = "(" ++ (showExpB x) ++ "<=>" ++ (showExpB y) ++ ")"

-- Cadena que muestra una Exp
instance Show Exp where
    show = showExp

showExp :: Exp -> String
showExp (Lit x) = show x
showExp (Sum x y) = "(" ++ (showExp x) ++ "+" ++ (showExp y) ++ ")"
showExp (Mult x y) = "(" ++ (showExp x) ++ "*" ++ (showExp y) ++ ")"
showExp (Pot2 x) = (showExp x) ++ "²"