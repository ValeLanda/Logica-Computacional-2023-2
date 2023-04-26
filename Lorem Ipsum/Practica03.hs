module Practica03 where

{-1 - Crea la función eliminarVocales, que dada una cadena elimine todas las vocales de la misma y devuelva la cadena resultante. -}
eliminarVocales :: String -> String  -- se define la función eliminarVocales que toma una cadena y devuelve otra cadena sin vocales
eliminarVocales [] = []  -- si la cadena de entrada es vacía, devuelve una cadena vacía
eliminarVocales (x:xs)
  | esVocal x = eliminarVocales xs -- si el primer caracter de la cadena es una vocal, se llama recursivamente la función con el resto de la cadena
  | otherwise = x : eliminarVocales xs -- si el primer caracter no es una vocal, se añade al resultado y se llama recursivamente la función con el resto de la cadena
  where esVocal c = c `elem` "aeiouAEIOU" -- se define la función auxiliar esVocal que toma un carácter y devuelve True si es una vocal (mayúscula o minúscula)

{-2 - Crea una función llamada cifrar, que reciba una cadena de texto y un número, y que aplique un cifrado César. Incluir ejemplos de uso, y de composición. -}
cifrar :: String -> Int -> String  -- se define la función cifrar que toma una cadena y un número entero, y devuelve otra cadena cifrada
cifrar "" _ = ""  -- si la cadena de entrada es vacía, devuelve una cadena vacía
cifrar (x:xs) n = desplazarLetra x n : cifrar xs n  -- se aplica la función desplazarLetra al primer caracter de la cadena y se concatena con el resultado de aplicar recursivamente la función a los demás caracteres de la cadena
  where
    desplazarLetra letra n = toEnum ((fromEnum letra - fromEnum 'a' + n) `mod` 26 + fromEnum 'a') :: Char -- se define la función auxiliar desplazarLetra que toma un carácter y un número entero, y devuelve el carácter resultante de desplazar la letra hacia la derecha en el alfabeto un número de posiciones dado por el segundo parámetro
    {-Algunos ejemplos de uso de la función cifrar: serian
    cifrar "hola" 3; que da como salida "krod"
    cifrar "hola" 10; que da como salida "ryvk"
    cifrar "hola" (-3); que da como salida "edix"
    En cuanto a la composición de funciones, se pueden combinar varias funciones para crear una expresión más compleja. 
    Por ejemplo, se podría utilizar la función cifrar en combinación con la función length para cifrar una cadena de texto y luego imprimir su longitud cifrada:
    length (cifrar "hola" 3); que da como salida 4
    Aquí, se cifra la cadena de texto "hola" utilizando la función cifrar con un desplazamiento de 3. 
    Luego, se utiliza la función length para obtener la longitud de la cadena cifrada. El resultado es 4, que es la longitud de la cadena cifrada "krod". -}
