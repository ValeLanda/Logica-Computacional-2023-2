--Modulo: MisFunciones
module MisFunciones where
    constante x = 10
    
    identidad :: Num a => a -> a
    identidad x = x

    cuadrado x = x*x

    diferenciaPositiva x y = if x > y then x-y else y-x

    factorial 0 = 1
    factorial n = n * factorial(n-1)