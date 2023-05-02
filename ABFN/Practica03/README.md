# Practica 03

## Cómo abrir
Se asume que se cuenta con el compilador GHC para Haskell y el entorno GHCI instalados. Para mas información, refierase a los medios de instalación facilitados en [Haskell.org](https://www.haskell.org/get-started/). Para esta practica se está usando la versión 9.2.5 de GHCi.

1. Abrir un entorno de GHCi en una terminal con el comando `env ghci` en el mismo directorio que el archivo `Practica02.hs`(este podría variar dependiendo cómo se instaló Haskell).
2. Cargar el programa con el comando `:l Practica03.hs`, debería saltar un diálogo confirmando que este se compiló y cargó correctamente.
3. A partir de aqui, ya se pueden hacer las interacciones o pruebas unitarias necesarias.

**Ejemplo de interacción:**

```
- > eliminarVocales "Hola mundo"
```

```
- > cifrar "Hola mundo" 3
```

```
- > eval (Sum (Lit 2) (Mult (Lit 3) (Lit 4))) 
```

```
- > cuentaOpeExp (Sum (Lit 2) (Mult (Lit 3) (Lit 4)))
```

```
- > evalB (Or (Equal V F) (Not (Equal V V)))
```

```
- > cuentaOpeExpB (Or (Equal V F) (Not (Equal V V)))
```

```
- > Mult(Sum(Lit 2)(Lit 3))(Sum(Lit 4)(Lit 5))
```

**Integrantes**

- Ayala Flores Brenda (@Brendaaf2003), 319051287.
- Cervantes Duarte José Fernando (@ferchoss99), 422100827.
- Rodríguez Sanchez Alejandro Axel (@Ahexo), 315247697.
- Zavala Velazquez Natalia (@nat80t), 319155189.
