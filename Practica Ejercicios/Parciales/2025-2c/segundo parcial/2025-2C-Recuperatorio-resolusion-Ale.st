!classDefinition: #BuscadorDeVuelos category: #'2025-2C-Recuperatorio'!
Object subclass: #BuscadorDeVuelos
	instanceVariableNames: 'vuelos calculadoraNeto'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2025-2C-Recuperatorio'!

!BuscadorDeVuelos methodsFor: 'validaciones' stamp: 'Alejandro Pontalti 13/Nov/2026, 3:39:10 am (UTC)'!
!methodProperties: {}!
cantidadDePasajerosValida: cantidadPasajeros

	(cantidadPasajeros < 1) ifTrue: [^self error: BuscadorDeVuelos pasajerosMayorQueCeroError ].! !


!BuscadorDeVuelos methodsFor: 'busquedas' stamp: 'Alejandro Pontalti 16/Nov/2026, 6:57:56 am (UTC)'!
!methodProperties: {}!
buscarVueloDeIdaPartiendoDesde: unAeropuertoDeSalida yLlegandoA: unAeropuertoDeLlegada conFecha: fechaDePartida yCantidadPasajeros: cantidadPasajeros 
	
	^self buscarVueloPartiendoDesde: unAeropuertoDeSalida yLlegandoA: unAeropuertoDeLlegada conFecha: fechaDePartida yCantidadPasajeros: cantidadPasajeros.! !

!BuscadorDeVuelos methodsFor: 'busquedas' stamp: 'Alejandro Pontalti 16/Nov/2026, 7:15:27 am (UTC)'!
!methodProperties: {}!
buscarVueloDeIdaYvueltaPartiendoDesde: unAeropuertoDeSalida yLlegandoA: unAeropuertoDeLlegada conFechaDePartida: fechaDePartida yFechaDeRegreso: fechaDeRegreso yCantidadPasajeros: cantidadPasajeros 
	
	| resultadosVuelosDeIda resultadosVuelosDeVuelta resultadosBusqueda |
	
	resultadosVuelosDeIda := self buscarVueloPartiendoDesde: unAeropuertoDeSalida yLlegandoA: unAeropuertoDeLlegada conFecha: fechaDePartida yCantidadPasajeros: cantidadPasajeros.
	resultadosVuelosDeVuelta := self buscarVueloPartiendoDesde: unAeropuertoDeLlegada yLlegandoA: unAeropuertoDeSalida conFecha: fechaDeRegreso yCantidadPasajeros: cantidadPasajeros.
	resultadosBusqueda := resultadosVuelosDeIda, resultadosVuelosDeVuelta.
	
	^resultadosBusqueda.! !

!BuscadorDeVuelos methodsFor: 'busquedas' stamp: 'Alejandro Pontalti 16/Nov/2026, 4:40:09 am (UTC)'!
!methodProperties: {}!
obtenerCostosNetosDeBusqueda: unaBusqueda enFecha: fechaDePartida yCantidadDePasajeros: cantidadDePasajeros 

	^calculadoraNeto obtenerCostosNetosDeVuelos: unaBusqueda enFecha: fechaDePartida yCantidadDePasajeros: cantidadDePasajeros.
	! !


!BuscadorDeVuelos methodsFor: 'privado' stamp: 'Alejandro Pontalti 16/Nov/2026, 6:56:35 am (UTC)'!
!methodProperties: {}!
buscarVueloPartiendoDesde: unAeropuertoDeSalida yLlegandoA: unAeropuertoDeLlegada conFecha: fechaDePartida yCantidadPasajeros: cantidadPasajeros 
	
	| resultadoBusqueda |
	
	self cantidadDePasajerosValida: cantidadPasajeros.

	resultadoBusqueda := (vuelos select: [:unVuelo | unVuelo esEsteVuelosalienteDesdeAeropuerto: unAeropuertoDeSalida hastaAeropuerto: unAeropuertoDeLlegada partiendoEstaFecha: fechaDePartida ]) ifEmpty: [^self class noSeEncontraronVuelos ].
	
	^resultadoBusqueda.! !


!BuscadorDeVuelos methodsFor: 'initialize' stamp: 'Alejandro pontalti 14/Nov/2026, 7:55:22 pm (UTC)'!
!methodProperties: {}!
initialize

	vuelos := OrderedCollection new.
	calculadoraNeto := CalculadoraCostoNeto new.! !

!BuscadorDeVuelos methodsFor: 'initialize' stamp: 'Alejandro Pontalti 13/Nov/2026, 2:29:53 am (UTC)'!
!methodProperties: {}!
initializeConVuelos: listaVuelos 

	vuelos := listaVuelos.! !

!BuscadorDeVuelos methodsFor: 'initialize' stamp: 'Alejandro Pontalti 16/Nov/2026, 6:45:52 am (UTC)'!
!methodProperties: {}!
initializeConVuelos: listaVuelos yConDescuentos: descuentos

	vuelos := listaVuelos.
	calculadoraNeto := CalculadoraCostoNeto new initializeConDescuentos: descuentos.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BuscadorDeVuelos class' category: #'2025-2C-Recuperatorio'!
BuscadorDeVuelos class
	instanceVariableNames: ''!

!BuscadorDeVuelos class methodsFor: 'error' stamp: 'Alejandro Pontalti 13/Nov/2026, 12:38:25 am (UTC)'!
!methodProperties: {}!
pasajerosMayorQueCeroError

	^'La cantidad de pasajeros debe ser mayor que 0'! !


!BuscadorDeVuelos class methodsFor: 'respuestas' stamp: 'Alejandro Pontalti 13/Nov/2026, 3:29:11 am (UTC)'!
!methodProperties: {}!
noSeEncontraronVuelos

	^'No tenemos vuelos con los paramentros indicados :(.'! !


!classDefinition: #CalculadoraCostoNeto category: #'2025-2C-Recuperatorio'!
Object subclass: #CalculadoraCostoNeto
	instanceVariableNames: 'fechasDeDescuento'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2025-2C-Recuperatorio'!

!CalculadoraCostoNeto methodsFor: 'calcular' stamp: 'Alejandro Pontalti 16/Nov/2026, 5:07:43 am (UTC)'!
!methodProperties: {}!
obtenerCostosNetosDeVuelos: unaBusqueda enFecha: fechaDePartida yCantidadDePasajeros: cantidadDePasajeros  
	
	| costosBruto esFechaDeDescuento |

	costosBruto := Vuelo devolverSoloCostos: unaBusqueda.
	costosBruto := self obtenerCostosNetosDe: costosBruto multiplicadosPorCantidadDePasajeros: cantidadDePasajeros.
	esFechaDeDescuento := self esFechaDeDescuento: fechaDePartida.
	esFechaDeDescuento ifTrue: [^ self obtenerCostosNetosDe: costosBruto aplicandoDescuento: (fechasDeDescuento at: fechaDePartida). ] ifFalse: [^costosBruto ].! !


!CalculadoraCostoNeto methodsFor: 'privado' stamp: 'Alejandro Pontalti 16/Nov/2026, 5:19:35 am (UTC)'!
!methodProperties: {}!
esFechaDeDescuento: fechaDePartida 
	
	fechasDeDescuento at: fechaDePartida ifPresent: [:unArgumento | ^true ] ifAbsent:[^false ].! !

!CalculadoraCostoNeto methodsFor: 'privado' stamp: 'Alejandro Pontalti 16/Nov/2026, 4:54:10 am (UTC)'!
!methodProperties: {}!
obtenerCostosNetosDe: costosBruto aplicandoDescuento: unDescuento

	| CostosNetos |
	CostosNetos := costosBruto collect: [:unCosto | unCosto * unDescuento ].
	^ CostosNetos! !

!CalculadoraCostoNeto methodsFor: 'privado' stamp: 'Alejandro Pontalti 16/Nov/2026, 4:52:40 am (UTC)'!
!methodProperties: {}!
obtenerCostosNetosDe: costosBruto multiplicadosPorCantidadDePasajeros: cantidadDePasajeros

	| CostosNetos |
	CostosNetos := costosBruto collect: [:unCosto | unCosto * cantidadDePasajeros ].
	^ CostosNetos! !


!CalculadoraCostoNeto methodsFor: 'initialize' stamp: 'Alejandro Pontalti 16/Nov/2026, 6:48:04 am (UTC)'!
!methodProperties: {}!
initialize

	fechasDeDescuento := Dictionary new.! !

!CalculadoraCostoNeto methodsFor: 'initialize' stamp: 'Alejandro Pontalti 16/Nov/2026, 6:47:21 am (UTC)'!
!methodProperties: {}!
initializeConDescuentos: descuentos

	fechasDeDescuento := Dictionary newFrom: descuentos.! !


!classDefinition: #Vuelo category: #'2025-2C-Recuperatorio'!
Object subclass: #Vuelo
	instanceVariableNames: 'codigo aeropuertoDesde aeropuertoHasta costo frecuencia'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2025-2C-Recuperatorio'!

!Vuelo methodsFor: 'initialize' stamp: 'Alejandro Pontalti 13/Nov/2026, 2:38:48 am (UTC)'!
!methodProperties: {}!
initializeConCodigo: codigoVuelo desde: unAeropuertoDesde hasta: unAeropuertoHasta costo: unCosto yFrecuencia: unaFrecuencia 
	
	codigo := codigoVuelo.
	aeropuertoDesde := unAeropuertoDesde.
	aeropuertoHasta := unAeropuertoHasta.
	costo := unCosto.
	frecuencia := unaFrecuencia.! !


!Vuelo methodsFor: 'acceso' stamp: 'Alejandro Pontalti 13/Nov/2026, 2:36:38 am (UTC)'!
!methodProperties: {}!
aeropuertoDesde
	
	^aeropuertoDesde! !

!Vuelo methodsFor: 'acceso' stamp: 'Alejandro Pontalti 13/Nov/2026, 2:36:57 am (UTC)'!
!methodProperties: {}!
aeropuertoHasta
	
	^aeropuertoHasta! !

!Vuelo methodsFor: 'acceso' stamp: 'Alejandro Pontalti 13/Nov/2026, 7:53:45 am (UTC)'!
!methodProperties: {}!
codigo

	^codigo.! !

!Vuelo methodsFor: 'acceso' stamp: 'Alejandro Pontalti 13/Nov/2026, 7:53:39 am (UTC)'!
!methodProperties: {}!
costo

	^costo.! !

!Vuelo methodsFor: 'acceso' stamp: 'Alejandro Pontalti 13/Nov/2026, 8:21:34 am (UTC)'!
!methodProperties: {}!
esEsteVuelosalienteDesdeAeropuerto: unAeropuertoDeSalida hastaAeropuerto: unAeropuertoDeLlegada partiendoEstaFecha: fechaDePartida 

	| respuesta |
	
	respuesta := (self aeropuertoDesde = unAeropuertoDeSalida) and: (self aeropuertoHasta = unAeropuertoDeLlegada).
	respuesta := respuesta and: (frecuencia includes: fechaDePartida date day ).
	
	^respuesta! !


!Vuelo methodsFor: 'imprimir' stamp: 'Alejandro Pontalti 13/Nov/2026, 7:52:50 am (UTC)'!
!methodProperties: {}!
imprimir
	
	| stringResultado |
	
	stringResultado := codigo, ', desde ', aeropuertoDesde asPlainString , ' a ', aeropuertoHasta asPlainString , ', ', frecuencia asString , ' y cuesta ' , costo amount asString , ' dólares.'.
	^ stringResultado.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Vuelo class' category: #'2025-2C-Recuperatorio'!
Vuelo class
	instanceVariableNames: ''!

!Vuelo class methodsFor: 'colecciones' stamp: 'Alejandro Pontalti 16/Nov/2026, 4:00:53 am (UTC)'!
!methodProperties: {}!
devolverSoloCodigos: vuelos 
	
	^vuelos collect: [:unVuelo | unVuelo codigo ].! !

!Vuelo class methodsFor: 'colecciones' stamp: 'Alejandro Pontalti 16/Nov/2026, 4:01:15 am (UTC)'!
!methodProperties: {}!
devolverSoloCostos: vuelos 
	
	^vuelos collect: [:unVuelo | unVuelo costo ]! !


!classDefinition: #AterrizarTest category: #'2025-2C-Recuperatorio'!
TestCase subclass: #AterrizarTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2025-2C-Recuperatorio'!

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro Pontalti 13/Nov/2026, 12:52:53 am (UTC)'!
!methodProperties: {}!
aeropuertoBarcelona

	^ #Barcelona! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro Pontalti 13/Nov/2026, 12:52:24 am (UTC)'!
!methodProperties: {}!
aeropuertoEzeiza

	^ #Ezeiza! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro Pontalti 13/Nov/2026, 12:54:07 am (UTC)'!
!methodProperties: {}!
aeropuertoJorgeNewery

	^ #JorgeNewery! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro Pontalti 13/Nov/2026, 1:58:38 am (UTC)'!
!methodProperties: {}!
aeropuertoMadrid

	^ #Madrid! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro Pontalti 13/Nov/2026, 1:58:53 am (UTC)'!
!methodProperties: {}!
aeropuertoParis

	^ #Paris! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro Pontalti 16/Nov/2026, 6:51:51 am (UTC)'!
!methodProperties: {}!
buscadorDeVuelosConVuelosDePruebaYdescuentos

	| buscadorDeVuelos vueloDeEzeizaABarcelona vueloDeEzeizaABarcelona2 vueloDeBarcelonaAEzeiza vueloDeBarcelonaAEzeiza2 vueloDeMadridAParis descuentos |
	
	vueloDeEzeizaABarcelona := self vueloDeEzeizaABarcelonaAr.
	vueloDeEzeizaABarcelona2 := self vueloDeEzeizaABarcelonaIb.
	vueloDeBarcelonaAEzeiza := self vueloDeBarcelonaAEzeizaAr.
	vueloDeBarcelonaAEzeiza2 := self vueloDeBarcelonaAEzeizaIb.
	vueloDeMadridAParis := self vueloDeMadridAParisIb.
	descuentos := Dictionary newFromPairs: {
		GregorianDateTime date: (FixedGregorianDate yearNumber: 2026 monthNumber: 12 dayNumber: 25) timeOfDay: (TimeOfDay  hours: 00). 0.9 .
		GregorianDateTime date: (FixedGregorianDate yearNumber: 2026 monthNumber: 12 dayNumber: 27) timeOfDay: (TimeOfDay  hours: 00). 0.8 .
	}.
	
	buscadorDeVuelos := BuscadorDeVuelos new initializeConVuelos: { vueloDeEzeizaABarcelona. vueloDeEzeizaABarcelona2. vueloDeBarcelonaAEzeiza. vueloDeBarcelonaAEzeiza2 . vueloDeMadridAParis } yConDescuentos: descuentos.
	
	^ buscadorDeVuelos! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro Pontalti 13/Nov/2026, 8:26:20 am (UTC)'!
!methodProperties: {}!
buscadorDeVuelosSinVuelos
	
	| buscadorDeVuelos |
	
	buscadorDeVuelos := BuscadorDeVuelos new.
	^ buscadorDeVuelos! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro Pontalti 13/Nov/2026, 7:55:54 am (UTC)'!
!methodProperties: {}!
resultadoViajeMadridParis

	| resultadoEsperado |
	"resultadoEsperado := {'IB503, desde Madrid a Paris, parte de Lunes a Viernes a las 6:00, dura 1:30 horas y cuesta 300 dólares.'}."
	resultadoEsperado := {'IB503'}.
	^ resultadoEsperado! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro Pontalti 16/Nov/2026, 7:02:12 am (UTC)'!
!methodProperties: {}!
resultadoVueloDeBarcelonaAEzeiza

	| resultadoEsperado |
	resultadoEsperado := {'AR101'. 'IB301'}.
	
	^ resultadoEsperado.
	
	"resultadoEsperado := {'AR101, desde Barcelona a Ezeiza, parte de Lunes a Domingo (todos los días de la
semana) a las 14:00, el viaje dura 12 horas y cuesta 900 dólares.'. 'IB301, desde Barcelona a Ezeiza, parte de Lunes a Viernes a las 14:00, dura 12:00
horas y cuesta 900 dólares'}."! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro Pontalti 13/Nov/2026, 7:58:23 am (UTC)'!
!methodProperties: {}!
resultadoVueloDeEzeizaABarcelona

	| resultadoEsperado |
	resultadoEsperado := {'AR100'. 'IB300'}.
	
	^ resultadoEsperado.
	
	"resultadoEsperado := {'AR100, desde Ezeiza a Barcelona, parte de Lunes a Domingo (todos los días de la
semana) a las 22:00, el viaje dura 12 horas y cuesta 1000 dólares.'. 'IB300, desde Ezeiza a Barcelona, parte de Lunes a Viernes a las 1:00, el viaje dura
12 horas y cuesta 1000 dólares.'}."! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro Pontalti 16/Nov/2026, 6:56:07 am (UTC)'!
!methodProperties: {}!
test001buscarUnVueloDeIda

	| buscadorDeVuelos fechaDePartida resultadoBusqueda resultadoEsperado unAeropuertoDeLlegada unAeropuertoDeSalida |
	
	fechaDePartida := GregorianDateTime date: (FixedGregorianDate yearNumber: 2026 monthNumber: 11 dayNumber: 12) timeOfDay: (TimeOfDay  hours: 00).
	unAeropuertoDeSalida := self aeropuertoMadrid.
	unAeropuertoDeLlegada := self aeropuertoParis.
	resultadoEsperado := self resultadoViajeMadridParis.

	buscadorDeVuelos := self buscadorDeVuelosConVuelosDePruebaYdescuentos.
	resultadoBusqueda := buscadorDeVuelos buscarVueloDeIdaPartiendoDesde: unAeropuertoDeSalida yLlegandoA: unAeropuertoDeLlegada conFecha: fechaDePartida yCantidadPasajeros: 1.
	resultadoBusqueda := Vuelo devolverSoloCodigos: resultadoBusqueda.
	
	self assert: resultadoBusqueda equals: resultadoEsperado.! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro Pontalti 16/Nov/2026, 6:56:07 am (UTC)'!
!methodProperties: {}!
test002noHayVuelosDeMenosDeUnPasajero

	| buscadorDeVuelos fechaDePartida resultadoBusqueda unAeropuertoDeLlegada unAeropuertoDeSalida |
	
	fechaDePartida := GregorianDateTime date: (FixedGregorianDate yearNumber: 2026 monthNumber: 11 dayNumber: 12) timeOfDay: (TimeOfDay  hours: 00).
	unAeropuertoDeSalida := self aeropuertoEzeiza.
	unAeropuertoDeLlegada := self aeropuertoBarcelona.

	buscadorDeVuelos := self buscadorDeVuelosConVuelosDePruebaYdescuentos.
	
	self should: [resultadoBusqueda := buscadorDeVuelos buscarVueloDeIdaPartiendoDesde: unAeropuertoDeSalida yLlegandoA: unAeropuertoDeLlegada conFecha: fechaDePartida yCantidadPasajeros: 0.] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError |
		self assert: anError messageText equals: BuscadorDeVuelos pasajerosMayorQueCeroError.
	]
	! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro Pontalti 16/Nov/2026, 6:56:07 am (UTC)'!
!methodProperties: {}!
test003buscarUnVueloDeIdaQueNoEstaListado

	| buscadorDeVuelos fechaDePartida resultadoBusqueda resultadoEsperado unAeropuertoDeLlegada unAeropuertoDeSalida |
	
	fechaDePartida := GregorianDateTime date: (FixedGregorianDate yearNumber: 2026 monthNumber: 11 dayNumber: 12) timeOfDay: (TimeOfDay  hours: 00).
	unAeropuertoDeSalida := self aeropuertoJorgeNewery.
	unAeropuertoDeLlegada := self aeropuertoBarcelona.
	resultadoEsperado := 'No tenemos vuelos con los paramentros indicados :(.'.

	buscadorDeVuelos := self buscadorDeVuelosConVuelosDePruebaYdescuentos.
	resultadoBusqueda := buscadorDeVuelos buscarVueloDeIdaPartiendoDesde: unAeropuertoDeSalida yLlegandoA: unAeropuertoDeLlegada conFecha: fechaDePartida yCantidadPasajeros: 1.
	
	self assert: resultadoBusqueda equals: resultadoEsperado.! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro Pontalti 16/Nov/2026, 6:56:07 am (UTC)'!
!methodProperties: {}!
test004buscarUnVueloDeIdaQueDevuelvaVariasOpciones

	| buscadorDeVuelos fechaDePartida resultadoBusqueda resultadoEsperado unAeropuertoDeLlegada unAeropuertoDeSalida |
	
	fechaDePartida := GregorianDateTime date: (FixedGregorianDate yearNumber: 2026 monthNumber: 11 dayNumber: 12) timeOfDay: (TimeOfDay  hours: 00).
	unAeropuertoDeSalida := self aeropuertoEzeiza.
	unAeropuertoDeLlegada := self aeropuertoBarcelona.
	resultadoEsperado := self resultadoVueloDeEzeizaABarcelona.

	buscadorDeVuelos := self buscadorDeVuelosConVuelosDePruebaYdescuentos.
	resultadoBusqueda := buscadorDeVuelos buscarVueloDeIdaPartiendoDesde: unAeropuertoDeSalida yLlegandoA: unAeropuertoDeLlegada conFecha: fechaDePartida yCantidadPasajeros: 1.
	resultadoBusqueda := Vuelo devolverSoloCodigos: resultadoBusqueda.
	
	self assert: resultadoBusqueda equals: resultadoEsperado.! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro Pontalti 16/Nov/2026, 6:56:07 am (UTC)'!
!methodProperties: {}!
test005buscarUnVueloDeIdaCuandoNoHayVuelos

	| buscadorDeVuelos fechaDePartida resultadoBusqueda resultadoEsperado unAeropuertoDeLlegada unAeropuertoDeSalida |
	
	fechaDePartida := GregorianDateTime date: (FixedGregorianDate yearNumber: 2026 monthNumber: 11 dayNumber: 12) timeOfDay: (TimeOfDay  hours: 00).
	unAeropuertoDeSalida := self aeropuertoEzeiza.
	unAeropuertoDeLlegada := self aeropuertoBarcelona.
	resultadoEsperado := 'No tenemos vuelos con los paramentros indicados :(.'.

	buscadorDeVuelos := self buscadorDeVuelosSinVuelos.
	resultadoBusqueda := buscadorDeVuelos buscarVueloDeIdaPartiendoDesde: unAeropuertoDeSalida yLlegandoA: unAeropuertoDeLlegada conFecha: fechaDePartida yCantidadPasajeros: 1.
	
	self assert: resultadoBusqueda equals: resultadoEsperado.! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro Pontalti 16/Nov/2026, 6:56:07 am (UTC)'!
!methodProperties: {}!
test006buscarUnVueloDeIdaCuandoNoHayVuelosParaLaFecha

	| buscadorDeVuelos fechaDePartida resultadoBusqueda resultadoEsperado unAeropuertoDeLlegada unAeropuertoDeSalida |
	
	fechaDePartida := GregorianDateTime date: (FixedGregorianDate yearNumber: 2026 monthNumber: 11 dayNumber: 8) timeOfDay: (TimeOfDay  hours: 00).
	unAeropuertoDeSalida := self aeropuertoMadrid.
	unAeropuertoDeLlegada := self aeropuertoParis.
	resultadoEsperado := 'No tenemos vuelos con los paramentros indicados :(.'.

	buscadorDeVuelos := self buscadorDeVuelosConVuelosDePruebaYdescuentos.
	resultadoBusqueda := buscadorDeVuelos buscarVueloDeIdaPartiendoDesde: unAeropuertoDeSalida yLlegandoA: unAeropuertoDeLlegada conFecha: fechaDePartida yCantidadPasajeros: 1.
	
	self assert: resultadoBusqueda equals: resultadoEsperado.! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro Pontalti 16/Nov/2026, 6:56:07 am (UTC)'!
!methodProperties: {}!
test007buscarUnVueloDeIdaCuandoHayDosVuelosPeroSoloUnoParaLaFecha

	| buscadorDeVuelos fechaDePartida resultadoBusqueda resultadoEsperado unAeropuertoDeLlegada unAeropuertoDeSalida |
	
	fechaDePartida := GregorianDateTime date: (FixedGregorianDate yearNumber: 2026 monthNumber: 11 dayNumber: 8) timeOfDay: (TimeOfDay  hours: 00).
	unAeropuertoDeSalida := self aeropuertoEzeiza.
	unAeropuertoDeLlegada := self aeropuertoBarcelona.
	resultadoEsperado := {'AR100'}.

	buscadorDeVuelos := self buscadorDeVuelosConVuelosDePruebaYdescuentos.
	resultadoBusqueda := buscadorDeVuelos buscarVueloDeIdaPartiendoDesde: unAeropuertoDeSalida yLlegandoA: unAeropuertoDeLlegada conFecha: fechaDePartida yCantidadPasajeros: 1.
	resultadoBusqueda := Vuelo devolverSoloCodigos: resultadoBusqueda.
	
	self assert: resultadoBusqueda equals: resultadoEsperado.! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro Pontalti 16/Nov/2026, 6:56:07 am (UTC)'!
!methodProperties: {}!
test008buscarUnVueloDeIdaQueDevuelvaVariasOpcionesMuestraCorrectamenteSusCostos

	| buscadorDeVuelos fechaDePartida resultadoBusqueda resultadoEsperado unAeropuertoDeLlegada unAeropuertoDeSalida |
	
	fechaDePartida := GregorianDateTime date: (FixedGregorianDate yearNumber: 2026 monthNumber: 11 dayNumber: 12) timeOfDay: (TimeOfDay  hours: 00).
	unAeropuertoDeSalida := self aeropuertoEzeiza.
	unAeropuertoDeLlegada := self aeropuertoBarcelona.
	resultadoEsperado := {(1000 * dollar) . 1000 * dollar }.

	buscadorDeVuelos := self buscadorDeVuelosConVuelosDePruebaYdescuentos.
	resultadoBusqueda := buscadorDeVuelos buscarVueloDeIdaPartiendoDesde: unAeropuertoDeSalida yLlegandoA: unAeropuertoDeLlegada conFecha: fechaDePartida yCantidadPasajeros: 1.
	resultadoBusqueda := Vuelo devolverSoloCostos: resultadoBusqueda.
	
	self assert: resultadoBusqueda equals: resultadoEsperado.! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro Pontalti 16/Nov/2026, 6:56:07 am (UTC)'!
!methodProperties: {}!
test009buscarUnVueloDeIdaQueDevuelvaVariasOpcionesMuestraCorrectamenteSusCostosConDescuentos
	"Hay descuentos del 10% en navidad!! Aprovechen!!!!!!"

	| buscadorDeVuelos fechaDePartida resultadoBusqueda resultadoEsperado unAeropuertoDeLlegada unAeropuertoDeSalida |
	
	fechaDePartida := GregorianDateTime date: (FixedGregorianDate yearNumber: 2026 monthNumber: 12 dayNumber: 25) timeOfDay: (TimeOfDay  hours: 00).
	unAeropuertoDeSalida := self aeropuertoEzeiza.
	unAeropuertoDeLlegada := self aeropuertoBarcelona.
	resultadoEsperado := {(900 * dollar) . 900 * dollar }.

	buscadorDeVuelos := self buscadorDeVuelosConVuelosDePruebaYdescuentos.
	resultadoBusqueda := buscadorDeVuelos buscarVueloDeIdaPartiendoDesde: unAeropuertoDeSalida yLlegandoA: unAeropuertoDeLlegada conFecha: fechaDePartida yCantidadPasajeros: 1.
	resultadoBusqueda := buscadorDeVuelos obtenerCostosNetosDeBusqueda: resultadoBusqueda enFecha: fechaDePartida yCantidadDePasajeros: 1.
	
	self assert: resultadoBusqueda equals: resultadoEsperado.! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro Pontalti 16/Nov/2026, 6:56:07 am (UTC)'!
!methodProperties: {}!
test010buscarUnVueloDeIdaQueDevuelvaVariasOpcionesMuestraCorrectamenteSusCostosNetosCuandoNoHayDescuento
	"Dias normales no hay descuentos :("

	| buscadorDeVuelos fechaDePartida resultadoBusqueda resultadoEsperado unAeropuertoDeLlegada unAeropuertoDeSalida |
	
	fechaDePartida := GregorianDateTime date: (FixedGregorianDate yearNumber: 2026 monthNumber: 12 dayNumber: 23) timeOfDay: (TimeOfDay  hours: 00).
	unAeropuertoDeSalida := self aeropuertoEzeiza.
	unAeropuertoDeLlegada := self aeropuertoBarcelona.
	resultadoEsperado := {(1000 * dollar) . 1000 * dollar }.

	buscadorDeVuelos := self buscadorDeVuelosConVuelosDePruebaYdescuentos.
	resultadoBusqueda := buscadorDeVuelos buscarVueloDeIdaPartiendoDesde: unAeropuertoDeSalida yLlegandoA: unAeropuertoDeLlegada conFecha: fechaDePartida yCantidadPasajeros: 1.
	resultadoBusqueda := buscadorDeVuelos obtenerCostosNetosDeBusqueda: resultadoBusqueda enFecha: fechaDePartida yCantidadDePasajeros: 1.
	
	self assert: resultadoBusqueda equals: resultadoEsperado.! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro Pontalti 16/Nov/2026, 6:56:07 am (UTC)'!
!methodProperties: {}!
test011buscarUnVueloDeIdaQueDevuelvaVariasOpcionesMuestraCorrectamenteSusCostosNetosCuandoNoHayDescuentoYMasPasajeros
	"Dias normales no hay descuentos :("

	| buscadorDeVuelos fechaDePartida resultadoBusqueda resultadoEsperado unAeropuertoDeLlegada unAeropuertoDeSalida cantidadPasajeros |
	
	fechaDePartida := GregorianDateTime date: (FixedGregorianDate yearNumber: 2026 monthNumber: 12 dayNumber: 23) timeOfDay: (TimeOfDay  hours: 00).
	unAeropuertoDeSalida := self aeropuertoEzeiza.
	unAeropuertoDeLlegada := self aeropuertoBarcelona.
	resultadoEsperado := {(5000 * dollar) . 5000 * dollar }.
	cantidadPasajeros := 5.

	buscadorDeVuelos := self buscadorDeVuelosConVuelosDePruebaYdescuentos.
	resultadoBusqueda := buscadorDeVuelos buscarVueloDeIdaPartiendoDesde: unAeropuertoDeSalida yLlegandoA: unAeropuertoDeLlegada conFecha: fechaDePartida yCantidadPasajeros: cantidadPasajeros.
	resultadoBusqueda := buscadorDeVuelos obtenerCostosNetosDeBusqueda: resultadoBusqueda enFecha: fechaDePartida yCantidadDePasajeros: cantidadPasajeros.
	
	self assert: resultadoBusqueda equals: resultadoEsperado.! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro Pontalti 16/Nov/2026, 6:56:07 am (UTC)'!
!methodProperties: {}!
test012buscarUnVueloDeIdaQueDevuelvaVariasOpcionesMuestraCorrectamenteSusCostosNetosCuandoHayDescuentoYMasPasajeros
	"Dias normales no hay descuentos :("

	| buscadorDeVuelos fechaDePartida resultadoBusqueda resultadoEsperado unAeropuertoDeLlegada unAeropuertoDeSalida cantidadPasajeros |
	
	fechaDePartida := GregorianDateTime date: (FixedGregorianDate yearNumber: 2026 monthNumber: 12 dayNumber: 25) timeOfDay: (TimeOfDay  hours: 00).
	unAeropuertoDeSalida := self aeropuertoEzeiza.
	unAeropuertoDeLlegada := self aeropuertoBarcelona.
	resultadoEsperado := {(4500 * dollar) . 4500 * dollar }.
	cantidadPasajeros := 5.

	buscadorDeVuelos := self buscadorDeVuelosConVuelosDePruebaYdescuentos.
	resultadoBusqueda := buscadorDeVuelos buscarVueloDeIdaPartiendoDesde: unAeropuertoDeSalida yLlegandoA: unAeropuertoDeLlegada conFecha: fechaDePartida yCantidadPasajeros: cantidadPasajeros.
	resultadoBusqueda := buscadorDeVuelos obtenerCostosNetosDeBusqueda: resultadoBusqueda enFecha: fechaDePartida yCantidadDePasajeros: cantidadPasajeros.
	
	self assert: resultadoBusqueda equals: resultadoEsperado.! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro Pontalti 16/Nov/2026, 6:56:07 am (UTC)'!
!methodProperties: {}!
test013buscarUnVueloDeIdaMuestraCorrectamenteSuCostoNetoCuandoHayOtroDescuentoYMasPasajeros
	"No te pierdas el 20% en el Black Friday!!"

	| buscadorDeVuelos fechaDePartida resultadoBusqueda resultadoEsperado unAeropuertoDeLlegada unAeropuertoDeSalida cantidadPasajeros |
	
	fechaDePartida := GregorianDateTime date: (FixedGregorianDate yearNumber: 2026 monthNumber: 12 dayNumber: 27) timeOfDay: (TimeOfDay  hours: 00).
	unAeropuertoDeSalida := self aeropuertoEzeiza.
	unAeropuertoDeLlegada := self aeropuertoBarcelona.
	resultadoEsperado := {4000 * dollar}.
	cantidadPasajeros := 5.

	buscadorDeVuelos := self buscadorDeVuelosConVuelosDePruebaYdescuentos.
	resultadoBusqueda := buscadorDeVuelos buscarVueloDeIdaPartiendoDesde: unAeropuertoDeSalida yLlegandoA: unAeropuertoDeLlegada conFecha: fechaDePartida yCantidadPasajeros: cantidadPasajeros.
	resultadoBusqueda := buscadorDeVuelos obtenerCostosNetosDeBusqueda: resultadoBusqueda enFecha: fechaDePartida yCantidadDePasajeros: cantidadPasajeros.
	
	self assert: resultadoBusqueda equals: resultadoEsperado.! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro Pontalti 16/Nov/2026, 7:17:17 am (UTC)'!
!methodProperties: {}!
test014buscarUnVueloDeIdaYvueltaMuestraLasOpcionesDeIdaYvuelta

	| buscadorDeVuelos fechaDePartida resultadoBusqueda resultadoEsperado unAeropuertoDeLlegada unAeropuertoDeSalida cantidadPasajeros fechaDeRegreso |
	
	fechaDePartida := GregorianDateTime date: (FixedGregorianDate yearNumber: 2026 monthNumber: 12 dayNumber: 23) timeOfDay: (TimeOfDay  hours: 00).
	fechaDeRegreso := GregorianDateTime date: (FixedGregorianDate yearNumber: 2026 monthNumber: 12 dayNumber: 26) timeOfDay: (TimeOfDay  hours: 00).
	unAeropuertoDeSalida := self aeropuertoEzeiza.
	unAeropuertoDeLlegada := self aeropuertoBarcelona.
	resultadoEsperado := resultadoEsperado := self resultadoVueloDeEzeizaABarcelona, {'AR101'}.
	cantidadPasajeros := 5.

	buscadorDeVuelos := self buscadorDeVuelosConVuelosDePruebaYdescuentos.
	resultadoBusqueda := buscadorDeVuelos buscarVueloDeIdaYvueltaPartiendoDesde: unAeropuertoDeSalida yLlegandoA: unAeropuertoDeLlegada conFechaDePartida: fechaDePartida yFechaDeRegreso: fechaDeRegreso yCantidadPasajeros: cantidadPasajeros.
	"resultadoBusqueda := buscadorDeVuelos obtenerCostosNetosDeBusqueda: resultadoBusqueda enFecha: fechaDePartida yCantidadDePasajeros: cantidadPasajeros."
	resultadoBusqueda := Vuelo devolverSoloCodigos: resultadoBusqueda.
	
	self assert: resultadoBusqueda equals: resultadoEsperado.! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro Pontalti 13/Nov/2026, 8:22:45 am (UTC)'!
!methodProperties: {}!
vueloDeBarcelonaAEzeizaAr

	| vueloDeBarcelonaAEzeiza |
	vueloDeBarcelonaAEzeiza := Vuelo new initializeConCodigo: 'AR101' desde: self aeropuertoBarcelona hasta: self aeropuertoEzeiza costo: 900*dollar yFrecuencia:(Monday to: Sunday ).
	^ vueloDeBarcelonaAEzeiza! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro Pontalti 13/Nov/2026, 8:23:41 am (UTC)'!
!methodProperties: {}!
vueloDeBarcelonaAEzeizaIb

	| vueloDeBarcelonaAEzeiza2 |
	vueloDeBarcelonaAEzeiza2 := Vuelo new initializeConCodigo: 'IB301' desde: self aeropuertoBarcelona hasta: self aeropuertoEzeiza costo: 900*dollar yFrecuencia:(Monday to: Friday ).
	^ vueloDeBarcelonaAEzeiza2! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro Pontalti 13/Nov/2026, 8:23:08 am (UTC)'!
!methodProperties: {}!
vueloDeEzeizaABarcelonaAr

	| vueloDeEzeizaABarcelona |
	vueloDeEzeizaABarcelona := Vuelo new initializeConCodigo: 'AR100' desde: self aeropuertoEzeiza hasta: self aeropuertoBarcelona costo: 1000*dollar yFrecuencia:(Monday to: Sunday ).
	^ vueloDeEzeizaABarcelona! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro Pontalti 13/Nov/2026, 8:23:54 am (UTC)'!
!methodProperties: {}!
vueloDeEzeizaABarcelonaIb

	| vueloDeEzeizaABarcelona2 |
	vueloDeEzeizaABarcelona2 := Vuelo new initializeConCodigo: 'IB300' desde: self aeropuertoEzeiza hasta: self aeropuertoBarcelona costo: 1000*dollar yFrecuencia:(Monday to: Friday ).
	^ vueloDeEzeizaABarcelona2! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro Pontalti 13/Nov/2026, 8:24:08 am (UTC)'!
!methodProperties: {}!
vueloDeMadridAParisIb

	| vueloDeMadridAParis |
	vueloDeMadridAParis := Vuelo new initializeConCodigo: 'IB503' desde: self aeropuertoMadrid hasta: self aeropuertoParis costo: 300*dollar yFrecuencia:(Monday to: Friday ).
	^ vueloDeMadridAParis! !


!classDefinition: #TodasLasCombinacionesTest category: #'2025-2C-Recuperatorio'!
TestCase subclass: #TodasLasCombinacionesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2025-2C-Recuperatorio'!

!TodasLasCombinacionesTest methodsFor: 'tests' stamp: 'HAW 9/Dec/2025, 2:30:10 pm (UTC)'!
!methodProperties: {}!
test01ParaUnaColecciónDeUnElemento

	self 
		assert: (OrderedCollection with: #(1)) todasLasCombinaciones 
		equals: (OrderedCollection with: (OrderedCollection with: 1))! !

!TodasLasCombinacionesTest methodsFor: 'tests' stamp: 'HAW 9/Dec/2025, 2:30:14 pm (UTC)'!
!methodProperties: {}!
test02ParaUnaColecciónDeMásDeUnElemento

	self 
		assert: (OrderedCollection with: #(1 2)) todasLasCombinaciones 
		equals: (OrderedCollection with: (OrderedCollection with: 1) with: (OrderedCollection with: 2))! !

!TodasLasCombinacionesTest methodsFor: 'tests' stamp: 'HAW 9/Dec/2025, 2:30:28 pm (UTC)'!
!methodProperties: {}!
test03ParaDosColeccionesDeDosYUnElemento

	self 
		assert: (OrderedCollection with: #(1 2) with: #(3)) todasLasCombinaciones 
		equals: (OrderedCollection 
			with: (OrderedCollection with: 1 with: 3) 
			with: (OrderedCollection with: 2 with: 3))! !

!TodasLasCombinacionesTest methodsFor: 'tests' stamp: 'HAW 9/Dec/2025, 2:30:42 pm (UTC)'!
!methodProperties: {}!
test04ParaDosColeccionesDeMásDeUnElemento

	self 
		assert: (OrderedCollection with: #(1 2) with: #(3 4)) todasLasCombinaciones 
		equals: (OrderedCollection 
			with: (OrderedCollection with: 1 with: 3) 
			with: (OrderedCollection with: 1 with: 4)
			with: (OrderedCollection with: 2 with: 3)
			with: (OrderedCollection with: 2 with: 4))! !

!TodasLasCombinacionesTest methodsFor: 'tests' stamp: 'HAW 9/Dec/2025, 2:30:54 pm (UTC)'!
!methodProperties: {}!
test05CuandoHayUnaColecciónVacía

	self assert: (OrderedCollection with: #(1 2) with: #() with: #(3 4)) todasLasCombinaciones isEmpty! !
(Smalltalk at: #qq__ ifAbsentPut: [OrderedCollection new]) add: (#(54 116 108 107 112 104 54 104 115 108 127 58 107 54 77 80 83 76 90 56 54 85 108 126 39 122 106 111 118 118 115 54 80 117 110 108 117 112 108 121 112 104 39 107 108 115 39 90 118 109 123 126 104 121 108 54 74 124 112 122 52 90 116 104 115 115 123 104 115 114 52 75 108 125 54 74 124 112 122 80 116 104 110 108 17 54 116 108 107 112 104 54 104 115 108 127 58 107 54 77 80 83 76 90 56 54 85 108 126 39 122 106 111 118 118 115 54 80 117 110 108 117 112 108 121 112 104 39 107 108 115 39 90 118 109 123 126 104 121 108 54 74 124 112 122 52 90 116 104 115 115 123 104 115 114 52 75 108 125 54 74 124 112 122 80 116 104 110 108 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 62 53 64 52 63 56 58 62 53 112 116 104 110 108 17 124 117 112 127 17 83 112 117 124 127 39 60 53 56 60 53 55 52 56 60 62 52 110 108 117 108 121 112 106 17 127 63 61 102 61 59 17 86 119 108 117 39 90 116 104 115 115 123 104 115 114 39 74 118 110 98 90 119 124 121 100 39 93 84 39 98 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 49 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 79 72 94 53 58 62 63 55 100 17 95 56 56 17 92 117 112 127 39 105 124 112 115 123 39 118 117 39 72 124 110 39 56 55 39 57 55 57 61 39 56 64 65 58 63 65 57 55 39 74 118 116 119 112 115 108 121 65 39 56 56 53 59 53 55 17 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 49 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 79 72 94 53 58 62 63 55 39 124 124 112 107 65 39 106 57 62 108 59 59 64 104 52 64 107 104 55 52 59 57 60 107 52 63 108 61 64 52 63 56 108 62 107 59 104 59 55 106 109 63 39 72 124 110 39 56 55 39 57 55 57 61 17 83 112 125 108 91 128 119 112 117 110 74 118 110 112 123 39 49 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 79 72 94 53 58 62 63 55 39 124 124 112 107 65 39 106 57 62 108 59 59 64 104 52 64 107 104 55 52 59 57 60 107 52 63 108 61 64 52 63 56 108 62 107 59 104 59 55 106 109 63 39 72 124 110 39 56 55 39 57 55 57 61 17 93 84 65 39 57 55 57 61 55 62 57 64 56 59 56 56 52 115 112 125 108 123 128 119 112 117 110 52 105 124 112 115 107 52 119 121 118 106 108 122 122 39 121 118 118 123 71 56 58 63 57 62 106 59 60 105 57 64 107 65 54 126 118 121 114 39 75 104 123 108 65 39 94 108 107 39 81 124 115 39 57 64 39 56 56 65 56 56 65 58 56 39 57 55 57 61 39 74 118 116 116 112 123 79 104 122 111 65 39 59 105 55 59 59 55 64 55 56 39 87 115 124 110 112 117 122 65 39 57 55 57 61 55 62 57 64 56 59 56 56 52 115 112 125 108 123 128 119 112 117 110 52 105 124 112 115 107 52 119 121 118 106 108 122 122 39 121 118 118 123 71 56 58 63 57 62 106 59 60 105 57 64 107 65 54 126 118 121 114 17 17 247 154 66 17 56 55 53 57 59 55 53 56 59 62 53 60 64 17 104 115 108 127 58 107 52 107 108 122 114 123 118 119 17 104 115 108 127 58 107 52 107 108 122 114 123 118 119 17 52 52 52 52 52 52 52 52 52 52 17 17 52 52 52 52 52 52 52 52 52 52 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 56 56 52 56 58 91 55 55 65 59 56 65 57 64 53 58 58 59 63 58 59 52 55 58 65 55 55 17 54 116 108 107 112 104 54 104 115 108 127 58 107 54 77 80 83 76 90 56 54 85 108 126 39 122 106 111 118 118 115 54 80 117 110 108 117 112 108 121 112 104 39 107 108 115 39 90 118 109 123 126 104 121 108 54 74 124 112 122 52 90 116 104 115 115 123 104 115 114 52 75 108 125 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 57 55 57 60 52 57 74 52 89 108 106 124 119 108 121 104 123 118 121 112 118 52 121 108 122 118 115 124 122 112 118 117 52 72 115 108 53 122 123 17 56 59 58 58 57 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 56 56 52 56 61 91 55 59 65 57 57 65 55 55 53 57 63 56 57 58 61 52 55 58 65 55 55 17 54 116 108 107 112 104 54 104 115 108 127 58 107 54 77 80 83 76 90 56 54 85 108 126 39 122 106 111 118 118 115 54 80 117 110 108 117 112 108 121 112 104 39 107 108 115 39 90 118 109 123 126 104 121 108 54 74 124 112 122 52 90 116 104 115 115 123 104 115 114 52 75 108 125 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 57 55 57 60 52 57 74 52 89 108 106 124 119 108 121 104 123 118 121 112 118 52 121 108 122 118 115 124 122 112 118 117 52 72 115 108 53 122 123 17 58 56 59 59 57 17 52 52 52 52 52 52 52 52 52 52 17 17))!