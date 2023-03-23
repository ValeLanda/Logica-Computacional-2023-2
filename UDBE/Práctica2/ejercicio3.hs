data Digbinario = Cero | Uno

data Numbinario = Numbinario [Digbinario]

sumNumbinario :: Numbinario -> Numbinario -> Numbinario
sumNumbinario (Numbinario bs1) (Numbinario bs2) = Numbinario (aBinario bs1 bs2)
  where
    aBinario [] bs2 = bs2
    aBinario bs1 [] = bs1
    aBinario (b1:bs1) (b2:bs2) = case (b1, b2) of
      (Cero, Cero) -> Cero : aBinario bs1 bs2
      (Uno, Cero) -> Uno : aBinario bs1 bs2
      (Cero, Uno) -> Uno : aBinario bs1 bs2
      (Uno, Uno) -> Cero : aBinario (aBinario [Uno] bs1) bs2

