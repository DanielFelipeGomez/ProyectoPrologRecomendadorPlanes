main(Actividad) :-
    write('Cuanto tiempo tiene? (hora,minutos)'),
    read((Hora,Minutos)),
	Tiempo is Hora*60 + Minutos,
    write('Cuanto dinero desea gastar? '),
    read(Dinero),
    write('Cuantas personas? '),
    read(Personas),
    write('Con quien es el plan? (familia/amigos/pareja) '),
    read(Grupo),
    recomendar_plan(Tiempo,Dinero,Personas, Grupo, Actividad).

%BASE DE CONOCIMIENTO DE PLANES
actividad(1, 'Hacer un puzzle juntos').
actividad(2, 'Jugar a algún juego de mesa').
actividad(3, 'Inventar un juego juntos para poder hacerlo después').
actividad(4, 'Compartir un rato de lectura o leer el mismo libro').
actividad(5, 'Contarse historias y recuerdos de pequeños').
actividad(6, 'Compartir una buena conversación mientras escucháis música').
actividad(7, 'Planear un viaje y fantasear con los detalles').
actividad(8, 'Realizar manualidades para casa o para hacer regalos').
actividad(9, 'Aprender a hacer algo juntos').
actividad(10, 'Montar un mueble para casa').
actividad(11, 'Pintar alguna pared o habitación').
actividad(12, 'Plantar cosas juntos, jugar a la jardinería').
actividad(13, 'Compartir el hobby de los bonsáis').
actividad(14, 'Cocinar juntos, cocinar platos que se hagan mejor entre dos').
actividad(15, 'Hacer la compra juntos en un mercado').
actividad(16, 'Sentarse en la terraza a disfrutar de un buen aperitivo').
actividad(17, 'Invitar a una pareja de amigos a cenar').
actividad(18, 'Preparar una fiesta para amigos o familiares').
actividad(19, 'Comenzar y seguir una serie juntos').
actividad(20, 'Ver una película con palomitas en casa').
actividad(21, 'Ver monólogos en internet').
actividad(22, 'Crear una lista de música').
actividad(23, 'Hacer un vídeo o un reportaje de fotos').
actividad(24, 'Crear un álbum de vuestros viajes').
actividad(25, 'Jugar a la videoconsola').
actividad(26, 'Crear un blog juntos (sobre viajes, cocina…)').
actividad(27, 'Cantar juntos con algún instrumento').
actividad(28, 'Danza contemporánea en pareja').
actividad(29, 'Poner música y dejarse llevar por ésta').
actividad(30, 'Modelar arcilla juntos').
actividad(31, 'Dibujar o pintar un lienzo en pareja').
actividad(32, 'Hacer un collage que represente vuestra relación').
actividad(33, 'Planear juntos una cita perfecta y llevarla a cabo ese día o en otro momento').
actividad(34, 'Daros una ducha o compartir un baño juntos').
actividad(35, 'Preparar una cena romántica').
actividad(36, 'Realizar una sesión fotográfica, fotografiarse el uno al otro').
actividad(37, 'Compartir algún sueño/proyecto').
actividad(38, 'Escribir un relato erótico para leerlo después').
actividad(39, 'Respirar juntos, realizar ejercicios tántricos').
actividad(40, 'Hacer yoga en pareja (con o sin ropa, vosotros decidís)').
actividad(41, 'Hacerse masajes conjuntamente, relajantes y/o excitantes').
actividad(42, 'Dibujar en el cuerpo del otro con pinturas para cuerpo').
actividad(43, 'Explorar todos los sentidos en pareja (con un pañuelo, unas frutas, aromas…)').
actividad(44, 'Innovar y descubrir cosas nuevas en la sexualidad').
actividad(45, 'Tener sexo').
actividad(46, 'Dar un paseo o caminar con algún objetivo (encontrar un lugar donde ver una bonita puesta de sol, terminar en un bar con encanto, llegar a algún monumento o lugar simbólico, etc.)').
actividad(47, 'Salir a fotografiar, puede ser con un propósito o con algún tema en particular').
actividad(48, 'Pasear y cuidar una mascota').
actividad(49, 'Ir a la playa (conocer nuevas calas o playas, hacer snorkel, etc.)').
actividad(50, 'Ir al cine').
actividad(51, 'Visitando algún lugar interesante de la ciudad (museos, exposiciones, etc.)').
actividad(52, 'Ir al teatro o al concierto').
actividad(53, 'Asistir a algún evento deportivo').
actividad(54, 'Ir a un parque acuático o una piscina').
actividad(55, 'Hacer un picnic').
actividad(56, 'Ir a un parque de atracciones').
actividad(57, 'Hacer una escapada de fin de semana').
actividad(58, 'Asistir a algún evento cultural (festivales, ferias, etc.)').
actividad(59, 'Ir a un parque temático o un parque de atracciones al aire libre').
actividad(60, 'Hacer una actividad al aire libre (senderismo, montañismo, etc.)').
actividad(61, 'Ir a un parque de aventuras o una pista de karting').
actividad(62, 'Realizar alguna actividad acuática (surf, submarinismo, etc.)').
actividad(63, 'Ir a un parque de animales').
actividad(64, 'Asistir a un espectáculo de magia o una obra de teatro').
actividad(65, 'Ir a un mercadillo o feria artesanal').


% RECOMENDADOR DE PLANES
recomendar_plan(Tiempo, Dinero, Personas, Grupo, Actividad) :-
    actividad(Id, Actividad),
    se_ajusta_grupo(Id, Grupo),
    se_ajusta_presupuesto(Id, Dinero),
    se_ajusta_tiempo(Id, Tiempo),
    se_ajusta_personas(Id, Personas).

% REGLAS AUX DE APROPIADO A GRUPO
se_ajusta_grupo(Id, familia) :- actividad_para_familia(Id).
se_ajusta_grupo(Id, amigos) :- actividad_para_amigos(Id).
se_ajusta_grupo(Id, pareja) :- actividad_para_pareja(Id).

% REGLAS AUX DE PRESUPUESTO
se_ajusta_presupuesto(Id, Dinero) :-
    costo_de(Id, Costo),
    Costo =< Dinero.

% REGLAS AUX DE TIEMPO
se_ajusta_tiempo(Id, Tiempo) :-
    tiempo_de(Id, TiempoRequerido),
    TiempoRequerido =< Tiempo.

% REGLAS AUX DE PERSONAS
se_ajusta_personas(Id, Personas) :-
    personas_necesarias(Id, NumPersonas),
    NumPersonas =< Personas.

% TIEMPO QUE TARDA CADA ACTIVIDAD
tiempo_de(1, 30).
tiempo_de(2, 40).
tiempo_de(3, 60).
tiempo_de(4, 30).
tiempo_de(5, 90).
tiempo_de(6, 70).
tiempo_de(7, 45).
tiempo_de(8, 120).
tiempo_de(9, 70).
tiempo_de(10, 50).
tiempo_de(11, 120).
tiempo_de(12, 120).
tiempo_de(13, 25).
tiempo_de(14, 90).
tiempo_de(15, 90).
tiempo_de(16, 50).
tiempo_de(17, 350).
tiempo_de(18, 450).
tiempo_de(19, 60).
tiempo_de(20, 120).
tiempo_de(21, 60).
tiempo_de(22, 30).
tiempo_de(23, 40).
tiempo_de(24, 40).
tiempo_de(25, 60).
tiempo_de(26, 60).
tiempo_de(27, 40).
tiempo_de(28, 40).
tiempo_de(29, 30).
tiempo_de(30, 80).
tiempo_de(31, 120).
tiempo_de(32, 70).
tiempo_de(33, 380).
tiempo_de(34, 70).
tiempo_de(35, 260).
tiempo_de(36, 45).
tiempo_de(37, 20).
tiempo_de(38, 45).
tiempo_de(39, 45).
tiempo_de(40, 45).
tiempo_de(41, 60).
tiempo_de(42, 60).
tiempo_de(43, 60).
tiempo_de(44, 60).
tiempo_de(45, 45).
tiempo_de(46, 120).
tiempo_de(47, 180).
tiempo_de(48, 140).
tiempo_de(49, 220).
tiempo_de(50, 210).
tiempo_de(51, 180).
tiempo_de(52, 210).
tiempo_de(53, 180).
tiempo_de(54, 350).
tiempo_de(55, 340).
tiempo_de(56, 340).
tiempo_de(57, 1800).
tiempo_de(58, 180).
tiempo_de(59, 180).
tiempo_de(60, 350).
tiempo_de(61, 350).
tiempo_de(62, 350).
tiempo_de(63, 350).
tiempo_de(64, 350).
tiempo_de(65, 240).

% COSTO DE CADA ACTIVIDAD
costo_de(1, 0).
costo_de(2, 0).
costo_de(3, 5).
costo_de(4, 20).
costo_de(5, 0).
costo_de(6, 0).
costo_de(7, 0).
costo_de(8, 0).
costo_de(9, 0).
costo_de(10, 40).
costo_de(11, 30).
costo_de(12, 15).
costo_de(13, 20).
costo_de(14, 20).
costo_de(15, 50).
costo_de(16, 0).
costo_de(17, 25).
costo_de(18, 18).
costo_de(19, 0).
costo_de(20, 2).
costo_de(21, 0).
costo_de(22, 0).
costo_de(23, 0).
costo_de(24, 0).
costo_de(25, 0).
costo_de(26, 0).
costo_de(27, 0).
costo_de(28, 0).
costo_de(29, 0).
costo_de(30, 5).
costo_de(31, 13).
costo_de(32, 5).
costo_de(33, 0).
costo_de(34, 0).
costo_de(35, 20).
costo_de(36, 0).
costo_de(37, 0).
costo_de(38, 0).
costo_de(39, 0).
costo_de(40, 0).
costo_de(41, 0).
costo_de(42, 0).
costo_de(43, 0).
costo_de(44, 0).
costo_de(45, 0).
costo_de(46, 0).
costo_de(47, 0).
costo_de(48, 0).
costo_de(49, 5).
costo_de(50, 17).
costo_de(51, 8).
costo_de(52, 30).
costo_de(53, 5).
costo_de(54, 50).
costo_de(55, 23).
costo_de(56, 60).
costo_de(57, 150).
costo_de(58, 7).
costo_de(59, 60).
costo_de(60, 10).
costo_de(61, 36).
costo_de(62, 45).
costo_de(63, 24).
costo_de(64, 27).
costo_de(65, 15).

% PERSONAS NECESARIAS PARA CADA ACTIVIDAD
personas_necesarias(1, 2).
personas_necesarias(2, 2).
personas_necesarias(3, 2).
personas_necesarias(4, 2).
personas_necesarias(5, 2).
personas_necesarias(6, 2).
personas_necesarias(7, 2).
personas_necesarias(8, 2).
personas_necesarias(9, 2).
personas_necesarias(10, 2).
personas_necesarias(11, 2).
personas_necesarias(12, 2).
personas_necesarias(13, 2).
personas_necesarias(14, 2).
personas_necesarias(15, 2).
personas_necesarias(16, 2).
personas_necesarias(17, 2).
personas_necesarias(18, 2).
personas_necesarias(19, 2).
personas_necesarias(20, 2).
personas_necesarias(21, 2).
personas_necesarias(22, 2).
personas_necesarias(23, 2).
personas_necesarias(24, 2).
personas_necesarias(25, 2).
personas_necesarias(26, 2).
personas_necesarias(27, 2).
personas_necesarias(28, 2).
personas_necesarias(29, 2).
personas_necesarias(30, 2).
personas_necesarias(31, 2).
personas_necesarias(32, 2).
personas_necesarias(33, 2).
personas_necesarias(34, 2).
personas_necesarias(35, 2).
personas_necesarias(36, 2).
personas_necesarias(37, 2).
personas_necesarias(38, 2).
personas_necesarias(39, 2).
personas_necesarias(40, 2).
personas_necesarias(41, 2).
personas_necesarias(42, 2).
personas_necesarias(43, 2).
personas_necesarias(44, 2).
personas_necesarias(45, 2).
personas_necesarias(46, 2).
personas_necesarias(47, 2).
personas_necesarias(48, 2).
personas_necesarias(49, 2).
personas_necesarias(50, 2).
personas_necesarias(51, 2).
personas_necesarias(52, 2).
personas_necesarias(53, 2).
personas_necesarias(54, 2).
personas_necesarias(55, 2).
personas_necesarias(56, 2).
personas_necesarias(57, 2).
personas_necesarias(58, 2).
personas_necesarias(59, 2).
personas_necesarias(60, 2).
personas_necesarias(61, 2).
personas_necesarias(62, 2).
personas_necesarias(63, 2).
personas_necesarias(64, 2).
personas_necesarias(65, 2).
personas_necesarias(66, 2).

% ACTIVIDADES PARA PAREJAS
actividad_para_pareja(1).
actividad_para_pareja(2).
actividad_para_pareja(3).
actividad_para_pareja(4).
actividad_para_pareja(5).
actividad_para_pareja(6).
actividad_para_pareja(7).
actividad_para_pareja(8).
actividad_para_pareja(9).
actividad_para_pareja(10).
actividad_para_pareja(11).
actividad_para_pareja(12).
actividad_para_pareja(13).
actividad_para_pareja(14).
actividad_para_pareja(15).
actividad_para_pareja(16).
actividad_para_pareja(17).
actividad_para_pareja(18).
actividad_para_pareja(19).
actividad_para_pareja(20).
actividad_para_pareja(21).
actividad_para_pareja(22).
actividad_para_pareja(23).
actividad_para_pareja(24).
actividad_para_pareja(25).
actividad_para_pareja(26).
actividad_para_pareja(27).
actividad_para_pareja(28).
actividad_para_pareja(29).
actividad_para_pareja(30).
actividad_para_pareja(31).
actividad_para_pareja(32).
actividad_para_pareja(33).
actividad_para_pareja(34).
actividad_para_pareja(35).
actividad_para_pareja(36).
actividad_para_pareja(37).
actividad_para_pareja(38).
actividad_para_pareja(39).
actividad_para_pareja(40).
actividad_para_pareja(41).
actividad_para_pareja(42).
actividad_para_pareja(43).
actividad_para_pareja(44).
actividad_para_pareja(45).
actividad_para_pareja(46).
actividad_para_pareja(47).
actividad_para_pareja(48).
actividad_para_pareja(49).
actividad_para_pareja(50).
actividad_para_pareja(51).
actividad_para_pareja(52).
actividad_para_pareja(53).
actividad_para_pareja(54).
actividad_para_pareja(55).
actividad_para_pareja(56).
actividad_para_pareja(57).
actividad_para_pareja(58).
actividad_para_pareja(59).
actividad_para_pareja(60).
actividad_para_pareja(61).
actividad_para_pareja(62).
actividad_para_pareja(63).
actividad_para_pareja(64).
actividad_para_pareja(65).

% ACTIVIDADES FAMILIARES
actividad_para_familia(1).
actividad_para_familia(2).
actividad_para_familia(3).
actividad_para_familia(5).
actividad_para_familia(7).
actividad_para_familia(8).
actividad_para_familia(10).
actividad_para_familia(11).
actividad_para_familia(12).
actividad_para_familia(14).
actividad_para_familia(15).
actividad_para_familia(16).
actividad_para_familia(18).
actividad_para_familia(19).
actividad_para_familia(20).
actividad_para_familia(21).
actividad_para_familia(23).
actividad_para_familia(24).
actividad_para_familia(25).
actividad_para_familia(26).
actividad_para_familia(27).
actividad_para_familia(30).
actividad_para_familia(46).
actividad_para_familia(48).
actividad_para_familia(49).
actividad_para_familia(50).
actividad_para_familia(51).
actividad_para_familia(52).
actividad_para_familia(53).
actividad_para_familia(54).
actividad_para_familia(55).
actividad_para_familia(56).
actividad_para_familia(58).
actividad_para_familia(59).
actividad_para_familia(60).
actividad_para_familia(61).
actividad_para_familia(62).
actividad_para_familia(63).
actividad_para_familia(64).
actividad_para_familia(65).

% ACTIVIDADES CON AMIGOS
actividad_para_amigos(1).
actividad_para_amigos(2).
actividad_para_amigos(3).
actividad_para_amigos(5).
actividad_para_amigos(6).
actividad_para_amigos(7).
actividad_para_amigos(8).
actividad_para_amigos(10).
actividad_para_amigos(11).
actividad_para_amigos(12).
actividad_para_amigos(14).
actividad_para_amigos(15).
actividad_para_amigos(16).
actividad_para_amigos(18).
actividad_para_amigos(19).
actividad_para_amigos(20).
actividad_para_amigos(21).
actividad_para_amigos(22).
actividad_para_amigos(23).
actividad_para_amigos(24).
actividad_para_amigos(25).
actividad_para_amigos(26).
actividad_para_amigos(27).
actividad_para_amigos(30).
actividad_para_amigos(46).
actividad_para_amigos(48).
actividad_para_amigos(49).
actividad_para_amigos(50).
actividad_para_amigos(51).
actividad_para_amigos(52).
actividad_para_amigos(53).
actividad_para_amigos(54).
actividad_para_amigos(55).
actividad_para_amigos(56).
actividad_para_amigos(58).
actividad_para_amigos(59).
actividad_para_amigos(60).
actividad_para_amigos(61).
actividad_para_amigos(62).
actividad_para_amigos(63).
actividad_para_amigos(64).
actividad_para_amigos(65).
