--Crea la funcion eliminarVocales, que dada una cadena elimine todas las
--vocales de la misma y devuelve la cadena resultante.

eliminarVocales :: String -> String
eliminarVocales [] = []
eliminarVocales (x:xs) = if x `elem` "aeiouAEIOU" then eliminarVocales xs else x : eliminarVocales xs

--Crea una función llamada cifrar, que reciba una cadena de texto y un
--número, y que aplique un cifrado César. Incluir ejemplos de uso, y de composición.

--Tenemos que el cifrado Cesar es que cada letra en el texto original es reemplazada
--por otra letra que se encuentra n posiciones más adelante en el alfabeto, por ejemplo
--la palabra "planta" con un desplazamiento 2 va a ser reemplazada por "rncpvc", si tenemos
--un desplazamiento de 4 tenemos que es "tperxe"
--si tenemos "sabueso" con un desplazamiento de 3 tenemos que es "vdehxvr"
cifrar :: String -> Int -> String
cifrar [] _ = []
cifrar (x:xs) n = if x `elem` ['a'..'z'] then (toEnum (fromEnum 'a' + (mod ((fromEnum x) - (fromEnum 'a') + n) 26))) : cifrar xs n else x : cifrar xs n