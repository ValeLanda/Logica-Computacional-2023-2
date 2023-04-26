{-1 - Crea la función eliminarVocales, que dada una cadena elimine todas las vocales de la misma y devuelva la cadena resultante. -}
eliminarVocales :: String -> String  -- se define la función eliminarVocales que toma una cadena y devuelve otra cadena sin vocales
eliminarVocales [] = []  -- si la cadena de entrada es vacía, devuelve una cadena vacía
eliminarVocales (x:xs)
  | esVocal x = eliminarVocales xs -- si el primer caracter de la cadena es una vocal, se llama recursivamente la función con el resto de la cadena
  | otherwise = x : eliminarVocales xs -- si el primer caracter no es una vocal, se añade al resultado y se llama recursivamente la función con el resto de la cadena
  where esVocal c = c `elem` "aeiouAEIOU" -- se define la función auxiliar esVocal que toma un carácter y devuelve True si es una vocal (mayúscula o minúscula)
