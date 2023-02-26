-- 9. eliminaRepetidos, recibe como parámetro una lista y devuelve la
-- lista sin repetidos.
eliminaRepetidos :: Eq a => [a] -> [a]
eliminaRepetidos [] = []
eliminaRepetidos (x:xs)
  | elem x xs = eliminaRepetidos xs
  | otherwise = x:eliminaRepetidos xs

-- 10. ackermann
ackermann :: Int -> Integer -> Integer
ackermann 0 n = n + 1
ackermann m 0 = ackermann (m - 1) (1)
ackermann m n = ackermann (m - 1) (ackermann (m) (n - 1))
