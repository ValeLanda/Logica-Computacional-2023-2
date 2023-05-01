data Exp = Lit Int | Sum Exp Exp | Mult Exp Exp | Res Exp Exp | IfThEl ExpB Exp Exp deriving Show

data ExpB = V | F | Or ExpB ExpB | Equal ExpB ExpB | Not ExpB | And ExpB ExpB deriving Show

-- Evaluación de expresiones aritméticas. 
eval :: Exp -> Int
eval (Lit x) = x
eval (Sum e1 e2) = eval(e1) + eval(e2)
eval (Mult e1 e2) = eval(e1) * eval(e2)
eval (Res e1 e2) = eval(e1) - eval(e2)
eval (IfThEl b e1 e2) = if evalB(b) then eval(e1) else eval(e2)

-- Evaluación de expresiones booleanas.
evalB :: ExpB -> Bool
evalB V = True
evalB F = False
evalB (Not eb) = not (evalB(eb))
evalB (Or eb1 eb2) = evalB(eb1) || evalB(eb2)
evalB (Equal eb1 eb2) = evalB(eb1) == evalB(eb2)
evalB (And eb1 eb2) = evalB(eb1) && evalB(eb2)

-- Cuenta operadores de expresiones aritméticas.
countE :: Exp -> Int
countE (Lit x) = 0
countE (Sum eb1 eb2) = countE(eb1) + countE(eb2) + 1
countE (Mult eb1 eb2) = countE(eb1) + countE(eb2) + 1
countE (Res eb1 eb2) = countE(eb1) + countE(eb2) + 1
countE (IfThEl b eb1 eb2) = if evalB b then 1 + countE(eb1) else 1 + countE(eb2)

-- Cuenta operadores de expresiones booleanas.
countB :: ExpB -> Int
countB V = 0
countB F = 0
countB (Not eb) = countB(eb) + 1
countB (Or eb1 eb2) = countB(eb1) + countB(eb2) + 1
countB (Equal eb1 eb2) = countB(eb1) + countB(eb2) + 1
countB (And eb1 eb2) = countB(eb1) + countB(eb2) + 1

-- Personalización de show para que muestre las expresiones aritméticas con los operadores usuales.
showE :: Exp -> String
showE (Lit x) = show x
showE (Sum eb1 eb2) = showE(eb1) ++ " + " ++ showE(eb2)
showE (Mult eb1 eb2) = showE(eb1) ++ " x " ++ showE(eb2)
showE (Res eb1 eb2) = showE(eb1) ++ " - " ++  showE(eb2)
showE (IfThEl b eb1 eb2) = "If " ++ show(b) ++ " then " ++ showE(eb1) ++ " else " ++ showE(eb2)