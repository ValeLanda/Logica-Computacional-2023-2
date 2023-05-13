{-PRACTICA 03
Integrantes:
1. Mora Hernandez Dulce Julieta (319236448)
2. Noriega Rodriguez Marcos Julian (319284061)
3. Palomo Valle Samantha Charlize (319273841)
4. Resendiz Mendoza Brenda Paola (319041356)
-}
--Funcion que elimina vocales de una cadena
eliminarVocales :: String -> String
eliminarVocales [ ] = [ ]
eliminarVocales (x:xs)
    | elem x "aeiouAEIOU" = eliminarVocales xs
    | otherwise = x : eliminarVocales xs

{-2. Crea una función llamada cifrar, que reciba una cadena de texto y un número, 
y que aplique un cifrado César. Incluir ejemplos de uso, y de composición.
Ejemplos:
   Cifrar "Hola mundo!" con clave 3
   cifrar "Hola mundo!" 3
   Resultado: "Krod pxqgr!"
   Cifrar "Haskell es genial" con clave 13
   cifrar "Haskell es genial" 13
   Resultado: "Unfxxry rf travan"
-}
cifrar :: String -> Int -> String
cifrar texto clave = map (\c -> rotar c clave) texto
  where rotar c k
          | c >= 'a' && c <= 'z' = rotarLetra c k 'a'
          | c >= 'A' && c <= 'Z' = rotarLetra c k 'A'
          | otherwise            = c 
rotarLetra letra k base = toEnum (baseInt + ((fromEnum letra) - baseInt + k) `mod` 26)
          where baseInt = fromEnum base

--Dato de expresiones booleanas
data BExp = V | F | Equal BExp BExp | Not BExp | And BExp BExp | Or BExp BExp deriving Show


-- Tipos expresiones aritmeticas
data Expr = Lit Int | Sum Expr Expr | Mult Expr Expr | Rest Expr Expr | Cuadrado Expr | IfThEl BExp Expr Expr deriving Show

-----------EVALUAR-----------
--Funcion eval para expresiones aritmeticas
eval :: Expr -> Int
eval (Lit x) = x
eval (Sum x y) = (eval x) + (eval y)
eval (Mult x y) = (eval x) * (eval y)
eval (Rest x y) = (eval x) - (eval y)
eval (Cuadrado x) = (eval x) * (eval x)
eval (IfThEl b e1 e2) = if evalB(b) then eval(e1) else eval(e2)

--Funcion evalB para expresiones logicas
evalB :: BExp -> Bool
evalB V = True
evalB F = False
evalB (Not x) = negacion (evalB x)
evalB (Or x y) = disyuncion (evalB x) (evalB y)
evalB (And x y) = conjuncion (evalB x) (evalB y)
evalB (Equal x y) = bicondicional (evalB x) (evalB y)

negacion :: Bool -> Bool
negacion True = False
negacion False = True


--conjuncion (and, ya que sus tablas de verdad son equivalentes)
conjuncion :: Bool -> Bool-> Bool
conjuncion True True = True
conjuncion x y = False

--disyuncion (or, ya que sus tablas de verdad son equivalentes)
disyuncion :: Bool -> Bool -> Bool 
disyuncion False False = False
disyuncion x y = True

--bicondicional(equal, ya que sus tablas de verdad son equivalentes)
bicondicional :: Bool -> Bool -> Bool
bicondicional True True = True
bicondicional False False = True
bicondicional x y = False

-----------CONTAR-----------
--Funcion contar que cuenta operadores para expresiones aritmeticas
contar :: Expr -> Int
contar (Lit x) = 0
contar (Sum x y) = 1 + (contar x) + (contar y)
contar (Mult x y) = 1 + (contar x) + (contar y)
contar (Rest x y) = 1 + (contar x) + (contar y)
contar (Cuadrado x) = 1 + (contar x)
contar (IfThEl b x y) = 1 + (contar x) + (contar y)

--Funcion contar que cuenta operadores para expresiones logicas
contarB :: BExp -> Int
contarB V = 0
contarB F = 0
contarB (Or x y) = 1 + (contarB x) + (contarB y)
contarB (Equal x y) = 1 + (contarB x) + (contarB y)
contarB (And x y) = 1 + (contarB x) + (contarB y)
contarB (Not x) = 1 + (contarB x)

--Personalizamos Show para mostrar las expresiones aritmeticas con los operadores usuales
showE :: Expr -> String
showE (Lit x) = show x
showE (Cuadrado x) = show x ++ "^2"
showE (Sum x y) = showE x ++ "+" ++ showE y
showE (Mult x y) = showE x ++ "*" ++ showE y
showE (Rest x y) = showE x ++ "-" ++ showE y