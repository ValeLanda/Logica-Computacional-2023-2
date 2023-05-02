-- 1.
-- Recibe una cadena y elimina todas las vocales de la misma
-- devolviendo la cadena resultante.
eliminarVocales :: String -> String
eliminarVocales s = [c | c <- s, not $ c  `elem` "aeiouAEIOU"]

-- 2.
-- Recibe una cadena de texto y un número, y aplica un cifrado César.
cifrar :: String -> Int -> String
cifrar cadena numero = map (flip recorrerCaracter numero) cadena
-- Ejemplos de uso:
-- cifrar "hola" 12 devuelve "t{xm"
-- cifrar "llave" 11 devuelve "wwl\129p"
-- cifrar "Clave" (-3) devuelve "@i^sb"
-- cifrar "@i^sb" 3 devuelve "Clave"
-- Ejemplos de composición:
-- La función se puede usar para cifrar y descifrar cadenas, por ejemplo, para
-- verificar que la función funcione correctamente, podemos realizar las siguientes
-- composiciones de funciones.
-- cifrar (cifrar "Hola" 23) (-23) devuelve "Hola"
-- cifrar (cifrar "llave" 11) (-11) devuelve "llave"
-- cifrar (cifrar "Clave" (-3)) (3) devuelve "Clave"
-- Y de esta forma, podemos observar que la función cifra de manera correcta.
  

-- Función auxiliar de cifrar que recibe un carácter y un entero y recorre
-- el carácter la cantidad de posiciones indicadas por el parámetro que recibe.
-- La función acepta y devuelve carácteres que pertenecen a Unicode
-- (i.e. el carácter resultante no necesariamente pertenecerá al alfabeto en inglés).
-- En caso de que el caracter resultante se encuentre fuera de los carácteres posibles,
-- se aplica aritmética modular para devolver un carácter válido.
recorrerCaracter :: Char -> Int -> Char
recorrerCaracter x y
  | z < 0 = toEnum $ modulo + fromEnum (maxBound :: Char)
  | otherwise = toEnum modulo
  where z = fromEnum x + y
        modulo = (rem z (fromEnum (maxBound :: Char)))



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

-- 4.
{-|
Tipo de dato Exp
-}

data Exp = Lit Int | Sum Exp Exp | Mult Exp Exp | Sqr Exp | IfThEl ExpB Exp Exp 

{-|
Mostrar las expresioner aritmeticas con los operadores usuales
-}

instance Show Exp where
    show (Lit a) = "a"
    show (Sum a b) = show a ++ " + " ++ show b
    show (Mult a b) = show a ++ " * " ++ show b
    show (Sqr a) = show a ++ " ^2 "
    show (IfThEl b x y) = " IF " ++ show b ++ " THEN " ++ show x ++ " ELSE " ++ show y
    
{-|
   Función que evalúa expresiones arimeticas
-}
evalA :: Exp -> Int
evalA (Lit a) = a
evalA (Sum a b) = evalA a + evalA b
evalA (Mult a b) = evalA a * evalA b
evalA (Sqr a) = evalA a * evalA a
evalA (IfThEl b x y)
    | evalB b = evalA x
    | otherwise = evalA y

{-|
   Función que cuenta la cantidad de operadores en una expresión aritmetica
-}
contarA :: Exp -> Int
contarA (Lit a) = 0
contarA (Sum a b ) = 1 + contarA a + contarA b
contarA (Mult a b) = 1 + contarA a + contarA b
contarA (Sqr a) = 1 + contarA a
contarA (IfThEl b x y) = 1 + contarA x + contarA y 
