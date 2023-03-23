module Practica02 where

    data DigBinario = Cero | Uno deriving (Show, Enum, Eq)
    type NumBinario  = [DigBinario]


    suma :: NumBinario -> NumBinario -> NumBinario
    suma n [] = n
    suma [] n = n
    suma n m = if last n == Cero || last m == Cero then suma (init n) (init m) ++ [sumaDig (last n) (last m)] else suma (suma (init n) [Uno]) (init m) ++ [Cero]

    sumaDig :: DigBinario -> DigBinario -> DigBinario
    sumaDig Cero Cero = Cero
    sumaDig n m = Uno
