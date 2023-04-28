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
