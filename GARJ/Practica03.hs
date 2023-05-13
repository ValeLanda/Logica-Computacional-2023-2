--Ejercicio 1
{-Esta función recibe una cadena (lista de caracteres)
  y verífica si la cabeza es parte de los elementos de 
  las vocales. si es así las elimina, en cualquier otro
  caso deja el caracter como estaba
-}
eliminarVocales :: String -> String
eliminarVocales [] = []
eliminarVocales (x:xs) = if x `elem` "AEIOUaeiou" then eliminarVocales xs 
						 else x : eliminarVocales xs

{-
    *Funcion auxiliar para el ejercicio 2.

    Toma en cuenta los siguientes casos:
        - Cuando su suma (valor decimal ASCII del caracter y el numero recibidos) estan en el rango de caracteres imprimibles ASCII.
        - Cuando su suma (valor decimal ASCII del caracter y el numero recibidos) no estan en el rango de caracteres imprimibles ASCII.
    Recibe un caracter y un numero.
    Devuelve el caracter ya cifrado.
-}
cifrarCaracter x y 
    | (fromEnum x) + y > 31 && (fromEnum x) + y < 127 = toEnum((fromEnum x) + y) 
    | (fromEnum x) + y >= 127 && ((fromEnum x) + y) - 127 < 127  = toEnum(32 + (((fromEnum x) + y) - 127))
    | (fromEnum x) + y <= 31 && 32 - ((fromEnum x) + y) < 32  = toEnum(127 - (32 - ((fromEnum x) + y)))
    | (fromEnum x) + y >= 127 && ((fromEnum x) + y) - 127 >= 127  = cifrarCaracter x ((fromEnum x)-y)
    | (fromEnum x) + y <= 31 && 32 - ((fromEnum x) + y) >= 32  = cifrarCaracter x ((fromEnum x)+y)
    | otherwise = x

{-
    Ejercicio 2. Aplica un cifrado Cesar a una cadena de texto dado un numero (de acuerdo al orden de los caracteres ASCII imprimibles).

    Recibe una cadena de texto y un numero.
    Devuelve una cadena de texto cifrado.
-}
cifrar "" y = ""
cifrar (x:xs) y = [cifrarCaracter x y] ++ cifrar xs y

{-
    Imprime ejemplos de uso y de composicion de la funcion cifrar.
    - Para ver los resultados ejecutar el siguiente comando en la terminal:
        runhaskell practica03.hs
-}
main = do 
    putStrLn("Ejemplos de uso de la función cifrar :")
    putStrLn("")
    putStrLn("- De uso :")
    putStr "1.- Cifraremos la palabra 'Abecedario' dado el numero '6' = "    
    print $ cifrar "Abecedario" 6
    putStr "2.- Cifraremos la palabra '_Cabo_' dado el numero '-6' = "    
    print $ cifrar "_Cabo_" (-6)
    putStr "3.- Cifraremos la cadena de texto 'Piensa, cree y atrevete' dado el numero '10' = "    
    print $ cifrar "Piensa, cree y atrevete" 10
    putStrLn("")
    putStrLn("- De composición :")
    putStrLn("1. Para aplicar la función cifrar, se requiere de dos argumentos : una cadena de texto y un numero. Por ejemplo:")
    putStrLn("cifrar \"Cab0_\" 10")
    putStrLn("2. La función cifrar lo que hace primero es tomar el primer caracter y aplicarle la función cifrarCaracter. En nuestro ejemplo anterior quedaría:")
    putStrLn("cifrarCaracter \'C\' 10")
    putStrLn("3. La función cifrarCaracter realiza el cifrado César al caracter recibido dado el número que se recibio. En nuestro ejemplo quedaría:")
    print $ cifrarCaracter 'C' 10
    putStrLn("4. De esta forma, se realiza con los demás caractéres solo si son letras del abecedario. En nuestro ejemplo quedaría:")
    print $ cifrarCaracter 'a' 10
    print $ cifrarCaracter 'b' 10
    print $ cifrarCaracter '0' 10
    print $ cifrarCaracter '_' 10
    putStrLn("4. Finaliza hasta que ya se haya aplicado a todos los caractéres el cifrado César, devolviendo la cadena de texto ya cifrado. En nuestro ejemplo quedaría:")
    print $ cifrar "Cab0_" 10

-------------------------------------------------------------------------
{-
    Ejercicio 4, inciso a). Tipos de expresiones aritmeticas, con expresiones aritmeticas Suma, Multiplicacion y Resta, la Resta es una expresion agregada.
-}
data Exp = Lit Int | Sum Exp Exp | Res Exp Exp | Mult Exp Exp
{- 
    Ejercicio 5, inciso c). Show personalizado para el tipo de dato Exp para que muestre las expresiones 
    aritmeticas con los operadores usuales.
    Ejemplo poner en la terminal : Sum (Lit 2) (Lit 2).
-}
instance Show Exp where
    show (Lit x) = show x
    show (Sum x y) = (show x) ++ " + " ++ (show y)
    show (Res x y) = (show x) ++ " - " ++ (show y)
    show (Mult x y) = (show x) ++ " * " ++ (show y)

--Ejercicio 3. Tipos de expresiones booleanas, con literales booleanas Equal, Not y And.
data ExpB = Cero | Uno | Equal ExpB ExpB | Not ExpB | And ExpB ExpB deriving(Eq,Show)

{-
    Ejercicio 4, inciso b. Funcion que dada una expresion booleana del tipó ExpB, si esta es Uno entonces devuelve la primer expresion aritmetica dada,
    sino devuelve la segunda expresion aritmetica dada.

    Recibe una expresion booleana del tipo ExpB y dos expresiones aritmeticas del tipo Exp.
    Devuelve una expresion aritmetica.
-}
ifThEl :: ExpB -> Exp -> Exp -> Exp
ifThEl x y z = if (evalB x) == Uno then y else z

{-
    Ejercicio 5, inciso a). Funcion que evalua expresiones aritmeticas dadas con los operadoes definidos en el tipo de dato Exp.

    Recibe una expresion aritmetica del tipo Exp.
    Devuelve un entero.
-}
evalExp :: Exp -> Int
evalExp (Lit x) = x
evalExp (Sum x y) = (evalExp x) + (evalExp y)
evalExp (Res x y) = (evalExp x) - (evalExp y)
evalExp (Mult x y) = (evalExp x) * (evalExp y)

{-
    Ejercicio 5, inciso b). Funcion que cuenta el numero de operadores aritmeticos de una expresion aritmetica dada definidos en el tipo de dato Exp.

    Recibe una expresion aritmetica del tipo Exp.
    Devuelve un entero.
-}
contarExp :: Exp -> Int
contarExp (Lit x) = 0
contarExp (Sum x y) = 1 + (contarExp x) + (contarExp y)
contarExp (Res x y) = 1 + (contarExp x) + (contarExp y)
contarExp (Mult x y) = 1 + (contarExp x) + (contarExp y)

{-
    Ejercicio 5, inciso a). Funcion que evalua expresiones booleanas dadas con los operadoes definidos en el tipo de dato ExpB.

    Recibe una expresion booleana del tipo ExpB.
    Devuelve una expresion booleana del tipo ExpB.
-}
evalB :: ExpB -> ExpB
evalB Cero = Cero
evalB Uno = Uno
evalB (Equal x y) = if (evalB x) == (evalB y) then Uno else Cero
evalB (Not x) = if evalB x == Uno then Cero else Uno
evalB (And x y) = if evalB x == Uno && evalB y == Uno then Uno else Cero

{-
    Ejercicio 5, inciso b). Funcion que cuenta el numero de operadores booleanos de una expresion booleana dada definidos en el tipo de dato ExpB.

    Recibe una expresion booleana del tipo ExpB.
    Devuelve un entero.
-}
contarExpB :: ExpB -> Int
contarExpB Cero = 0
contarExpB Uno = 0
contarExpB (Equal x y) = 1 + (contarExpB x) + (contarExpB y)
contarExpB (Not x) = 1 + (contarExpB x)
contarExpB (And x y) = 1 + (contarExpB x) + (contarExpB y)