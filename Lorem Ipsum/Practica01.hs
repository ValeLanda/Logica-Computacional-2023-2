module Practica01 where

    --Esta función recibe un entero y regresa la lista con todos los divisores del número
    divisores :: Integer -> [Integer]
    -- Se checarán todos los número entre 1 y n y si el módulo de n por x es 0, entonces este será un divisor
    -- nótese que el 1 y n siempre serán divisores (esto nos servira para la función primos)
    divisores n = [x | x <- [1..n], n `mod` x == 0]

    -- Esta función recibe un entero y regresa todos los primos desde 0 hasta ese número
    --primos :: Integer -> [Integer]
    -- Se checarán todos los números entre 1 y n y en los casos en los que la lista sea sólo el 1 y n mismo 
    -- tendremos que ese número es primo
    --primos n = [n]

    -- Esta función recibira una función y una lista y regresará una lista donde la función ha sido aplicada a
    -- todos los elementos de la lista
    aplica func [] = []
    aplica func (x:xs) = func x : aplica func xs