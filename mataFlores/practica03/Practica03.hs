{-
    Ejercicio 1.
-}

{-
    Nos dice si un caracter
    es vocal o no.
-}
esVocal :: Char -> Bool
esVocal a = let asci = fromEnum a
        in
            (asci == 65) || (asci == 69) ||
            (asci == 73) || (asci == 79) ||
            (asci == 85) || (asci == 97) ||
            (asci == 101)|| (asci == 105)||
            (asci == 111)|| (asci == 117)


{-
    Dada una cadena elimine todas las vocales 
    de la misma y devuelva la cadena resultante.
-}
eliminarVocales :: [Char] -> [Char]
eliminarVocales [] = [] 
eliminarVocales (x:xs) =
    if (esVocal x)
        then eliminarVocales xs
        else x : (eliminarVocales xs)

{-
    Ejercicio 2.
-}

{-
    Cifra un caracter con el 
    algoritmo cesar con un número n.
-}
cesarCaracter :: Char -> Int -> Char
cesarCaracter c n = toEnum ((fromEnum c) + n)

{-
    Aplica un cifrado cesar a una cadena,
    con un parámetro n.
-}
cifrar :: [Char] -> Int -> [Char]
cifrar [] _ = []
cifrar (x:xs) n = (cesarCaracter x n) : (cifrar xs n)

{-
    Descifra un caracter con el 
    algoritmo cesar con un número n.
-}
descaracter :: Char -> Int -> Char
descaracter c n = toEnum ((fromEnum c) - n)

{-
    Descifra un cifrado cesar a una cadena,
    con un parámetro n.
-}
descifrar :: [Char] -> Int -> [Char]
descifrar [] _ = []
descifrar (x:xs) n = (descaracter x n) : (descifrar xs n)

{-
    Ejercicio 3.
-}

{-
    Definimos el tipo expresiones booleanas.
-}
data ExpB = Var Bool | Not ExpB |Equal ExpB ExpB |
            And ExpB ExpB | Or ExpB ExpB deriving Show


{-
    Ejercicio 4.
-}

{-
    Definimos el tipo expresiones aritmeticas.
-}
data ExpA = Lit Int | Sum ExpA ExpA | Mult ExpA ExpA |
            Rest ExpA ExpA | Div ExpA ExpA | IfThEl ExpB ExpA ExpA

{-
    Modificación de Show
    para expresiones aritmeticas.
-}
instance Show ExpA where
    show (Lit x) = show x
    show (Sum exp1 exp2) = 
        "(" ++ (show exp1) ++ " + " ++ (show exp2) ++ ")"
    show (Mult exp1 exp2) = 
        "(" ++ (show exp1) ++ " * " ++ (show exp2) ++ ")"
    show (Rest exp1 exp2) = 
        "(" ++ (show exp1) ++ " - " ++ (show exp2) ++ ")"
    show (Div exp1 exp2) = 
        "(" ++ (show exp1) ++ " / " ++ (show exp2) ++ ")"

{-
    Ejercicio 5.
-}

{-
    Evalua una expresión booleana.
-}
evaluarExpB :: ExpB -> Bool
evaluarExpB (Var p) = p
evaluarExpB (Not exp) = not (evaluarExpB exp)
evaluarExpB (Equal exp1 exp2) = 
    (evaluarExpB exp1) == (evaluarExpB exp2)  
evaluarExpB (And exp1 exp2) = 
    (evaluarExpB exp1) && (evaluarExpB exp2)
evaluarExpB (Or exp1 exp2) = 
    (evaluarExpB exp1) || (evaluarExpB exp2)

{-
    Evalua una expresión aritmetica.
-}
evaluarExpA :: ExpA -> Int
evaluarExpA (Lit x) = x
evaluarExpA (Sum exp1 exp2) = 
    (evaluarExpA exp1) + (evaluarExpA exp2)
evaluarExpA (Mult exp1 exp2) = 
    (evaluarExpA exp1) * (evaluarExpA exp2)
evaluarExpA (Rest exp1 exp2) = 
    (evaluarExpA exp1) - (evaluarExpA exp2)
evaluarExpA (Div exp1 exp2) = 
    div (evaluarExpA exp1) (evaluarExpA exp2)

{-
    Cuenta los operadores de una 
    expresión booleana.
-}
contarExpB :: ExpB -> Int
contarExpB (Var _) = 0
contarExpB (Not exp) = 1 + (contarExpB exp)
contarExpB (Equal exp1 exp2) = 
    1 + (contarExpB exp1) + (contarExpB exp2)  
contarExpB (And exp1 exp2) = 
    1 + (contarExpB exp1) + (contarExpB exp2)
contarExpB (Or exp1 exp2) = 
    1 + (contarExpB exp1) + (contarExpB exp2)

{-
    Cuenta los operadores de una 
    expresión aritmetica.
-}
contarExpA :: ExpA -> Int
contarExpA (Lit _) = 0
contarExpA (Sum exp1 exp2) = 
    1 + (contarExpA exp1) + (contarExpA exp2)
contarExpA (Mult exp1 exp2) = 
    1 + (contarExpA exp1) + (contarExpA exp2)
contarExpA (Rest exp1 exp2) = 
    1 + (contarExpA exp1) + (contarExpA exp2)
contarExpA (Div exp1 exp2) = 
    1 + (contarExpA exp1) + (contarExpA exp2)

