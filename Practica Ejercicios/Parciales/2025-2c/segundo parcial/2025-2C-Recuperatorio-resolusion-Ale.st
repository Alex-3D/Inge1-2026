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


!BuscadorDeVuelos methodsFor: 'busquedas' stamp: 'Alejandro pontalti 14/Nov/2026, 7:21:34 pm (UTC)'!
!methodProperties: {}!
buscarVueloPartiendoDesde: unAeropuertoDeSalida yLlegandoA: unAeropuertoDeLlegada conFecha: fechaDePartida yCantidadPasajeros: cantidadPasajeros 
	
	| resultadoBusqueda |
	
	self cantidadDePasajerosValida: cantidadPasajeros.

	resultadoBusqueda := (vuelos select: [:unVuelo | unVuelo esEsteVuelosalienteDesdeAeropuerto: unAeropuertoDeSalida hastaAeropuerto: unAeropuertoDeLlegada partiendoEstaFecha: fechaDePartida ]) ifEmpty: [^self class noSeEncontraronVuelos ].
	
	^resultadoBusqueda.! !

!BuscadorDeVuelos methodsFor: 'busquedas' stamp: 'Alejandro pontalti 14/Nov/2026, 7:49:21 pm (UTC)'!
!methodProperties: {}!
obtenerCostosNetosDeBusqueda: resultadoBusqueda 
	self shouldBeImplemented.! !

!BuscadorDeVuelos methodsFor: 'busquedas' stamp: 'Alejandro pontalti 14/Nov/2026, 7:53:00 pm (UTC)'!
!methodProperties: {}!
obtenerCostosNetosDeBusqueda: unaBusqueda enFecha: fechaDePartida

	^calculadoraNeto obtenerCostosNetosDeVuelos: unaBusqueda enFecha: fechaDePartida.
	! !


!BuscadorDeVuelos methodsFor: 'initialize' stamp: 'Alejandro pontalti 14/Nov/2026, 7:55:22 pm (UTC)'!
!methodProperties: {}!
initialize

	vuelos := OrderedCollection new.
	calculadoraNeto := CalculadoraCostoNeto new.! !

!BuscadorDeVuelos methodsFor: 'initialize' stamp: 'Alejandro Pontalti 13/Nov/2026, 2:29:53 am (UTC)'!
!methodProperties: {}!
initializeConVuelos: listaVuelos 

	vuelos := listaVuelos.! !

!BuscadorDeVuelos methodsFor: 'initialize' stamp: 'Alejandro pontalti 14/Nov/2026, 7:54:36 pm (UTC)'!
!methodProperties: {}!
initializeConVuelos: listaVuelos yCalucladoraCostoNeto: calculadora

	vuelos := listaVuelos.
	calculadoraNeto := calculadora.! !

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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2025-2C-Recuperatorio'!

!CalculadoraCostoNeto methodsFor: 'calcular' stamp: 'Alejandro pontalti 14/Nov/2026, 7:59:33 pm (UTC)'!
!methodProperties: {}!
obtenerCostosNetosDeVuelos: unaBusqueda enFecha: fechaDePartida 
	
	| costosBruto |

	costosBruto := Vuelo onlyCosto: unaBusqueda.
	^costosBruto collect: [:unCosto | unCosto * 0.9 ]! !


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

!Vuelo class methodsFor: 'colecciones' stamp: 'Alejandro pontalti 14/Nov/2026, 7:28:26 pm (UTC)'!
!methodProperties: {}!
onlyCoigos: vuelos 
	
	^vuelos collect: [:unVuelo | unVuelo codigo ].! !

!Vuelo class methodsFor: 'colecciones' stamp: 'Alejandro pontalti 14/Nov/2026, 7:36:54 pm (UTC)'!
!methodProperties: {}!
onlyCosto: vuelos 
	
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

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro Pontalti 13/Nov/2026, 8:25:56 am (UTC)'!
!methodProperties: {}!
buscadorDeVuelosConVuelosDePrueba

	| buscadorDeVuelos vueloDeEzeizaABarcelona vueloDeEzeizaABarcelona2 vueloDeBarcelonaAEzeiza vueloDeBarcelonaAEzeiza2 vueloDeMadridAParis |
	
	vueloDeEzeizaABarcelona := self vueloDeEzeizaABarcelonaAr.
	vueloDeEzeizaABarcelona2 := self vueloDeEzeizaABarcelonaIb.
	vueloDeBarcelonaAEzeiza := self vueloDeBarcelonaAEzeizaAr.
	vueloDeBarcelonaAEzeiza2 := self vueloDeBarcelonaAEzeizaIb.
	vueloDeMadridAParis := self vueloDeMadridAParisIb.
	
	buscadorDeVuelos := BuscadorDeVuelos new initializeConVuelos: { vueloDeEzeizaABarcelona. vueloDeEzeizaABarcelona2. vueloDeBarcelonaAEzeiza. vueloDeBarcelonaAEzeiza2 . vueloDeMadridAParis }.
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

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro Pontalti 13/Nov/2026, 7:58:23 am (UTC)'!
!methodProperties: {}!
resultadoVueloDeEzeizaABarcelona

	| resultadoEsperado |
	resultadoEsperado := {'AR100'. 'IB300'}.
	
	^ resultadoEsperado.
	
	"resultadoEsperado := {'AR100, desde Ezeiza a Barcelona, parte de Lunes a Domingo (todos los días de la
semana) a las 22:00, el viaje dura 12 horas y cuesta 1000 dólares.'. 'IB300, desde Ezeiza a Barcelona, parte de Lunes a Viernes a las 1:00, el viaje dura
12 horas y cuesta 1000 dólares.'}."! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro pontalti 14/Nov/2026, 7:26:40 pm (UTC)'!
!methodProperties: {}!
test001buscarUnVueloDeIda

	| buscadorDeVuelos fechaDePartida resultadoBusqueda resultadoEsperado unAeropuertoDeLlegada unAeropuertoDeSalida |
	
	fechaDePartida := GregorianDateTime date: (FixedGregorianDate yearNumber: 2026 monthNumber: 11 dayNumber: 12) timeOfDay: (TimeOfDay  hours: 00).
	unAeropuertoDeSalida := self aeropuertoMadrid.
	unAeropuertoDeLlegada := self aeropuertoParis.
	resultadoEsperado := self resultadoViajeMadridParis.

	buscadorDeVuelos := self buscadorDeVuelosConVuelosDePrueba.
	resultadoBusqueda := buscadorDeVuelos buscarVueloPartiendoDesde: unAeropuertoDeSalida yLlegandoA: unAeropuertoDeLlegada conFecha: fechaDePartida yCantidadPasajeros: 1.
	resultadoBusqueda := Vuelo onlyCoigos: resultadoBusqueda.
	
	self assert: resultadoBusqueda equals: resultadoEsperado.! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro Pontalti 13/Nov/2026, 8:25:56 am (UTC)'!
!methodProperties: {}!
test002noHayVuelosDeMenosDeUnPasajero

	| buscadorDeVuelos fechaDePartida resultadoBusqueda unAeropuertoDeLlegada unAeropuertoDeSalida |
	
	fechaDePartida := GregorianDateTime date: (FixedGregorianDate yearNumber: 2026 monthNumber: 11 dayNumber: 12) timeOfDay: (TimeOfDay  hours: 00).
	unAeropuertoDeSalida := self aeropuertoEzeiza.
	unAeropuertoDeLlegada := self aeropuertoBarcelona.

	buscadorDeVuelos := self buscadorDeVuelosConVuelosDePrueba.
	
	self should: [resultadoBusqueda := buscadorDeVuelos buscarVueloPartiendoDesde: unAeropuertoDeSalida yLlegandoA: unAeropuertoDeLlegada conFecha: fechaDePartida yCantidadPasajeros: 0.] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError |
		self assert: anError messageText equals: BuscadorDeVuelos pasajerosMayorQueCeroError.
	]
	! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro Pontalti 13/Nov/2026, 8:25:56 am (UTC)'!
!methodProperties: {}!
test003buscarUnVueloDeIdaQueNoExiste

	| buscadorDeVuelos fechaDePartida resultadoBusqueda resultadoEsperado unAeropuertoDeLlegada unAeropuertoDeSalida |
	
	fechaDePartida := GregorianDateTime date: (FixedGregorianDate yearNumber: 2026 monthNumber: 11 dayNumber: 12) timeOfDay: (TimeOfDay  hours: 00).
	unAeropuertoDeSalida := self aeropuertoJorgeNewery.
	unAeropuertoDeLlegada := self aeropuertoBarcelona.
	resultadoEsperado := 'No tenemos vuelos con los paramentros indicados :(.'.

	buscadorDeVuelos := self buscadorDeVuelosConVuelosDePrueba.
	resultadoBusqueda := buscadorDeVuelos buscarVueloPartiendoDesde: unAeropuertoDeSalida yLlegandoA: unAeropuertoDeLlegada conFecha: fechaDePartida yCantidadPasajeros: 1.
	
	self assert: resultadoBusqueda equals: resultadoEsperado.! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro pontalti 14/Nov/2026, 7:29:26 pm (UTC)'!
!methodProperties: {}!
test004buscarUnVueloDeIdaQueDevuelvaVariasOpciones

	| buscadorDeVuelos fechaDePartida resultadoBusqueda resultadoEsperado unAeropuertoDeLlegada unAeropuertoDeSalida |
	
	fechaDePartida := GregorianDateTime date: (FixedGregorianDate yearNumber: 2026 monthNumber: 11 dayNumber: 12) timeOfDay: (TimeOfDay  hours: 00).
	unAeropuertoDeSalida := self aeropuertoEzeiza.
	unAeropuertoDeLlegada := self aeropuertoBarcelona.
	resultadoEsperado := self resultadoVueloDeEzeizaABarcelona.

	buscadorDeVuelos := self buscadorDeVuelosConVuelosDePrueba.
	resultadoBusqueda := buscadorDeVuelos buscarVueloPartiendoDesde: unAeropuertoDeSalida yLlegandoA: unAeropuertoDeLlegada conFecha: fechaDePartida yCantidadPasajeros: 1.
	resultadoBusqueda := Vuelo onlyCoigos: resultadoBusqueda.
	
	self assert: resultadoBusqueda equals: resultadoEsperado.! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro Pontalti 13/Nov/2026, 8:26:20 am (UTC)'!
!methodProperties: {}!
test005buscarUnVueloDeIdaCuandoNoHayVuelos

	| buscadorDeVuelos fechaDePartida resultadoBusqueda resultadoEsperado unAeropuertoDeLlegada unAeropuertoDeSalida |
	
	fechaDePartida := GregorianDateTime date: (FixedGregorianDate yearNumber: 2026 monthNumber: 11 dayNumber: 12) timeOfDay: (TimeOfDay  hours: 00).
	unAeropuertoDeSalida := self aeropuertoEzeiza.
	unAeropuertoDeLlegada := self aeropuertoBarcelona.
	resultadoEsperado := 'No tenemos vuelos con los paramentros indicados :(.'.

	buscadorDeVuelos := self buscadorDeVuelosSinVuelos.
	resultadoBusqueda := buscadorDeVuelos buscarVueloPartiendoDesde: unAeropuertoDeSalida yLlegandoA: unAeropuertoDeLlegada conFecha: fechaDePartida yCantidadPasajeros: 1.
	
	self assert: resultadoBusqueda equals: resultadoEsperado.! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro Pontalti 13/Nov/2026, 8:27:42 am (UTC)'!
!methodProperties: {}!
test006buscarUnVueloDeIdaCuandoNoHayVuelosParaLaFecha

	| buscadorDeVuelos fechaDePartida resultadoBusqueda resultadoEsperado unAeropuertoDeLlegada unAeropuertoDeSalida |
	
	fechaDePartida := GregorianDateTime date: (FixedGregorianDate yearNumber: 2026 monthNumber: 11 dayNumber: 8) timeOfDay: (TimeOfDay  hours: 00).
	unAeropuertoDeSalida := self aeropuertoMadrid.
	unAeropuertoDeLlegada := self aeropuertoParis.
	resultadoEsperado := 'No tenemos vuelos con los paramentros indicados :(.'.

	buscadorDeVuelos := self buscadorDeVuelosConVuelosDePrueba.
	resultadoBusqueda := buscadorDeVuelos buscarVueloPartiendoDesde: unAeropuertoDeSalida yLlegandoA: unAeropuertoDeLlegada conFecha: fechaDePartida yCantidadPasajeros: 1.
	
	self assert: resultadoBusqueda equals: resultadoEsperado.! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro pontalti 14/Nov/2026, 7:30:05 pm (UTC)'!
!methodProperties: {}!
test007buscarUnVueloDeIdaCuandoHayDosVuelosPeroSoloUnoParaLaFecha

	| buscadorDeVuelos fechaDePartida resultadoBusqueda resultadoEsperado unAeropuertoDeLlegada unAeropuertoDeSalida |
	
	fechaDePartida := GregorianDateTime date: (FixedGregorianDate yearNumber: 2026 monthNumber: 11 dayNumber: 8) timeOfDay: (TimeOfDay  hours: 00).
	unAeropuertoDeSalida := self aeropuertoEzeiza.
	unAeropuertoDeLlegada := self aeropuertoBarcelona.
	resultadoEsperado := {'AR100'}.

	buscadorDeVuelos := self buscadorDeVuelosConVuelosDePrueba.
	resultadoBusqueda := buscadorDeVuelos buscarVueloPartiendoDesde: unAeropuertoDeSalida yLlegandoA: unAeropuertoDeLlegada conFecha: fechaDePartida yCantidadPasajeros: 1.
	resultadoBusqueda := Vuelo onlyCoigos: resultadoBusqueda.
	
	self assert: resultadoBusqueda equals: resultadoEsperado.! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro pontalti 14/Nov/2026, 7:36:54 pm (UTC)'!
!methodProperties: {}!
test008buscarUnVueloDeIdaQueDevuelvaVariasOpcionesMuestraCorrectamenteSusCostos

	| buscadorDeVuelos fechaDePartida resultadoBusqueda resultadoEsperado unAeropuertoDeLlegada unAeropuertoDeSalida |
	
	fechaDePartida := GregorianDateTime date: (FixedGregorianDate yearNumber: 2026 monthNumber: 11 dayNumber: 12) timeOfDay: (TimeOfDay  hours: 00).
	unAeropuertoDeSalida := self aeropuertoEzeiza.
	unAeropuertoDeLlegada := self aeropuertoBarcelona.
	resultadoEsperado := {(1000 * dollar) . 1000 * dollar }.

	buscadorDeVuelos := self buscadorDeVuelosConVuelosDePrueba.
	resultadoBusqueda := buscadorDeVuelos buscarVueloPartiendoDesde: unAeropuertoDeSalida yLlegandoA: unAeropuertoDeLlegada conFecha: fechaDePartida yCantidadPasajeros: 1.
	resultadoBusqueda := Vuelo onlyCosto: resultadoBusqueda.
	
	self assert: resultadoBusqueda equals: resultadoEsperado.! !

!AterrizarTest methodsFor: 'test' stamp: 'Alejandro pontalti 14/Nov/2026, 7:52:32 pm (UTC)'!
!methodProperties: {}!
test009buscarUnVueloDeIdaQueDevuelvaVariasOpcionesMuestraCorrectamenteSusCostosConDescuentos
	"Hay descuentos del 10% en navidad!! Aprovechen!!!!!!"

	| buscadorDeVuelos fechaDePartida resultadoBusqueda resultadoEsperado unAeropuertoDeLlegada unAeropuertoDeSalida |
	
	fechaDePartida := GregorianDateTime date: (FixedGregorianDate yearNumber: 2026 monthNumber: 12 dayNumber: 25) timeOfDay: (TimeOfDay  hours: 00).
	unAeropuertoDeSalida := self aeropuertoEzeiza.
	unAeropuertoDeLlegada := self aeropuertoBarcelona.
	resultadoEsperado := {(900 * dollar) . 900 * dollar }.

	buscadorDeVuelos := self buscadorDeVuelosConVuelosDePrueba.
	resultadoBusqueda := buscadorDeVuelos buscarVueloPartiendoDesde: unAeropuertoDeSalida yLlegandoA: unAeropuertoDeLlegada conFecha: fechaDePartida yCantidadPasajeros: 1.
	resultadoBusqueda := buscadorDeVuelos obtenerCostosNetosDeBusqueda: resultadoBusqueda enFecha: fechaDePartida.
	
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
