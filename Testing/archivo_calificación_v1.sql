-- ########################### INGRESAR CARRERA ###########################
CALL CrearCarrera('Sistem@s'); -- nombre inválido
CALL CrearCarrera('Sistemas Calificación'); -- ok
CALL CrearCarrera('Sistemas Calificación'); -- error duplicado


-- ########################### CREAR ESTUDIANTE ###########################
CALL RegistrarEstudiante(202004765, 'Javier!', 'Gutierrez?', '2001-03-14', 'javier@gmail.com', 42543549, '29 avenida', 3024021520101, 1); -- nombre inválido
CALL RegistrarEstudiante(202004765, 'Javier', 'Gutierrez', '2001-03-14', 'javiergmail.com', 42543549, '29 avenida', 3024021520101, 1); -- correo inválido
CALL RegistrarEstudiante(201409335, 'Fabian', 'Reyna', '2001-6-13', 'Fabian@gmail.com', 9502001, '7 avenida', 53620010101, 99); -- no existe carrera
CALL RegistrarEstudiante(201409335, 'Fabian', 'Reyna', '2001-6-13', 'Fabian@gmail.com', 9502001, '7 avenida', 53620010101, -5); -- número inválido / no existe carrera
CALL RegistrarEstudiante(201506554, 'Angel', 'Marroquin', '1996-1-6', 'Angel@gmail.com', 6401996, '19 avenida', 45119960101, 1); -- ok
CALL RegistrarEstudiante(201506554, 'Angel', 'Marroquin', '1996-1-6', 'Angel@gmail.com', 6401996, '19 avenida', 45119960101, 1); -- error duplicado
CALL RegistrarEstudiante(201818477, 'Diego', 'Arriaga', '2012-12-19', 'Diego@gmail.com', 8712012, '8 avenida', 741220120101, 1); -- ok
CALL RegistrarEstudiante(201902238, 'Luis', 'Castellanos', '2001-01-25', 'luis@gmail.com', 42141631, '2 calle', 3006251851047, 2); -- ok


-- ########################### REGISTRAR DOCENTE ###########################
CALL RegistrarDocente('Lui$', '_Espino', '2000-12-1', 'Luis@gmail.com', 7812000, '12 avenida', 861220000101, 150); -- nombre inválido
CALL RegistrarDocente('Jorge', 'Alvarez', '1994-10-16', 'Jorgegmail.com', 4501994, '20 avenida', 531019940101, 151); -- correo inválido
CALL RegistrarDocente('Arturo', 'Samayoa', '2003-5-4', 'Arturo@gmail.com', 1412003, '4 avenida', 48520030101, 152); -- ok
CALL RegistrarDocente('Arturo', 'Samayoa', '2003-5-4', 'Arturo@gmail.com', 1412003, '4 avenida', 48520030101, 152); -- error duplicado
CALL RegistrarDocente('William', 'Escobar', '2012-7-10', 'willy@gmail.com', 1512012, '24 avenida', 55720120101, 153); -- ok


-- ########################### CREAR CURSO ###########################
    -- Area común
    CALL CrearCurso(1, 'Error 1', -25, 3, 0, 1); -- número inválido
    CALL CrearCurso(1, 'Error 2', 0, -50, 0, 1); -- número inválido
    CALL CrearCurso(1, 'Error 3', 1, 1, 99, 1); -- no existe carrera
    CALL CrearCurso(1, 'Error 4!!!!', 1, 1, 0, 1); -- nombre inválido
    CALL CrearCurso(1, 'Mate 1', 0, 3, 0, 1); -- ok
    CALL CrearCurso(1, 'Mate 1', 0, 3, 0, 1); -- error duplicado
    CALL CrearCurso(2, 'Mate 2', 3, 5, 0, 1); -- ok
    -- Sistemas
    CALL CrearCurso(41, 'IPC 1', 0, 3, ${id_sistemas}, 1); -- ok
    CALL CrearCurso(42, 'Logica de sistemas', 0, 2, ${id_sistemas}, 0); -- ok
    CALL CrearCurso(43, 'Archivos', 10, 3, ${id_sistemas}, 1); -- ok
    CALL CrearCurso(44, 'Compi 1', 9, 3, ${id_sistemas}, 1); -- ok
    CALL CrearCurso(45, 'Bases 1', 12, 3, ${id_sistemas}, 1); -- ok


-- ########################### HABILITAR CURSO PARA ASIGNACIÓN ###########################
CALL HabilitarCurso(1, 'VD', 152, 2, 'A'); -- Habilita Mate 1 con Samayoa con cupo 2 ok
CALL HabilitarCurso(2, '2S', 152, 2, 'A'); -- Habilita Mate 2 con Samayoa con cupo 2 ok
CALL HabilitarCurso(41, 'VD', 153, 2, 'A'); -- Habilita IPC 1 con William con cupo 2 ok
CALL HabilitarCurso(41, 'VD', 153, 2, 'A'); -- error duplicado
CALL HabilitarCurso(41, 'VD', 153, 2, '@'); -- sección inválida
CALL HabilitarCurso(41, 'VD', 153, -32, 'A'); -- cupo inválido
CALL HabilitarCurso(41, '', 153, -32, 'A'); -- ciclo vacío
CALL HabilitarCurso(999, '1S', 153, -32, 'A'); -- curso no existe


-- ########################### AGREGAR HORARIO ###########################
CALL AgregarHorario(999,6,'7:00-8:00'); -- id no existe
CALL AgregarHorario(1,8,'7:00-8:00'); -- día fuera del rango [1,7]
CALL AgregarHorario(1,4,'???'); -- horario inválido
CALL AgregarHorario(1,5,''); -- horario vacío
CALL AgregarHorario(1,2,'12:00-13:00'); -- ok
CALL AgregarHorario(1,3,'12:00-13:00'); -- ok
CALL AgregarHorario(2,1,'18:00-19:00'); -- ok
CALL AgregarHorario(2,5,'18:00-19:00'); -- ok


-- ########################### ASIGNAR CURSO ###########################
CALL AsignarCurso(1,'VD','A',777777777); -- carnet no existe
CALL AsignarCurso(1,'VD','X',201506554); -- sección no existe
CALL AsignarCurso(1,'??','A',201506554); -- ciclo inválido
CALL AsignarCurso(9898,'VD','A',201506554); -- curso no existe
CALL AsignarCurso(1,'1S','A',201506554); -- no existe esa sección en ese ciclo
CALL AsignarCurso(1,'VD','A',201506554); -- ok mate 1
CALL AsignarCurso(1,'VD','A',201506554); -- error asignación duplicada
CALL AsignarCurso(41,'VD','A',201818477); -- validar curso solo de sistemas
CALL AsignarCurso(1,'VD','A',201818477); -- ok mate 1
CALL AsignarCurso(1,'VD','A',201902238); -- error ya no hay cupo
CALL AsignarCurso(2,'2S','A',201902238); -- error no tiene créditos necesarios

-- ########################### DESASIGNACIONES ##########################
CALL DesasignarCurso(1,'VD','A',777777777); -- carnet no existe
CALL DesasignarCurso(1,'VD','X',201506554); -- sección no existe
CALL DesasignarCurso(1,'??','A',201506554); -- ciclo inválido
CALL DesasignarCurso(9898,'VD','A',201506554); -- curso no existe
CALL DesasignarCurso(1,'1S','A',201506554); -- no existe esa sección en ese ciclo
CALL DesasignarCurso(1,'VD','A',201506554); -- ok
CALL DesasignarCurso(1,'VD','A',201506554); -- error ya se encuentra desasignado

-- YA SE PUEDE ASIGNAR OTRO PORQUE YA HAY CUPO
CALL AsignarCurso(1,'VD','A',201902238); -- OK

-- NO SE DEBE PODER GENERAR ACTA SIN NOTAS
CALL GenerarActa(1,'VD','A'); -- error no hay notas ingresadas

-- ########################## INGRESO DE NOTAS ##########################
CALL IngresarNota(1,'VD','A',201818477,-35); -- error nota inválida
CALL IngresarNota(1,'1S','A',987988787,87); -- error carnet no existe
CALL IngresarNota(1,'VD','Z',201818477,20.1); -- error seccion no existe
CALL IngresarNota(1,'??','A',201818477,20.1); -- error ciclo inválido / no existe
CALL IngresarNota(598,'VD','A',201818477,20.1); -- error curso no existe
CALL IngresarNota(1,'VD','A',201818477,20.1); -- ok
CALL IngresarNota(1,'VD','A',201902238,60.5); -- ok
CALL IngresarNota(1,'VD','A',201818477,49.5); -- error ya tiene nota (o actualizarla pero no duplicarla)
CALL IngresarNota(1,'VD','A',201818477,200); -- error nota inválida
CALL IngresarNota(1,'VD','A',201506554,99.45); -- error no se encuentra asignado al curso


-- ########################## GENERAR ACTA ##########################
CALL GenerarActa(1,'VD','Y'); -- error no existe sección
CALL GenerarActa(1,'VJ','A'); -- error no existe ciclo
CALL GenerarActa(8989,'VD','A'); -- error no existe curso
CALL GenerarActa(1,'VD','A'); -- ok
CALL GenerarActa(1,'VD','A'); -- error acta duplicada


/*************************** PROCESAMIENTO ***************************/
-- PENSUM
CALL ConsultarPensum(95959); -- error no existe carrera
CALL ConsultarPensum(1); -- ok

-- ESTUDIANTE
CALL ConsultarEstudiante(988989); -- error no existe estudiante
CALL ConsultarEstudiante(201902238); -- ok

-- DOCENTE
CALL ConsultarDocente(988989); -- error no existe docente
CALL ConsultarDocente(152); -- ok

-- ASIGNADOS
CALL ConsultarAsignados(1,'VD',2022,'Z'); -- no existe sección
CALL ConsultarAsignados(1,'VD',2023,'A'); -- no hay datos del año 2023
CALL ConsultarAsignados(1,'VJ',2023,'A'); -- no hay en ese ciclo
CALL ConsultarAsignados(4545,'VJ',2023,'A'); -- curso no existe
CALL ConsultarAsignados(1,'VD',2022,'A'); -- ok

-- APROBACIONES
CALL ConsultarAprobacion(1,'VD',2022,'Z'); -- no existe sección
CALL ConsultarAprobacion(1,'VD',2023,'A'); -- no hay datos del año 2023
CALL ConsultarAprobacion(1,'VJ',2023,'A'); -- no hay en ese ciclo
CALL ConsultarAprobacion(4545,'VJ',2023,'A'); -- curso no existe
CALL ConsultarAprobacion(2,'2S',2022,'A'); -- no tiene
CALL ConsultarAprobacion(1,'VD',2022,'A'); -- ok

-- ACTAS
CALL ConsultarActas(4648); -- error no existe curso
CALL ConsultarActas(2); -- no tiene
CALL ConsultarActas(1); -- ok

-- ConsultarDesasignacion
CALL ConsultarDesasignacion(1,'VD',2022,'Z'); -- no existe sección
CALL ConsultarDesasignacion(1,'VD',2023,'A'); -- no hay datos del año 2023
CALL ConsultarDesasignacion(1,'VJ',2023,'A'); -- no hay en ese ciclo
CALL ConsultarDesasignacion(4545,'VJ',2023,'A'); -- curso no existe
CALL ConsultarDesasignacion(2,'2S',2022,'A'); -- no tiene
CALL ConsultarDesasignacion(1,'VD',2022,'A'); -- ok


/* TABLA HISTORIAL */
-- debe tener los tres tipos de trigger para cada evento (insert, update, delete)
SELECT * FROM historial;
