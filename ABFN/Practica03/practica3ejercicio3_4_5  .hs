-- Tipos expresiones aritméticas y lógicas


data ExpB = V | F | Or ExpB ExpB 
            | Equal ExpB ExpB -- Igualdad
            | Not ExpB -- Negación
            | And ExpB ExpB -- Conjunción   
            deriving Show


-- El dato Exp no deriva de Show , porque mas abajo se hace una instancia de Show hacia Exp
data Exp = Lit Int | Sum Exp Exp | Mult Exp Exp | Expo Exp Exp 
            | IfThEl ExpB Exp Exp   


-- Le asigna un valor entero al dato Exp
-- mediante recursión 
eval :: Exp -> Int
eval (Lit x) = x
eval (Sum( x) (y))  = eval(x)+ eval (y)
eval (Mult( x) ( y))  = eval( x)* eval ( y)
eval (Expo( x) ( y))  = eval( x) ^ eval ( y)


-- Solo cuanta operadores por eso en los numeros (casos base) ahi 
-- deja de contar los operadores 
cuentaOpeExp :: Exp -> Int
cuentaOpeExp (Lit x) = 0
cuentaOpeExp (Sum x y) = 1+ cuentaOpeExp(x) + cuentaOpeExp (y) 
cuentaOpeExp (Mult x y) = 1+ cuentaOpeExp(x) + cuentaOpeExp (y) 
cuentaOpeExp (Expo x y) = 1+ cuentaOpeExp(x) + cuentaOpeExp (y) 


-- Se le asigna un valor booleano a los datos ExpB
--tambien de forma recursiva
evalB :: ExpB -> Bool
evalB V = True
evalB F = False
evalB (Or x y) = if ((  (evalB x) == False ) && ( (evalB y )== False)  ) then False else True
evalB (And x y) = if ((  (evalB x) == True ) && ( (evalB y )== True)  ) then True else False
evalB (Not x) = if(evalB x == True ) then False else True
evalB (Equal x y )= if ( (evalB x) == (evalB y) ) then True else False


cuentaOpeExpB :: ExpB -> Int 
cuentaOpeExpB V = 0
cuentaOpeExpB F = 0
cuentaOpeExpB (Or x y) = 1+ cuentaOpeExpB(x) + cuentaOpeExpB (y) 
cuentaOpeExpB (And x y) = 1+ cuentaOpeExpB(x) + cuentaOpeExpB (y) 
cuentaOpeExpB (Equal x y) = 1+ cuentaOpeExpB(x) + cuentaOpeExpB (y) 
cuentaOpeExpB (Not x)  = 1+ cuentaOpeExpB(x) 


--Se utiliza la instancia para modificar la forma en la que actua Show sobre
--el dato Exp y esto se realiza para que al introducir un dato Exp , se muestre
--como una operación aritmetica normal .
instance Show Exp where
     show (Lit x) = show x
     show (Sum x y) = show x ++  "+" ++  show y
     show (Mult x y) = show x ++ "*" ++  show y
     show (Expo x y) = show x ++  "^" ++ show y
     show (IfThEl b x y) = "nulo" 
