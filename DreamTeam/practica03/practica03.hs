{-# LANGUAGE MultiParamTypeClasses, FunctionalDependencies  #-}

{- |
Module      :  Practica03
Description :  Modulo correspondiente a la practica 3 del curso de logica computacional.
Copyright   :  (c) DreamTeam : Demetrio Yanahi, Caballero Emilio, Rodriguez Lázaro

Maintainer  :  lazaro.rodriguez@ciencias.unam.mx
Stability   :  stable
-}
module Practica03 where 

    
    -- * Función que elimina las vocales de un string.
    eliminarVocales :: String -> String
    eliminarVocales [] = []
    eliminarVocales (x:xs) = if esVocal x then eliminarVocales xs else x:eliminarVocales xs

    
    -- | *  Función que devuelve si un char es una vocal.
    --    Para lo anterior se usa la función case con tanto la versión
    --    minuscula como mayuscula de cada vocal.
    esVocal :: Char -> Bool
    esVocal letra = case letra of
                        'a' -> True
                        'e' -> True
                        'i' -> True
                        'o' -> True
                        'u' -> True
                        'A' -> True
                        'E' -> True
                        'I' -> True
                        'O' -> True
                        'U' -> True
                        _ -> False

    
    -- | * Función que cifra una cadena usando el cifrado cesar tradicional
    --    aplicandolo unicamente a letras del abcdeario.
    cifrado :: String -> Int -> String
    cifrado [] _ = []
    cifrado (x:xs) a = cifrarChar x a : cifrado xs a                 


    
    -- | * Función que cifra un char usando el cifrado cesar tradicional
    --    aplicandolo unicamente a letras del abcdeario según el codigo ascii
    --    es decir no se cuenta ñ ni ll.
    cifrarChar :: Char -> Int -> Char
    cifrarChar a x
            | val >= 97 && val <= 122 = if val + cesarVal > 122 then (toEnum (mod (val + cesarVal) 122 + 96)::Char) else (toEnum (val + cesarVal)::Char)
            | val >= 65 && val <= 90  = if val + cesarVal > 90  then (toEnum (mod (val + cesarVal) 90 + 64)::Char) else (toEnum (val + cesarVal)::Char)
            where 
                val      = fromEnum a
                cesarVal = mod x 25
    
    -- ** Tipo de dato que simula una expresión booleana.
    data ExpB 
                -- | Definimos las literales Booleanas como True o False es decir
                -- Los valores predefinidos del tipo bool.
                = Cons Bool 
                -- | Negación de la expresión booleana dada como parametro.
                | Not ExpB
                -- | Conjunción de las expresiones booleanas dadas como parametro.
                | And ExpB ExpB 
                -- | Si y solo si entre las expresioness dadas como parametro.
                | Equal ExpB ExpB

    -- ** Tipo de dato que simula una expresión aritmetica.
    data Exp 
                = Lit Int 
                | Sum Exp Exp 
                | Mult Exp Exp 
                -- | El primer argumento es elevado al valor de evaluar el segundo argumento.
                | Pot Exp Exp 
                -- | Constuctor equivalente al operador ternario en otros lenguajes de programación.
                | IfThEl ExpB Exp Exp

    -- * Clase pera implementar el polimorfirsmo ad hoc para de esta forma
    -- tener dos metodos que se llamen igual, en este caso eval y contar, pero que sin 
    -- embargo reciben argumentos distintos e incluso nos devuelven tipos distintos.
    class Expresion a b | a -> b where
            -- Metodo que evalua un tipo de expresión boolena o aritmetica.
            eval :: a -> b
            -- Metodo que cuenta la cantidad de operadores en una expresión.
            contar :: a -> Int
            
    instance Expresion ExpB Bool where
            eval (Cons  x)   = x
            eval (Not   x)   = not (eval x) 
            eval (And x y)   = (eval x) && (eval y)
            eval (Equal x y) = (eval x) == (eval y)
            
            contar (Cons  x)   = 0
            contar (Not   x)   = 1 + (contar x) 
            contar (And x y)   = 1 + (contar x) + (contar y)
            contar (Equal x y) = 1 + (contar x) + (contar y)

    instance Expresion Exp Int where
            eval (Lit   x)     = x
            eval (Sum  x y)     = (eval x) + (eval y) 
            eval (Mult x y)     = (eval x) * (eval y)
            eval (Pot  x y)     = (eval x) ^ (eval y)
            eval (IfThEl x y z) = if eval x then eval y else eval z

            contar (Lit   x)     = 0
            contar (Sum  x y)     = 1 + (contar x) + (contar y) 
            contar (Mult x y)     = 1 + (contar x) + (contar y)
            contar (Pot  x y)     = 1 + (contar x) + (contar y)
            contar (IfThEl x y z) = 1 + (contar y) + (contar z)


    instance Show Exp where
        show (Lit    x) = show x
        show (Sum  x y) = show x ++  "+" ++  show y
        show (Mult x y) = show x ++ "*" ++  show y
        show (Pot  x y) = show x ++  "^" ++ show y
        show (IfThEl x y z) = show x ++ "?" ++ show y ++ ":" ++ show z 

    instance Show ExpB where
        show (Cons  x)   = show x
        show (Not   x)   = "!" ++ show x 
        show (And x y)   = show x ++ "^" ++ show y
        show (Equal x y) = show x ++ "<=>" ++ show y
