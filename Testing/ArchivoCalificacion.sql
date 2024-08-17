CALL RegistrarRestaurante('R001', '1a calle zona 4', 'Guatemala', 4, 1770, 18, 1); -- ok
CALL RegistrarRestaurante('R002', '2a av zona 4', 'Mixco', 4, 1730, 10, 0); -- ok
CALL RegistrarRestaurante('R003', '3a calle zona 10', 'Guatemala', 10, 1744, 6, 1); -- ok
CALL RegistrarRestaurante('R004', '4a av zona 11', 'Guatemala', 11, 1280, 5, 0); -- ok
CALL RegistrarRestaurante('R005', '5a calle zona 7', 'Guatemala', 7, 1429, 9, 1); -- ok
CALL RegistrarRestaurante('R006', '5a calle zona 14', 'Guatemala', 14, 1790, 1, 0); -- ok solo 1 personal
CALL RegistrarRestaurante('R001', '1a calle zona 4', 'Guatemala', 4, 1770, 10, 0); -- error duplicado
CALL RegistrarRestaurante('R007', 'direccion x', 'Guatemala', -3, 1771, 8, 0); -- error zona inválida
CALL RegistrarRestaurante('R008', 'direccion x', 'Guatemala', 2, 1772, 5.5, 0); -- error personal inválido




-- ########################### REGISTRAR PUESTOS ###########################
CALL RegistrarPuesto('Mesero', 'Encargado de atender mesas de los clientes', 3750.00); -- ok
CALL RegistrarPuesto('Anfitrión', 'Encargado de recibir y ubicar a los clientes', 3100.00); -- ok
CALL RegistrarPuesto('Cocinero', 'Encargado de cocinar y preparar las órdenes', 4975.00); -- ok
CALL RegistrarPuesto('Gerente', 'A cargo del restaurante', 6500.00); -- ok
CALL RegistrarPuesto('Limpieza', 'Realiza las tareas de limpieza dentro del restaurante', 6500.00); -- ok
CALL RegistrarPuesto('Repartidor', 'Motorista que reparte las órdenes a las direcciones del cliente', 4635.00); -- ok
CALL RegistrarPuesto('Agente de llamadas', 'Miembro del call center para atender pedidos', 3185.00); -- ok
CALL RegistrarPuesto('Mesero', 'Encargado de atender mesas de los clientes', 3750.00); -- error duplicado
CALL RegistrarPuesto('Puesto Error', 'xxxxxx', -3500.00); -- error salario inválido




-- ########################### CREAR EMPLEADOS ###########################
CALL CrearEmpleado('JUAN SEBASTIAN', 'CHOC BOJ', '2001-03-14', 'juan@gmail.com', 42543549, '29 av z1 1-80', 3024021520101, 1, '2022-05-24', 'R001'); -- ok mesero 00000001
CALL CrearEmpleado('CESAR DANIEL', 'POSADAS GUERRA', '2000-02-15', 'cesar@hotmail.com', 64019962, '30 calle z8 12-20', 8029021520101, 2, '2020-09-11', 'R001'); -- ok anfitrión 00000002
CALL CrearEmpleado('KEVIN STEVE', 'MONTENEGRO SANTOS', '2001-02-24', 'kevin@gmail.com', 65473549, '29 av z1 1-80', 3024053620101, 3, '2023-01-12', 'R001'); -- ok cocinero 00000003
CALL CrearEmpleado('BENAVENTI BERNAL', 'LÓPEZ HERNÁNDEZ', '2002-04-30', 'benav@gmail.com', 82543547, '29 calle z2 1-80', 3095621520101, 4, '2020-07-11', 'R001'); -- ok gerente 00000004
CALL CrearEmpleado('EDDY ALEJANDRO', 'FLORES MORENO', '2003-06-12', 'eddy@gmail.com', 12546545, '29 av z3 1-80', 3104021520101, 5, '2022-02-05', 'R001'); -- ok limpieza 00000005
CALL CrearEmpleado('ANDRES EDUARDO', 'CUBUR CHALI', '2004-09-05', 'andres@gmail.com', 44547549, '29 calle z4 1-80', 3024021524001, 6, '2021-06-30', 'R001'); -- ok repartidor 00000006
CALL CrearEmpleado('STEVEN SULLIVAN', 'ESQUIVEL DÍAZ', '2002-11-06', 'steven@gmail.com', 42543542, '29 av z5 1-80', 9424021120101, 7, '2020-07-29', 'R001'); -- ok agente 00000007
CALL CrearEmpleado('LUIS ERNESTO', 'CRUZ LOPEZ', '2002-04-30', 'abc@yahoo.com', 12345678, 'direccion abc', 9995621529103, 4, '2022-05-24', 'R006'); -- ok gerente 00000008
CALL CrearEmpleado('REPARTIDOR', 'RESTAURANTE ABC', '2004-09-05', 'rr2@gmail.com', 44547549, 'direccion abc', 3024021524002, 6, '2021-06-30', 'R001'); -- ok repartidor 00000009
CALL CrearEmpleado('REPARTIDOR', 'RESTAURANTE ABC', '2004-09-05', 'rr2@gmail.com', 44547549, 'direccion abc', 3024021524003, 6, '2021-06-30', 'R002'); -- ok repartidor 00000010
CALL CrearEmpleado('REPARTIDOR', 'RESTAURANTE ABC', '2004-09-05', 'rr2@gmail.com', 44547549, 'direccion abc', 3024021524004, 6, '2021-06-30', 'R003'); -- ok repartidor 00000011
CALL CrearEmpleado('REPARTIDOR', 'RESTAURANTE ABC', '2004-09-05', 'rr2@gmail.com', 44547549, 'direccion abc', 3024021524005, 6, '2021-06-30', 'R004'); -- ok repartidor 00000012
CALL CrearEmpleado('REPARTIDOR', 'RESTAURANTE ABC', '2004-09-05', 'rr2@gmail.com', 44547549, 'direccion abc', 3024021524006, 6, '2021-06-30', 'R005'); -- ok repartidor 00000013
CALL CrearEmpleado('REPARTIDOR', 'RESTAURANTE ABC', '2004-09-05', 'rr2@gmail.com', 44547549, 'direccion abc', 3024021524007, 6, '2021-06-30', 'R001'); -- ok repartidor 00000014
CALL CrearEmpleado('REPARTIDOR', 'RESTAURANTE ABC', '2004-09-05', 'rr2@gmail.com', 44547549, 'direccion abc', 3024021524008, 6, '2021-06-30', 'R002'); -- ok repartidor 00000015
CALL CrearEmpleado('ERROR', 'XXXXX YYYYY', '2002-04-30', 'error@gmail', 12345678, 'direccion abc', 9995621520101, 1, '2022-05-24', 'R001'); -- error correo invalido
CALL CrearEmpleado('ERROR', 'XXXXX YYYYY', '2002-04-30', 'correo.error', 12345678, 'direccion abc', 9995621520102, 1, '2022-05-24', 'R001'); -- error correo invalido
CALL CrearEmpleado('ERROR', 'XXXXX YYYYY', '2002-04-30', 'abc@yahoo.com', 12345678, 'direccion abc', 9995621520102, 15, '2022-05-24', 'R001'); -- error puesto no existe
CALL CrearEmpleado('ERROR', 'XXXXX YYYYY', '2002-04-30', 'abc@yahoo.com', 12345678, 'direccion abc', 9995621520102, -3, '2022-05-24', 'R001'); -- error puesto negativo / no existe
CALL CrearEmpleado('ERROR', 'XXXXX YYYYY', '2002-04-30', 'abc@yahoo.com', 12345678, 'direccion abc', 9995621520102, 1, '2022-05-24', 'RXXX'); -- error restaurante no existe
CALL CrearEmpleado('ERROR', 'XXXXX YYYYY', '2002-04-30', 'abc@yahoo.com', 12345678, 'direccion abc', 4995621529103, 4, '2022-05-24', 'R006'); -- error límite personal alcanzado




-- ########################### REGISTRAR CLIENTE ###########################
CALL RegistrarCliente(8612300001101, 'PABLO JOSÉ', 'QUIXTÁN PÉREZ', '2003-05-14', 'serg@gmail.com', 42179456, 123909614); -- ok
CALL RegistrarCliente(9712400001101, 'ENRIQUE ALEJANDRO', 'VASQUEZ PEÑATE', '1989-07-03', 'serg@gmail.com', 52179457, NULL); -- ok
CALL RegistrarCliente(1812500001101, 'DEREK', 'ARMAS MONROY', '1957-08-07', 'serg@gmail.com', 62179458, 111909612); -- ok
CALL RegistrarCliente(2912600001101, 'JOSEPH JEFERSON', 'MENDOZA AGUILAR', '1999-10-08', 'serg@gmail.com', 72179459, NULL); -- ok
CALL RegistrarCliente(3112700001101, 'ALEXIS MARCO TULIO', 'OLIVA ESPAÑA', '2001-10-09', 'serg@gmail.com', 82179450, NULL); -- ok
CALL RegistrarCliente(9712400001101, 'ENRIQUE ALEJANDRO', 'VASQUEZ PEÑATE', '1989-07-03', 'serg@gmail.com', 52179457, NULL); -- error duplicado
CALL RegistrarCliente(3412400001102, 'ERROR', 'ERROR', '1989-07-03', 'error@.com', 52179457, NULL); -- error correo invalido
CALL RegistrarCliente(3412400001103, 'Lui$', '_Espino', '2000-12-1', 'Luis@gmail.com', 52179458, NULL); -- error nombre inválido




-- ########################### REGISTRAR DIRECCION ###########################
/* direecion id 1 */CALL RegistrarDireccion(8612300001101, '4ta calle B 11-20 zona 7', 'Guatemala', 7); -- ok
/* direecion id 2 */CALL RegistrarDireccion(8612300001101, '6ta av A 14-90 zona 11', 'Guatemala', 11); -- ok
/* direecion id 3 */CALL RegistrarDireccion(9712400001101, '4ta calle C 11-58 zona 10', 'Guatemala', 10); -- ok
/* direecion id 4 */CALL RegistrarDireccion(1812500001101, '4ta av A 11-40 zona 11', 'Guatemala', 11); -- ok
/* direecion id 5 */CALL RegistrarDireccion(2912600001101, '4ta calle B 12-10 zona 4', 'Mixco', 4); -- ok
/* direecion id 6 */CALL RegistrarDireccion(2912600001101, '1a av 11-21 zona 4', 'Guatemala', 4); -- ok
/* direecion id 7 */CALL RegistrarDireccion(8612300001101, '4ta av C 0-83 zona 8', 'Villa Nueva', 8); -- ok
CALL RegistrarDireccion(1111111111111, 'direccion abc', 'municipio', 1); -- error cliente no existe
CALL RegistrarDireccion(9712400001101, 'direccion abc', 'municipio', -2); -- error zona inválida
CALL RegistrarDireccion(9712400001101, 'direccion abc', '', 15); -- error municipio vacío


SELECT * FROM EMPLEADO

-- ########################### CREAR ORDEN ###########################
/* orden id 1 */CALL CrearOrden(8612300001101, 1, 'L'); -- ok
/* orden id 2 */CALL CrearOrden(8612300001101, 2, 'L'); -- ok
/* orden id 3 */CALL CrearOrden(9712400001101, 3, 'A'); -- ok
/* orden id 4 */CALL CrearOrden(1812500001101, 4, 'L'); -- ok
/* orden id 5 */CALL CrearOrden(2912600001101, 5, 'L'); -- ok
/* orden id 6 */CALL CrearOrden(2912600001101, 6, 'L'); -- ok
/* orden id 7 */CALL CrearOrden(8612300001101, 7, 'L'); -- no tiene cobertura
CALL CrearOrden(8888888888888, 1, 'L'); -- error no existe cliente / dirección
CALL CrearOrden(8612300001101, 5, 'L'); -- error no existe dirección
CALL CrearOrden(8612300001101, 1, 'X'); -- error canal inválido
CALL CrearOrden(8612300001101, 6, 'A'); -- error dirección no corresponde a cliente


-- REPORTE DE ESTADO
-- CALL MostrarOrdenes(1); -- ok
-- CALL MostrarOrdenes(-1); -- ok


-- ########################### AGREGAR ITEMS A LA ORDEN ###########################
CALL AgregarItem(1, 'C', 1, 2, 'Con pepinillos'); -- ok
CALL AgregarItem(1, 'C', 3, 1, 'Extra barbacoa'); -- ok
CALL AgregarItem(1, 'C', 5, 1, 'Sin champiñones'); -- ok
CALL AgregarItem(1, 'E', 1, 2, ''); -- ok
CALL AgregarItem(1, 'E', 3, 2, ''); -- ok
CALL AgregarItem(2, 'B', 5, 6, 'Cerveza clara'); -- ok
CALL AgregarItem(3, 'E', 1, 4, ''); -- ok
CALL AgregarItem(3, 'B', 4, 4, 'Sin hielo'); -- ok
CALL AgregarItem(4, 'P', 1, 1, ''); -- ok
CALL AgregarItem(4, 'P', 2, 1, ''); -- ok
CALL AgregarItem(4, 'P', 3, 1, ''); -- ok
CALL AgregarItem(4, 'P', 4, 1, ''); -- ok
CALL AgregarItem(5, 'C', 4, 1, ''); -- ok
CALL AgregarItem(5, 'P', 2, 1, ''); -- ok
CALL AgregarItem(6, 'C', 5, 2, ''); -- ok
CALL AgregarItem(6, 'E', 1, 1, ''); -- ok
CALL AgregarItem(6, 'E', 2, 1, ''); -- ok
CALL AgregarItem(6, 'E', 3, 1, ''); -- ok
CALL AgregarItem(6, 'P', 3, 3, 'Con extra topping'); -- ok
CALL AgregarItem(90, 'C', 1, 2, ''); -- error orden no existe
CALL AgregarItem(7, 'C', 1, 2, ''); -- error orden no tiene cobertura
CALL AgregarItem(1, 'X', 1, 2, ''); -- error tipo producto inválido
CALL AgregarItem(1, 'C', 10, 1, ''); -- error combo no existe
CALL AgregarItem(1, 'B', -4, 1, ''); -- error bebida no existe
CALL AgregarItem(1, 'B', 2, -5, ''); -- error cantidad negativa
CALL AgregarItem(1, 'B', 2, 2.25, ''); -- error cantidad inválida


-- REPORTE DE ESTADO
-- CALL MostrarOrdenes(2); -- ok




-- ########################### CONFIRMAR ORDEN ###########################
CALL ConfirmarOrden(25, 'T', 00000001); -- error orden no existe
CALL ConfirmarOrden(1, 'W', 00000001); -- error forma de pago inválida
CALL ConfirmarOrden(1, 'T', 00000999); -- error repartidor no existe
CALL ConfirmarOrden(1, 'T', 00000009); -- ok
CALL ConfirmarOrden(2, 'E', 00000010); -- ok
CALL ConfirmarOrden(3, 'T', 00000011); -- ok
CALL ConfirmarOrden(4, 'E', 00000012); -- ok
CALL ConfirmarOrden(5, 'T', 00000013); -- ok
CALL ConfirmarOrden(6, 'E', 00000014); -- ok
CALL ConfirmarOrden(1,'T', 00000014); -- error orden ya fue confirmada
CALL AgregarItem(1, 'C', 1, 1, ''); -- error orden ya fue confirmada


-- REPORTE DE ESTADO
-- CALL MostrarOrdenes(3); -- ok




-- ########################### FINALIZAR ORDEN ###########################
CALL FinalizarOrden(1); -- ok
CALL FinalizarOrden(2); -- ok
CALL FinalizarOrden(3); -- ok
CALL FinalizarOrden(4); -- ok
CALL FinalizarOrden(5); -- ok
CALL FinalizarOrden(6); -- ok
CALL FinalizarOrden(1); -- error orden ya finalizada
CALL AgregarItem(1, 'C', 1, 1, ''); -- error orden ya fue finalizada
CALL ConfirmarOrden(1, 'T', 00000006); -- error orden ya fue finalizada


-- REPORTE DE ESTADO
-- CALL MostrarOrdenes(4); -- ok




/*************************** REPORTERÍA ***************************/
-- RESTAURANTES
CALL ListarRestaurantes(); -- ok


-- EMPLEADO
CALL ConsultarEmpleado(0000015); -- ok
CALL ConsultarEmpleado(99999999); -- error no existe empleado


-- DETALLE PEDIDO
CALL ConsultarPedidosCliente(1); -- ok
CALL ConsultarPedidosCliente(2); -- ok
CALL ConsultarPedidosCliente(3); -- ok
CALL ConsultarPedidosCliente(4); -- ok
CALL ConsultarPedidosCliente(5); -- ok
CALL ConsultarPedidosCliente(6); -- ok
CALL ConsultarPedidosCliente(7); -- sin cobertura
CALL ConsultarPedidosCliente(10); -- error no existe pedido


-- HISTORIAL ÓRDENES
CALL ConsultarHistorialOrdenes(8612300001101); -- ok
CALL ConsultarHistorialOrdenes(2912600001101); -- ok
CALL ConsultarHistorialOrdenes(1919191919191); -- error no existe cliente




-- DIRECCIONES CLIENTE
CALL ConsultarDirecciones(8612300001101); -- ok
CALL ConsultarDirecciones(9712400001101); -- ok
CALL ConsultarDirecciones(3112700001101); -- ok


-- ÓRDENES SEGÚN ESTADO
CALL MostrarOrdenes(1); -- ok
CALL MostrarOrdenes(2); -- ok
CALL MostrarOrdenes(3); -- ok
CALL MostrarOrdenes(4); -- ok
CALL MostrarOrdenes(-1); -- ok
CALL MostrarOrdenes(21); -- error estado no existe


-- ENCABEZADOS FACTURA
CALL ConsultarFacturas(8, 5, 2023); -- ok
CALL ConsultarFacturas(31, 12, 2022); -- vacío
CALL ConsultarFacturas(40, 70, 2023); -- error fecha inválida


-- TIEMPOS DE ESPERA
CALL ConsultarTiempos(1); -- ok
CALL ConsultarTiempos(5); -- ok
CALL ConsultarTiempos(30); -- vacío
CALL ConsultarTiempos(-25); -- error tiempo inválido




/* TABLA HISTORIAL */
-- debe tener los tres tipos de trigger para cada evento (insert, update, delete)
SELECT * FROM historial;





