!classDefinition: #MarsRover category: #'Practica-Mars-Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicion apuntandoA'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Practica-Mars-Rover'!

!MarsRover methodsFor: 'initialization' stamp: 'asd 4/Oct/2026, 5:25:19 am (UTC)'!
!methodProperties: {}!
enCoordenada: unaCoordenada apuntandoACoordenada: coordenadaApuntada 

	self validarCoordenadaPosicion: unaCoordenada yCoordenadaApuntanda: coordenadaApuntada.
	
	
	posicion := unaCoordenada .
	apuntandoA := coordenadaApuntada .! !

!MarsRover methodsFor: 'initialization' stamp: 'asd 4/Oct/2026, 5:32:14 am (UTC)'!
!methodProperties: {}!
validarCoordenadaApuntandaEsUnCardinal: coordenadaApuntada enPosicion: unaCoordenada

	|puntosCardinales|
	
	puntosCardinales := {
						(unaCoordenada y+1)@(unaCoordenada x). (unaCoordenada y)@(unaCoordenada x+1). 
						(unaCoordenada y-1)@(unaCoordenada x). (unaCoordenada y)@(unaCoordenada x-1)
					}.
	
	((puntosCardinales select: [ :x| x= coordenadaApuntada]) size = 1) ifFalse: [^self error: MarsRover 
		coordenadaApuntadaDebeSerUnCardinal].! !

!MarsRover methodsFor: 'initialization' stamp: 'asd 4/Oct/2026, 5:32:54 am (UTC)'!
!methodProperties: {}!
validarCoordenadaPosicion: unaCoordenada yCoordenadaApuntanda: coordenadaApuntada 

	(unaCoordenada class = Point) ifFalse: [^self error: MarsRover coordenadasInvalidas].
	(coordenadaApuntada class = Point) ifFalse: [^self error: MarsRover coordenadasInvalidas].
	
	
	self validarCoordenadaApuntandaEsUnCardinal: coordenadaApuntada enPosicion: unaCoordenada.! !


!MarsRover methodsFor: 'accessing' stamp: 'asd 2/Oct/2026, 7:13:38 pm (UTC)'!
!methodProperties: {}!
apuntandoA
	
	^apuntandoA.! !

!MarsRover methodsFor: 'accessing' stamp: 'asd 2/Oct/2026, 7:15:59 pm (UTC)'!
!methodProperties: {}!
posicion

	^posicion.! !


!MarsRover methodsFor: 'actions' stamp: 'asd 5/Oct/2026, 12:09:04 am (UTC)'!
!methodProperties: {}!
avanzarPosicionEnBaseACoordenada: coordenadaApuntada
	
	posicion := (coordenadaApuntada x)@(coordenadaApuntada y).
	! !

!MarsRover methodsFor: 'actions' stamp: 'asd 5/Oct/2026, 12:01:26 am (UTC)'!
!methodProperties: {}!
elegirEjeDeMovimiento: unaCantidad
	
	(posicion y = apuntandoA y) ifTrue: [self moverEnX: unaCantidad ] ifFalse: [self moverEnY: unaCantidad ].
	
	"comandos do: [ :x|
		(x = $F) ifTrue: [posicion := (posicion x )@(posicion y+1). apuntandoA := (apuntandoA x )@(apuntandoA y+1)].
		(x = $B) ifTrue: [posicion := (posicion x )@(posicion y-1). apuntandoA := (apuntandoA x )@(apuntandoA y-1)].
		(x = $L) ifTrue: [apuntandoA := (apuntandoA x-1 )@(apuntandoA y-1)]. 
		(x = $R) ifTrue: [apuntandoA := (apuntandoA x+1 )@(apuntandoA y-1)].
	]"! !

!MarsRover methodsFor: 'actions' stamp: 'asd 5/Oct/2026, 12:44:11 am (UTC)'!
!methodProperties: {}!
leerComandos: comandos
	|apuntandoAInicial|
	
	comandos do: [ :x|
		apuntandoAInicial := apuntandoA.
		(x = $F) ifTrue: [self elegirEjeDeMovimiento: 1. self avanzarPosicionEnBaseACoordenada: apuntandoAInicial ].
		(x = $B) ifTrue: [self elegirEjeDeMovimiento: -1. self retrocederPosicionEnBaseACoordenada: apuntandoAInicial].
		(x = $L) ifTrue: [apuntandoA := (apuntandoA x-1 )@(apuntandoA y-1)]. 
		(x = $R) ifTrue: [apuntandoA := (apuntandoA x+1 )@(apuntandoA y-1)].
	]! !

!MarsRover methodsFor: 'actions' stamp: 'asd 5/Oct/2026, 12:00:00 am (UTC)'!
!methodProperties: {}!
moverEnX: unaCantidad
	
	apuntandoA := (apuntandoA x + unaCantidad)@(apuntandoA y).
	! !

!MarsRover methodsFor: 'actions' stamp: 'asd 5/Oct/2026, 12:00:06 am (UTC)'!
!methodProperties: {}!
moverEnY: unaCantidad
	
	apuntandoA := (apuntandoA x)@(apuntandoA y + unaCantidad).
	! !

!MarsRover methodsFor: 'actions' stamp: 'asd 5/Oct/2026, 12:20:03 am (UTC)'!
!methodProperties: {}!
retrocederPosicionEnBaseACoordenada: coordenadaApuntada
	
	posicion := (coordenadaApuntada x)@(coordenadaApuntada y-2).
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #'Practica-Mars-Rover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'error' stamp: 'asd 2/Oct/2026, 7:36:05 pm (UTC)'!
!methodProperties: {}!
coordenadaApuntadaDebeSerUnCardinal

	^'La coordenada apuntada debe ser un pounto cardinal'.! !

!MarsRover class methodsFor: 'error' stamp: 'asd 2/Oct/2026, 7:19:34 pm (UTC)'!
!methodProperties: {}!
coordenadasInvalidas

	^'Las coordenadas ingresadas son invalidas'.! !


!classDefinition: #MarsRoverTest category: #'Practica-Mars-Rover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Practica-Mars-Rover'!

!MarsRoverTest methodsFor: 'tests' stamp: 'asd 4/Oct/2026, 5:38:37 am (UTC)'!
!methodProperties: {}!
test01DebeExistirMarsRoverEnCoordenadaApuntandoAOtraCoordenada

	|rover coordenadaApuntada coordenadaInicial |
	
	rover := self unMarsRoverApuntandoAlNorte.
	
	coordenadaInicial := rover posicion .
	coordenadaApuntada := rover apuntandoA.
	
	self assert: (rover posicion = coordenadaInicial).
	self assert: (rover apuntandoA = coordenadaApuntada ).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'asd 2/Oct/2026, 7:09:21 pm (UTC)'!
!methodProperties: {}!
test02NoPuedeExistirUnMarsRoverSinCoordenadas

	|rover coordenadaApuntada unaCoordenada |
	
	unaCoordenada := nil.
	coordenadaApuntada :=nil.
	
	self should: [rover := MarsRover new enCoordenada: unaCoordenada apuntandoACoordenada: coordenadaApuntada.]
	raise: Error 
	withExceptionDo: [ :error | error messageText = MarsRover coordenadasInvalidas.].
		
		
		
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'asd 2/Oct/2026, 11:17:46 pm (UTC)'!
!methodProperties: {}!
test03LaCoordenadaAPuntadaDebeSerUnPuntoCardinal

	|rover coordenadaApuntada unaCoordenada |
	
	unaCoordenada := 1@1.
	coordenadaApuntada :=  2@2.
	
	self should: [rover := MarsRover new enCoordenada: unaCoordenada apuntandoACoordenada: coordenadaApuntada.]
	raise: Error 
	withExceptionDo: [ :error | error messageText = MarsRover coordenadaApuntadaDebeSerUnCardinal.].
		
		
		
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'asd 4/Oct/2026, 11:54:52 pm (UTC)'!
!methodProperties: {}!
test04ElCaracterFHaceQueSeMuevaHaciaAdelante

	|rover coordenadaApuntada coordenadaInicial comandos |
	
	comandos := 'F'.
	
	rover := self unMarsRoverApuntandoAlNorte.
	coordenadaInicial := rover posicion .
	coordenadaApuntada := rover apuntandoA.
	rover leerComandos: comandos.
	
		
	self assert: (rover posicion y = (coordenadaInicial y+1)).
	self assert: (rover posicion x = (coordenadaInicial x)).
	self assert: (rover apuntandoA y = (coordenadaApuntada y+1)).
	self assert: (rover apuntandoA x = (coordenadaApuntada x)).
		
		
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'asd 4/Oct/2026, 11:55:43 pm (UTC)'!
!methodProperties: {}!
test05ElCaracterBHaceQueSeMuevaHaciaAtras

	|rover coordenadaApuntada coordenadaInicial comandos |
	
	comandos := 'B'.
	rover := self unMarsRoverApuntandoAlNorte.
	coordenadaInicial := rover posicion .
	coordenadaApuntada := rover apuntandoA.
	rover leerComandos: comandos.
	
		
	self assert: (rover posicion y = (coordenadaInicial y-1)).
	self assert: (rover posicion x = (coordenadaInicial x)).
	self assert: (rover apuntandoA y = (coordenadaApuntada y-1)).
	self assert: (rover apuntandoA x = (coordenadaApuntada x)).
		
		
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'asd 4/Oct/2026, 5:55:44 am (UTC)'!
!methodProperties: {}!
test06ElCaracterLHaceQueRote90GradosHaciaLaIzquierdaYPosicionNoCambia

	|rover coordenadaApuntada coordenadaInicial comandos |
	
	comandos := 'L'.
	rover := self unMarsRoverApuntandoAlNorte.
	
	coordenadaInicial := rover posicion .
	coordenadaApuntada := rover apuntandoA.
	rover leerComandos: comandos.
	
	
	self assert: (rover apuntandoA y = (coordenadaApuntada y-1)).
	self assert: (rover apuntandoA x = (coordenadaApuntada x-1)).
	self assert: (rover posicion y = (coordenadaInicial y)).
	self assert: (rover posicion x = (coordenadaInicial x)).
		
		
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'asd 4/Oct/2026, 6:26:06 am (UTC)'!
!methodProperties: {}!
test07ElCaracterLHaceQueRote90GradosHaciaLaDerechaYPosicionNoCambia

	|rover coordenadaApuntada coordenadaInicial comandos |
	
	comandos := 'R'.
	rover := self unMarsRoverApuntandoAlNorte.
	
	coordenadaInicial := rover posicion .
	coordenadaApuntada := rover apuntandoA.
	rover leerComandos: comandos.
		
	self assert: (rover apuntandoA y = (coordenadaApuntada y-1)).
	self assert: (rover apuntandoA x = (coordenadaApuntada x+1)).
	self assert: (rover posicion y = (coordenadaInicial y)).
	self assert: (rover posicion x = (coordenadaInicial x)).
		
		
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'asd 4/Oct/2026, 6:27:03 am (UTC)'!
!methodProperties: {}!
test08ElCaracterFyRHaceQueSeMuevaHaciaAdelanteYRote90ALaDerechaYLaPsNoCambia

	|rover coordenadaApuntada coordenadaInicial comandos |
	
	comandos := 'FR'.
	rover := self unMarsRoverApuntandoAlNorte.
	
	coordenadaInicial := rover posicion .
	coordenadaApuntada := rover apuntandoA.
	rover leerComandos: comandos.
	
		
	self assert: (rover posicion y = (coordenadaInicial y+1)).
	self assert: (rover posicion x = (coordenadaInicial x)).
	self assert: (rover apuntandoA y = (coordenadaApuntada y)).
	self assert: (rover apuntandoA x = (coordenadaApuntada x+1)).
		
		
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'asd 5/Oct/2026, 12:45:57 am (UTC)'!
!methodProperties: {}!
test09ElCaracterFyRyFHaceQueSeMuevaHaciaDosAdelanteALaDerecha

	|rover coordenadaApuntada coordenadaInicial comandos |
	
	comandos := 'FRF'.
	rover := self unMarsRoverApuntandoAlNorte.
	
	coordenadaInicial := rover posicion .
	coordenadaApuntada := rover apuntandoA.
	rover leerComandos: comandos.
	
	self assert: (rover posicion y = (coordenadaInicial y+1)).
	self assert: (rover posicion x = (coordenadaInicial x+1)).
	self assert: (rover apuntandoA y = (coordenadaApuntada y)).
	self assert: (rover apuntandoA x = (coordenadaApuntada x+2)).
		
		
	! !


!MarsRoverTest methodsFor: 'util' stamp: 'asd 4/Oct/2026, 5:35:15 am (UTC)'!
!methodProperties: {}!
unMarsRoverApuntandoAlNorte

	|rover coordenadaApuntada unaCoordenada |
	
	unaCoordenada := 1@1.
	coordenadaApuntada := 1@2.
	
	rover := MarsRover new enCoordenada: unaCoordenada apuntandoACoordenada: coordenadaApuntada.
	
	^rover .! !
