-- Practica 03

-- Equipo KFP
-- Jose Camilo Garcia Ponce 319210536


{-|
  La funcion eliminarVocales elimina las vocales de una cadena de caracteres
  Toma un argumento de tipo 'String', la cadena de caracteres
  Retorna un valor de tipo 'String', la cadena de caracteres sin vocales
  La funcion tiene un caso base, la cadena vacia
  En el caso recursivo se verifica si el primer caracter de la cadena es una vocal, si lo es se elimina, si no se deja
-}
eliminarVocales :: String -> String
eliminarVocales [] = []
eliminarVocales (x:xs) = eliminarVocal ++ eliminarVocales xs
                         where eliminarVocal = if (elem x "aeiouAEIOU") then "" else [x]


{-|
  La funcion cifrar realiza un cifrado Cesar a una cadena de caracteres
  La cadena recibida debe contener solo letras y espacios
  La cadena regresada contiene solo letras mayusculas y espacios
  El cifrado Cesar consiste en desplazar cada letra n posiciones en el alfabeto
  Toma dos argumentos, el primero es de tipo 'String', la cadena de caracteres a cifrar, y el segundo es de tipo 'Int', el numero de posiciones a desplazar
  Retorna un valor de tipo 'String', la cadena de caracteres cifrada
  El caso base es la cadena vacia
  Si no es la cadena vacia, se convierte la cadena a mayusculas y se llama a la funcion auxiliar 'cifrarAux'
  'cifrarAux' va cifrando letra por letra, respetando los espacios, se cifra convirtiendo la letra a un numero, sumandole n y convirtiendo el resultado a una letra
  Ejemplo: cifrar "hola mundo" 3 = "KROD PXQGR"
  Ejemplo: cifrar "el patito se llama Pedro" 12 = "QX BMFUFA EQ XXMYM BQPDA"
  Ejemplo: cifrar "el patito se llama Pedro" 0 = "EL PATITO SE LLAMA PEDRO"
  Ejemplo: cifrar "todos los gatos son bonitos" 26 = "TODOS LOS GATOS SON BONITOS"
  Ejemplo: cifrar "todos los gatos son bonitos" 27 = "UPEPT MPT HBUPT TPO CPOJUPT"
-}
cifrar :: String -> Int -> String
cifrar [] _ = []
cifrar (x:xs) n = cifrarAux y n
                  where y = mayusculas (x:xs)

{-|
    Funcion auxiliar para cifrar una cadena de caracteres
    Va cifrando letra por letra, respetando los espacios
-}
cifrarAux :: String -> Int -> String
cifrarAux [] _ = []
cifrarAux (' ':xs) n = " " ++ cifrarAux xs n
cifrarAux (x:xs) n = numeroLetra (mod (letraNumero x + n) 26) : cifrarAux xs n

{-|
    Funcion auxiliar para convertir una cadena de caracteres a mayusculas
    Respetando los espacios
-}
mayusculas :: String -> String
mayusculas [] = []
mayusculas (' ':xs) = " " ++ mayusculas xs
mayusculas (x:xs) = convertirMayuscula x : mayusculas xs

{-|
    Funcion auxiliar para convertir una letra a mayuscula
-}
convertirMayuscula :: Char -> Char
convertirMayuscula a = if (97 <=  c && c <= 122) then toEnum (c-32) else if (65 <= c && c <= 90) then toEnum c else error "No es una letra"
                       where c = fromEnum a

{-|
    Funcion auxiliar para convertir una letra a un numero
    La letra debe ser mayuscula
-}
letraNumero :: Char -> Int
letraNumero a = if (65 <= c && c <= 90) then c-65 else error "No es una letra"
                where c = fromEnum a

{-|
    Funcion auxiliar para convertir un numero a una letra
    La letra obtenida es mayuscula
-}
numeroLetra :: Int -> Char
numeroLetra a = if (0 <= a && a <= 26) then toEnum (a+65) else error "No es un numero"


{-|
    Tipo de dato para representar expresiones booleanas
-}
data BExp = V | F | Or BExp BExp | And BExp BExp | Not BExp

{-|
    Forma de mostrar las expresiones booleanas
-}
instance Show BExp where
    show V = "V"
    show F = "F"
    show (Or a b) = "(" ++ show a ++ " ∨ " ++ show b ++ ")"
    show (And a b) = "(" ++ show a ++ " ∧ " ++ show b ++ ")"
    show (Not a) = "¬" ++ show a

{-|
  La funcion evalB evalua una expresion booleana
  Toma un argumento de tipo 'BExp', la expresion booleana
  Retorna un valor de tipo 'Bool', el resultado de evaluar la expresion booleana
  La funcion tiene un caso base, las expresiones V y F
  Los casos recursivos son para las expresiones Or, And y Not
-}
evalB :: BExp -> Bool
evalB V = True
evalB F = False
evalB (Or a b) = evalB a || evalB b
evalB (And a b) = evalB a && evalB b
evalB (Not a) = not (evalB a)

{-|
  La funcion contarB cuenta el numero de operadores de una expresion booleana
  Toma un argumento de tipo 'BExp', la expresion booleana
  Retorna un valor de tipo 'Int', el numero de operadores de la expresion booleana
  La funcion tiene un caso base, las expresiones V y F
  Los casos recursivos son para las expresiones Or, And y Not
-}
contarB :: BExp -> Int
contarB V = 0
contarB F = 0
contarB (Or a b) = 1 + contarB a + contarB b
contarB (And a b) = 1 + contarB a + contarB b
contarB (Not a) = 1 + contarB a


{-|
    Tipo de dato para representar expresiones aritmeticas
-}
data Exp = Lit Int | Sum Exp Exp | Mult Exp Exp | Res Exp Exp | IfThEl BExp Exp Exp

{-|
    Forma de mostrar las expresiones aritmeticas
-}
instance Show Exp where
    show (Lit a) = show a
    show (Sum a b) = "(" ++ show a ++ " + " ++ show b ++ ")"
    show (Mult a b) = "(" ++ show a ++ " * " ++ show b ++ ")"
    show (Res a b) = "(" ++ show a ++ " - " ++ show b ++ ")"
    show (IfThEl a b c) = "if " ++ show a ++ " then " ++ show b ++ " else " ++ show c

{-|
  La funcion eval evalua una expresion aritmetica
  Toma un argumento de tipo 'Exp', la expresion aritmetica
  Retorna un valor de tipo 'Int', el resultado de evaluar la expresion aritmetica
  La funcion tiene un caso base, la expresion Lit
  Los casos recursivos son para las expresiones Sum, Mult, Res e IfThEl
-}
eval :: Exp -> Int
eval (Lit x) = x
eval (Sum a b) = eval a + eval b
eval (Mult a b) = eval a * eval b
eval (Res a b) = eval a - eval b
eval (IfThEl a b c) = if (evalB a) then eval b else eval c

{-|
  La funcion contar cuenta el numero de operadores de una expresion aritmetica
  Toma un argumento de tipo 'Exp', la expresion aritmetica
  Retorna un valor de tipo 'Int', el numero de operadores de la expresion aritmetica
  La funcion tiene un caso base, la expresion Lit
  Los casos recursivos son para las expresiones Sum, Mult, Res e IfThEl
-}
contar :: Exp -> Int
contar (Lit _) = 0
contar (Sum a b) = 1 + contar a + contar b
contar (Mult a b) = 1 + contar a + contar b
contar (Res a b) = 1 + contar a + contar b
contar (IfThEl a b c) = 1 + contarB a + contar b + contar c

