!classDefinition: #MarsRover category: #'Practica-Mars-Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicion apuntandoA'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Practica-Mars-Rover'!

!MarsRover methodsFor: 'initialization' stamp: 'asd 2/Oct/2026, 11:44:56 pm (UTC)'!
!methodProperties: {}!
enCoordenada: unaCoordenada apuntandoACoordenada: coordenadaApuntada 

	|puntosCardinales|
	
	puntosCardinales := {
						(unaCoordenada y+1)@(unaCoordenada x). (unaCoordenada y)@(unaCoordenada x+1). 
						(unaCoordenada y-1)@(unaCoordenada x). (unaCoordenada y)@(unaCoordenada x-1)
					}.
	
	(unaCoordenada = nil) ifTrue: [^self error: self coordenadasInvalidas].
	(coordenadaApuntada = nil) ifTrue: [^self error: self coordenadasInvalidas].
	((puntosCardinales select: [ :x| x= coordenadaApuntada]) size = 1) ifFalse: [^self error: MarsRover 
		coordenadaApuntadaDebeSerUnCardinal].
	
	
	posicion := unaCoordenada .
	apuntandoA := coordenadaApuntada .! !


!MarsRover methodsFor: 'accessing' stamp: 'asd 2/Oct/2026, 7:13:38 pm (UTC)'!
!methodProperties: {}!
apuntandoA
	
	^apuntandoA.! !

!MarsRover methodsFor: 'accessing' stamp: 'asd 2/Oct/2026, 7:15:59 pm (UTC)'!
!methodProperties: {}!
posicion

	^posicion.! !


!MarsRover methodsFor: 'actions' stamp: 'asd 3/Oct/2026, 12:23:52 am (UTC)'!
!methodProperties: {}!
leerComandos: comandos 
	
	comandos do: [ :x|
		(x = $F) ifTrue: [posicion := (posicion x )@(posicion y+1)].
		(x = $B) ifTrue: [posicion := (posicion x )@(posicion y-1)].
		(x = $L) ifTrue: [posicion := (posicion x-1 )@(posicion y)]. 
		(x = $R) ifTrue: [posicion := (posicion x+1)@(posicion y)].
	]! !

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

!MarsRoverTest methodsFor: 'tests' stamp: 'asd 2/Oct/2026, 11:28:25 pm (UTC)'!
!methodProperties: {}!
test01DebeExistirMarsRoverEnCoordenadaApuntandoAOtraCoordenada

	|rover coordenadaApuntada unaCoordenada |
	
	unaCoordenada := 1@1.
	coordenadaApuntada := 1@2.
	
	rover := MarsRover new enCoordenada: unaCoordenada apuntandoACoordenada: coordenadaApuntada.
	
	self assert: (rover posicion = unaCoordenada).
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

!MarsRoverTest methodsFor: 'tests' stamp: 'asd 3/Oct/2026, 12:05:32 am (UTC)'!
!methodProperties: {}!
test04ElCaracterBHaceQueSeMuevaHaciaAtras

	|rover coordenadaApuntada unaCoordenada comandos |
	
	unaCoordenada := 1@1.
	coordenadaApuntada :=  2@1.
	comandos := 'B'.
	
	rover := MarsRover new enCoordenada: unaCoordenada apuntandoACoordenada: coordenadaApuntada.
	rover leerComandos: comandos.
	
		
	self assert: (rover posicion y = (unaCoordenada y-1)).
	self assert: (rover posicion x = (unaCoordenada x)).
		
		
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'asd 3/Oct/2026, 12:09:39 am (UTC)'!
!methodProperties: {}!
test05ElCaracterFHaceQueSeMuevaHaciaAdelante

	|rover coordenadaApuntada unaCoordenada comandos |
	
	unaCoordenada := 1@1.
	coordenadaApuntada :=  2@1.
	comandos := 'F'.
	
	rover := MarsRover new enCoordenada: unaCoordenada apuntandoACoordenada: coordenadaApuntada.
	rover leerComandos: comandos.
	
		
	self assert: (rover posicion y = (unaCoordenada y+1)).
	self assert: (rover posicion x = (unaCoordenada x)).
		
		
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'asd 3/Oct/2026, 12:10:04 am (UTC)'!
!methodProperties: {}!
test06ElCaracterLHaceQueSeMuevaHaciaLaIzquierda

	|rover coordenadaApuntada unaCoordenada comandos |
	
	unaCoordenada := 1@1.
	coordenadaApuntada :=  2@1.
	comandos := 'L'.
	
	rover := MarsRover new enCoordenada: unaCoordenada apuntandoACoordenada: coordenadaApuntada.
	rover leerComandos: comandos.
	
		
	self assert: (rover posicion y = (unaCoordenada y)).
	self assert: (rover posicion x = (unaCoordenada x-1)).
		
		
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'asd 3/Oct/2026, 12:14:58 am (UTC)'!
!methodProperties: {}!
test07ElCaracterRHaceQueSeMuevaHaciaLaDerecha

	|rover coordenadaApuntada unaCoordenada comandos |
	
	unaCoordenada := 1@1.
	coordenadaApuntada :=  2@1.
	comandos := 'R'.
	
	rover := MarsRover new enCoordenada: unaCoordenada apuntandoACoordenada: coordenadaApuntada.
	rover leerComandos: comandos.
	
		
	self assert: (rover posicion y = (unaCoordenada y)).
	self assert: (rover posicion x = (unaCoordenada x+1)).
		
		
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'asd 3/Oct/2026, 12:16:47 am (UTC)'!
!methodProperties: {}!
test08ElCaracterFyRHaceQueSeMuevaHaciaAdelanteALaDerecha

	|rover coordenadaApuntada unaCoordenada comandos |
	
	unaCoordenada := 1@1.
	coordenadaApuntada :=  2@1.
	comandos := 'FR'.
	
	rover := MarsRover new enCoordenada: unaCoordenada apuntandoACoordenada: coordenadaApuntada.
	rover leerComandos: comandos.
	
		
	self assert: (rover posicion y = (unaCoordenada y+1)).
	self assert: (rover posicion x = (unaCoordenada x+1)).
		
		
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'asd 3/Oct/2026, 12:29:48 am (UTC)'!
!methodProperties: {}!
test09ElCaracterFyRyFHaceQueSeMuevaHaciaDosAdelanteALaDerecha

	|rover coordenadaApuntada unaCoordenada comandos |
	
	unaCoordenada := 1@1.
	coordenadaApuntada :=  2@1.
	comandos := 'FRF'.
	
	rover := MarsRover new enCoordenada: unaCoordenada apuntandoACoordenada: coordenadaApuntada.
	rover leerComandos: comandos.
	
		
	self assert: (rover posicion y = (unaCoordenada y+2)).
	self assert: (rover posicion x = (unaCoordenada x+1)).
		
		
	! !
