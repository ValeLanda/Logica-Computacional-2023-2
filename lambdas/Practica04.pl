

direccion(p1, direccion1).
direccion(p2, direccion1).


vivenJuntos(X, Y, Z):-
    direccion(X, Z),
    direccion(Y, Z).

    juegaFut(x).
    juegaBasquet(y).
    esDeportista(X):-
    juegaFut(X) | juegaBasquet(X).

    dist([], 0).
    dist([Head | Tail], Num):-

    (inList(Tail, Head)->
     dist(Tail, NT),
     Num is NT;
     dist(Tail, NT),
        Num is NT+1
     
    )    .

    inList([X|_], X).
    inList([_|XS], A):- inList(XS,A).
    
