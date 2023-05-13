/* Ejercicio 1)
 * Primero creamos nuestra base de conocimientos: */
vive_en(arsenio, ciudadPeluche20).
vive_en(arturo, alburquerque3).
vive_en(asahel, comala9).
vive_en(alan, ciudadNimbasa4).
vive_en(julieta, comala9).
vive_en(uziel, alburquerque3).
practica(uziel, clavados).
practica(beto, futbol_americano).
practica(eduardo, basquetbol).

/*a) Dos personas viven en la misma casa si tienen la misma dirección. 
 *  Esto ocurre si dos personas distintas viven en el mismo lugar.
 * */
viven_misma_casa(Persona1, Persona2) :- vive_en(Persona1, Lugar), vive_en(Persona2, Lugar), Persona1\=Persona2.

/* b) Los que juegan basquetbol o fútbol americano son deportistas.
 * Esto ocurre si la persona en cuestión juega básquetbol o en su defecto, juega fútbol americano.
 * */
es_deportista(Persona) :- practica(Persona,basquetbol); practica(Persona,futbol_americano).

