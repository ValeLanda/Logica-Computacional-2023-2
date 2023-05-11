% a) Dos personas viven en la misma casa si tienen la misma dirección.
direccion(andres, copilco).
direccion(casandra, coyoacan).
direccion(sancho, copilco).

misma_casa(X,Y) :- direccion(X,Z), direccion(Y,Z).
 
/* Base de conocimiento y relación para ser deportista */
esdeporte(basquetbol).
esdeporte(natacion).
esdeporte(americano).

practica(andres, basquetbol).
practica(casandra, natacion).
practica(sancho, americano).

esdeportista(X) :- practica(X,Y), esdeporte(Y).

/*
 * esdeportista(casandra) = true.
 * esdeportista(sancho) = true.
 * esdeportista(luis) = false.
 * */

/* Base de conocimiento y relación para ser británico */

esgales(gwendolyn).
esingles(samantha).
esescoces(collin).
esirlandes(nolan).

esbritanico(X):- esgales(X); esescoces(X); esirlandes(X); esingles(X).

/*
 * esbritanico(kate) = false.
 * esbritanico(nolan) = true
 * */

% d) Te pueden multar si no has pagado la tenencia de tu automóvil. 
ha_pagado(andres, tenencia).
ha_pagado(casandra, luz).
ha_pagado(sancho, gas).
ha_pagado(sancho, tenencia).


pueden_multar(X) :- not(ha_pagado(X, tenencia)).


/* Funcion para saber el mayor elemento de una lista */

esmayor(A,B) :- A >= B.
mayorlista([P], P).
mayorlista([Head|Tail], Max) :- Max is Head, mayorlista([Tail],Q), esmayor(Head, Q). 
mayorlista([Head|Tail], Max) :- mayorlista([Tail],Q), Max is Q, esmayor(Q, Head).


                                                       
/* Fibonacci */
fibonacci(0,0).
fibonacci(1,1).
fibonacci(N,P) :- N>1,N1 is N-1, N2 is N-2, fibonacci(N1, P1), fibonacci(N2,P2), P is P1+P2.
/*
 * fibonacci(10,P) = 55
 * fibonacci(20,P) = 6765
 * 
 * */
