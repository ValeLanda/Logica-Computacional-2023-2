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
nacionalidad(arsenio, titirilcano).
nacionalidad(arturo, escoces).
nacionalidad(asahel, irlandes).
nacionalidad(uziel, newjersey).
nacionalidad(alan, gales).
nacionalidad(julieta, ingles).
pago_tenencia(arsenio, no).
pago_tenencia(arturo, no).
pago_tenencia(asahel, si).
pago_tenencia(uziel, si).
pago_tenencia(julieta, si).
pago_tenencia(alan, no).
/*a) Dos personas viven en la misma casa si tienen la misma dirección. 
 *  Esto ocurre si dos personas distintas viven en el mismo lugar.
 * */
viven_misma_casa(Persona1, Persona2) :- vive_en(Persona1, Lugar), vive_en(Persona2, Lugar), Persona1\=Persona2.

/* b) Los que juegan basquetbol o fútbol americano son deportistas.
 * Esto ocurre si la persona en cuestión juega básquetbol o en su defecto, juega fútbol americano.
 * */
es_deportista(Persona) :- practica(Persona,basquetbol); practica(Persona,futbol_americano).


/* c) Eres británico si eres galés, inglés, escocés o irlandés. (Si la nacionalidad de la persona coincide con alguna de las anteriores).*/
es_britanico(Persona) :- nacionalidad(Persona, ingles).
es_britanico(Persona) :- nacionalidad(Persona, gales).
es_britanico(Persona) :- nacionalidad(Persona, escoes).
es_britanico(Persona) :- nacionalidad(Persona, irlandes).

/* d) Te pueden multar si no has pagado la tenencia de tu automóvil. (Si el pago de la tenencia esta marcagada como no pagada).*/
multa(Persona):- pago_tenencia(Persona, no).
