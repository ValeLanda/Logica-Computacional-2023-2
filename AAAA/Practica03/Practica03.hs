-- 3.
{-|
   Tipo de dato ExpB
-}
data ExpB = V | F | Equal ExpB ExpB | Not ExpB | And ExpB ExpB

{-|
   Mostrar las expresiones booleanas con operadores usuales
-}
instance Show ExpB where
    show V = "V"
    show F = "F"
    show (Equal a b) = show a ++ " ≡ " ++ show b
    show (Not a) = "¬" ++ show a
    show (And a b) = show a ++ " ∧ " ++ show b

{-|
   Función que evalúa expresiones booleanas
-}
evalB :: ExpB -> Bool
evalB V = True
evalB F = False
evalB (Equal a b) = evalB(a) == evalB(b)
evalB (Not a) = not(evalB a)
evalB (And a b) = evalB(a) && evalB(b)

{-|
   Función que cuenta la cantidad de operadores en una expresión booleana
-}
contar :: ExpB -> Int
contar V = 0
contar F = 0
contar (Equal a b) = 1 + contar a + contar b
contar (Not a) = 1 + contar a
contar (And a b) = 1 + contar a + contar b
