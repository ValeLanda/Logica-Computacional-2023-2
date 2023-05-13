# Practica 04

<<<<<<< HEAD
## Cómo abrir
Se recomienda copiar y pegar el script `Practica04.pl` en el intérprete en línea para Prolog [SWISH](https://swish.swi-prolog.org) y hacer las conslutas allí.

### Backtracking para el ejercicio 2

```prolog
maximo([1,2,3,2,1]) :- Maximo(Xs, MAX).
maximo(1|[2,3,2,1], MAX) :- 1 >= MAX, maximo([2,3,2,1], 1).
maximo(2|[3,2,1], 1) :- 2 >= 1, maximo([3,2,1], 2).
maximo(3|[2,1], 2) :- 3 >= 2, maximo([2,1], 3).
maximo(2|[1], 3) :- 2 < 3, maximo([1], 3).
maximo(1|[], 3) :- 3 >= 1, maximo([], 3).
maximo([], 3) :- print(3).
3
```

### Backtracking para el ejercicio 4

```prolog
fibonacci(5,X).
fibonacci(5,X) :-
    5 > 1
    Antecesor is 5 - 1,
    Pre_antecesor is 5 - 2,
    fibonacci(4, Fib_1),
    fibonacci(3, Fib_2),
    X is Fib_1 + Fib_2.

fibonacci(4,X) :-
    4 > 1
    Antecesor is 4 - 1,
    Pre_antecesor is 4 - 2,
    fibonacci(3, Fib_1),
    fibonacci(2, Fib_2),
    X is Fib_1 + Fib_2.

fibonacci(3,X) :-
    3 > 1
    Antecesor is 3 - 1,
    Pre_antecesor is 3 - 2,
    fibonacci(2, Fib_1),
    fibonacci(1, Fib_2),
    X is Fib_1 + Fib_2.

fibonacci(2,X) :-
    2 > 1
    Antecesor is 2 - 1,
    Pre_antecesor is 2 - 2,
    fibonacci(1, Fib_1),
    fibonacci(0, Fib_2),
    X is Fib_1 + Fib_2.

fibonacci(0,0).
fibonacci(1,1).

fibonacci(2,X) :-
    2 > 1
    Antecesor is 2 - 1,
    Pre_antecesor is 2 - 2,
    fibonacci(1, 1),
    fibonacci(0, 0),
    X is 1 + 0.

fibonacci(3,X) :-
    3 > 1
    Antecesor is 3 - 1,
    Pre_antecesor is 3 - 2,
    fibonacci(2, 1 + 0),
    fibonacci(1, 1),
    X is 1 + 1 + 0.

fibonacci(4,X) :-
    4 > 1
    Antecesor is 4 - 1,
    Pre_antecesor is 4 - 2,
    fibonacci(3, 1 + 1 + 0),
    fibonacci(2, 1 + 0),
    X is 1 + 1 + 1 + 0.

fibonacci(5,X) :-
    5 > 1
    Antecesor is 5 - 1,
    Pre_antecesor is 5 - 2,
    fibonacci(4, 1 + 1 + 1 + 0),
    fibonacci(3, 1 + 1 + 0),
    X is 1 + 1 + 1 + 1 + 1 + 0.

X = 5.
fibonacci(5,5).

```
=======
**Herramientas:**
Usaremos SWISH, puede ser en su versión online

## Objetivo:
Usando PROLOG, el alumno debe ser capaz de: representar hechos; representar ideas y conocimiento como conjuntos de expresiones conjuntivas y disyuntivas; y hacer consultas. Además, se debe tener conciencia del efecto del backtracking para llegar a una meta.

>>>>>>> de478bb378904a61c967ba84362f35fa934e75b2

**Integrantes**

- Ayala Flores Brenda (@Brendaaf2003), 319051287.
- Cervantes Duarte José Fernando (@ferchoss99), 422100827.
- Rodríguez Sanchez Alejandro Axel (@Ahexo), 315247697.
- Zavala Velazquez Natalia (@nat80t), 319155189.
