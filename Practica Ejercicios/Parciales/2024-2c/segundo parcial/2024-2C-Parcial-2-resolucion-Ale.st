!classDefinition: #BoardTranslatorExample category: #'2024-2C-Parcial-2'!
Object subclass: #BoardTranslatorExample
	instanceVariableNames: 'board boardExtent'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!BoardTranslatorExample methodsFor: 'string representation' stamp: 'HAW 22/Nov/2024, 5:38:51 pm (UTC)'!
!methodProperties: {}!
characterRepresentationOf: anElement
	
	(anElement = #smallPill) ifTrue: [ ^StringPacmanBoard smallPillCharacter ].
	(anElement = #bigPill) ifTrue: [ ^StringPacmanBoard bigPillCharacter ].
	(anElement = #blinky) ifTrue: [ ^StringPacmanBoard blinkyCharacter ].
	(anElement = #clyde) ifTrue: [ ^StringPacmanBoard clydeCharacter ].
	(anElement = #space) ifTrue: [ ^StringPacmanBoard spaceCharacter ].
	(anElement = #wall) ifTrue: [ ^StringPacmanBoard wallCharacter ].
	(anElement = #pacman) ifTrue: [ ^StringPacmanBoard pacmanCharacter ].
	
	self error: 'Unknown pacman element type'! !

!BoardTranslatorExample methodsFor: 'string representation' stamp: 'HAW 22/Nov/2024, 5:45:23 pm (UTC)'!
!methodProperties: {}!
representationOfRowNumber: y
	
	^String streamContents: [ :rowStream |
		1 to: boardExtent x do: [ :x |
			rowStream nextPut: (self characterRepresentationOf: (board at: x@y))]]! !

!BoardTranslatorExample methodsFor: 'string representation' stamp: 'LL 22/Nov/2024, 1:44:29 pm (UTC)'!
!methodProperties: {}!
stringRepresentationOfBoard
	
	| rows |
	
	rows := OrderedCollection new.

	1 to: boardExtent y do: [ :y | 
		rows add: (self representationOfRowNumber: y) ].
	
	^rows asArray! !


!BoardTranslatorExample methodsFor: 'string board visiting' stamp: 'LL 22/Nov/2024, 2:42:38 pm (UTC)'!
!methodProperties: {}!
visitBigPillAt: aPosition 
	
	board at: aPosition put: #bigPill! !

!BoardTranslatorExample methodsFor: 'string board visiting' stamp: 'LL 22/Nov/2024, 2:40:34 pm (UTC)'!
!methodProperties: {}!
visitBlinkyAt: aPosition 
	
	board at: aPosition put: #blinky! !

!BoardTranslatorExample methodsFor: 'string board visiting' stamp: 'LL 22/Nov/2024, 2:43:04 pm (UTC)'!
!methodProperties: {}!
visitClydeAt: aPosition 
	
	board at: aPosition put: #clyde! !

!BoardTranslatorExample methodsFor: 'string board visiting' stamp: 'Alejandro Pontalti 23/Nov/2026, 12:01:47 am (UTC)'!
!methodProperties: {}!
visitPacmanAt: aPosition 
	
	board at: aPosition put: #pacman! !

!BoardTranslatorExample methodsFor: 'string board visiting' stamp: 'LL 22/Nov/2024, 2:43:22 pm (UTC)'!
!methodProperties: {}!
visitSmallPillAt: aPosition 
	
	board at: aPosition put: #smallPill! !

!BoardTranslatorExample methodsFor: 'string board visiting' stamp: 'Alejandro Pontalti 24/Nov/2026, 5:01:19 am (UTC)'!
!methodProperties: {}!
visitSpaceAt: aPosition

	board at: aPosition put: PacmanSpace new.
	
	! !

!BoardTranslatorExample methodsFor: 'string board visiting' stamp: 'LL 22/Nov/2024, 2:43:35 pm (UTC)'!
!methodProperties: {}!
visitWallAt: aPosition 
	
	board at: aPosition put: #wall! !


!BoardTranslatorExample methodsFor: 'initialization' stamp: 'HAW 22/Nov/2024, 5:43:18 pm (UTC)'!
!methodProperties: {}!
initializeOn: aBoard

	board := Dictionary new.
	boardExtent := aBoard extent.
	aBoard visitElementsWith: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BoardTranslatorExample class' category: #'2024-2C-Parcial-2'!
BoardTranslatorExample class
	instanceVariableNames: ''!

!BoardTranslatorExample class methodsFor: 'as yet unclassified' stamp: 'LL 22/Nov/2024, 1:37:38 pm (UTC)'!
!methodProperties: {}!
on: aBoard

	^self new initializeOn: aBoard! !


!classDefinition: #MovimientoPacman category: #'2024-2C-Parcial-2'!
Object subclass: #MovimientoPacman
	instanceVariableNames: 'direccion movimiento'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!


!MovimientoPacman methodsFor: 'movimiento' stamp: 'Alejandro Pontalti 24/Nov/2026, 1:07:09 am (UTC)'!
!methodProperties: {}!
nuevaPosicion: unaPosicion

	^((unaPosicion x) + movimiento x)@((unaPosicion y) + movimiento y).! !


!MovimientoPacman methodsFor: 'initialize' stamp: 'Alejandro Pontalti 24/Nov/2026, 1:02:22 am (UTC)'!
!methodProperties: {}!
initializeConDireccion: unaDireccion yMovimiento: unMovimiento.

	direccion := unaDireccion.
	movimiento := unMovimiento.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MovimientoPacman class' category: #'2024-2C-Parcial-2'!
MovimientoPacman class
	instanceVariableNames: ''!

!MovimientoPacman class methodsFor: 'instance creation' stamp: 'Alejandro Pontalti 24/Nov/2026, 1:22:04 am (UTC)'!
!methodProperties: {}!
inicializarConDireccion: unaDireccion yMovimiento: unMovimiento

	^self new initializeConDireccion: unaDireccion yMovimiento: unMovimiento.! !

!MovimientoPacman class methodsFor: 'instance creation' stamp: 'Alejandro Pontalti 24/Nov/2026, 1:12:22 am (UTC)'!
!methodProperties: {}!
moviendoseAAbajo

	^self inicializarConDireccion: #derecha yMovimiento: 0@1.! !

!MovimientoPacman class methodsFor: 'instance creation' stamp: 'Alejandro Pontalti 24/Nov/2026, 1:12:14 am (UTC)'!
!methodProperties: {}!
moviendoseAArriba

	^self inicializarConDireccion: #derecha yMovimiento: 0@(-1).! !

!MovimientoPacman class methodsFor: 'instance creation' stamp: 'Alejandro Pontalti 24/Nov/2026, 1:12:04 am (UTC)'!
!methodProperties: {}!
moviendoseADerecha

	^self inicializarConDireccion: #derecha yMovimiento: 1@0.! !

!MovimientoPacman class methodsFor: 'instance creation' stamp: 'Alejandro Pontalti 24/Nov/2026, 1:11:54 am (UTC)'!
!methodProperties: {}!
moviendoseAIzquierda

	^self inicializarConDireccion: #izquierda yMovimiento: -1@0.! !



!classDefinition: #PacmanGame category: #'2024-2C-Parcial-2'!
Object subclass: #PacmanGame
	instanceVariableNames: 'board boardExtent puntaje vidasRestantes elemntoOriginalEnPosicionBlinky cantidadTicks elemntoOriginalEnPosicionClyde pacman'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!PacmanGame methodsFor: 'string representation' stamp: 'Alejandro Pontalti 24/Nov/2026, 8:23:27 am (UTC)'!
!methodProperties: {}!
characterRepresentationOf: anElement
	
	^anElement characterRepresentation.
	
	"self error: 'Unknown pacman element type'"! !

!PacmanGame methodsFor: 'string representation' stamp: 'Alejandro Pontalti 23/Nov/2026, 10:15:35 pm (UTC)'!
!methodProperties: {}!
representationOfRowNumber: y
	
	^String streamContents: [ :rowStream |
		1 to: boardExtent x do: [ :x |
			rowStream nextPut: (self characterRepresentationOf: (board at: x@y))]]! !

!PacmanGame methodsFor: 'string representation' stamp: 'Alejandro Pontalti 23/Nov/2026, 10:15:35 pm (UTC)'!
!methodProperties: {}!
stringRepresentationOfBoard
	
	| rows |
	
	rows := OrderedCollection new.

	1 to: boardExtent y do: [ :y | 
		rows add: (self representationOfRowNumber: y) ].
	
	^rows asArray! !


!PacmanGame methodsFor: 'string board visiting' stamp: 'Alejandro Pontalti 24/Nov/2026, 4:30:19 am (UTC)'!
!methodProperties: {}!
visitBigPillAt: aPosition 
	
	board at: aPosition put: PacmanBigPill new.! !

!PacmanGame methodsFor: 'string board visiting' stamp: 'Alejandro Pontalti 24/Nov/2026, 4:32:24 am (UTC)'!
!methodProperties: {}!
visitBlinkyAt: aPosition 
	
	board at: aPosition put: PacmanBlinky new.! !

!PacmanGame methodsFor: 'string board visiting' stamp: 'Alejandro Pontalti 24/Nov/2026, 4:36:05 am (UTC)'!
!methodProperties: {}!
visitClydeAt: aPosition 
	
	board at: aPosition put: PacmanClyde new.! !

!PacmanGame methodsFor: 'string board visiting' stamp: 'Alejandro Pontalti 24/Nov/2026, 4:56:46 am (UTC)'!
!methodProperties: {}!
visitPacmanAt: aPosition 
	
	board at: aPosition put: Pacman new.! !

!PacmanGame methodsFor: 'string board visiting' stamp: 'Alejandro Pontalti 24/Nov/2026, 4:32:40 am (UTC)'!
!methodProperties: {}!
visitSmallPillAt: aPosition 
	
	board at: aPosition put: PacmanSmallPill new.! !

!PacmanGame methodsFor: 'string board visiting' stamp: 'Alejandro Pontalti 24/Nov/2026, 4:32:49 am (UTC)'!
!methodProperties: {}!
visitSpaceAt: aPosition

	board at: aPosition put: PacmanSpace new.
	
	! !

!PacmanGame methodsFor: 'string board visiting' stamp: 'Alejandro Pontalti 24/Nov/2026, 4:33:02 am (UTC)'!
!methodProperties: {}!
visitWallAt: aPosition 
	
	board at: aPosition put: PacmanWall new.! !


!PacmanGame methodsFor: 'game logic' stamp: 'Alejandro Pontalti 24/Nov/2026, 7:57:12 am (UTC)'!
!methodProperties: {}!
ejecutarTick
	
	| nuevaPosicionPacman elementoOriginalEnNuevaPosicion |

	self incrementarTick.
	self seMueveBlinky.
	self seMueveClyde.
	
	nuevaPosicionPacman := pacman nuevaPosicion.
	elementoOriginalEnNuevaPosicion := board at: nuevaPosicionPacman.
	
	elementoOriginalEnNuevaPosicion ejecutarAccionEnJuego: self.
	
	
	
	
	
	"(self pacmanComePillEn: elementoOriginalEnNuevaPosicion) ifTrue: [self pacmanIncrementaPuntosPorPill: elementoOriginalEnNuevaPosicion].
	(elementoOriginalEnNuevaPosicion = #wall) ifFalse: [
		(self pacmanSeEncuentraConFantasmaEn: elementoOriginalEnNuevaPosicion) ifTrue: [
			self pacmanPierdeUnaVidaYReiniciaOPierdeJuego.
		] ifFalse: [
			self pacmanSeMueveA: nuevaPosicionPacman YQuedaVacioEn: posicionPacman.
		].
	]."
	
	
	! !

!PacmanGame methodsFor: 'game logic' stamp: 'Alejandro Pontalti 24/Nov/2026, 2:16:01 am (UTC)'!
!methodProperties: {}!
incrementarTick

	^ cantidadTicks := cantidadTicks +1! !

!PacmanGame methodsFor: 'game logic' stamp: 'Alejandro Pontalti 24/Nov/2026, 7:54:37 am (UTC)'!
!methodProperties: {}!
moverPacman

	pacman moverPosicionEnJuego: self.! !

!PacmanGame methodsFor: 'game logic' stamp: 'Alejandro Pontalti 23/Nov/2026, 11:54:21 pm (UTC)'!
!methodProperties: {}!
pacmanIncrementaPuntosPor: puntos

	^ puntaje := puntaje+puntos.! !

!PacmanGame methodsFor: 'game logic' stamp: 'Alejandro Pontalti 23/Nov/2026, 11:55:28 pm (UTC)'!
!methodProperties: {}!
pacmanIncrementaPuntosPorPill: unaPill

	^ (unaPill = #bigPill) ifTrue: [self pacmanIncrementaPuntosPor: 2] ifFalse: [self pacmanIncrementaPuntosPor: 1].! !

!PacmanGame methodsFor: 'game logic' stamp: 'Alejandro Pontalti 24/Nov/2026, 2:20:24 am (UTC)'!
!methodProperties: {}!
pacmanPierde

	^ vidasRestantes = 0! !

!PacmanGame methodsFor: 'game logic' stamp: 'Alejandro Pontalti 24/Nov/2026, 2:20:03 am (UTC)'!
!methodProperties: {}!
pacmanPierdeUnaVida

	^ vidasRestantes := vidasRestantes - 1! !

!PacmanGame methodsFor: 'game logic' stamp: 'Alejandro Pontalti 24/Nov/2026, 2:20:49 am (UTC)'!
!methodProperties: {}!
pacmanPierdeUnaVidaYReiniciaOPierdeJuego

	self pacmanPierdeUnaVida.
	self pacmanPierde ifTrue: [^'Perdiste'] ifFalse: [self reiniciarVidaPacman].! !

!PacmanGame methodsFor: 'game logic' stamp: 'Alejandro Pontalti 24/Nov/2026, 8:10:49 am (UTC)'!
!methodProperties: {}!
pacmanSeMueveA: nuevaPosicionPacman YQuedaVacioEn: posicionPacman

	self visitPacmanAt: nuevaPosicionPacman.
	self visitSpaceAt: posicionPacman! !

!PacmanGame methodsFor: 'game logic' stamp: 'Alejandro Pontalti 23/Nov/2026, 10:47:48 pm (UTC)'!
!methodProperties: {}!
puntaje
	
	^puntaje.! !

!PacmanGame methodsFor: 'game logic' stamp: 'Alejandro Pontalti 24/Nov/2026, 2:16:40 am (UTC)'!
!methodProperties: {}!
reiniciarTicks

	^ cantidadTicks := 0! !

!PacmanGame methodsFor: 'game logic' stamp: 'Alejandro Pontalti 24/Nov/2026, 8:12:29 am (UTC)'!
!methodProperties: {}!
reiniciarVidaPacman

	self visitPacmanAt: pacman reiniciarVida.
	self reiniciarTicks! !

!PacmanGame methodsFor: 'game logic' stamp: 'Alejandro Pontalti 24/Nov/2026, 5:32:11 am (UTC)'!
!methodProperties: {}!
seGanoElJuego
	
	^(board select: [ :anElement |
		(anElement = PacmanBigPill new) or: (anElement = PacmanSmallPill new).
	] )size = 0.! !

!PacmanGame methodsFor: 'game logic' stamp: 'Alejandro Pontalti 24/Nov/2026, 4:46:06 am (UTC)'!
!methodProperties: {}!
seMueveBlinky
	
	| nuevaPosicionBlinky posicionBlinky |
	posicionBlinky := board keyAtValue: (PacmanBlinky new).
	nuevaPosicionBlinky := (posicionBlinky x -1)@posicionBlinky y.
	(cantidadTicks >= 4) ifTrue: [
		board at: posicionBlinky put: elemntoOriginalEnPosicionBlinky.
		elemntoOriginalEnPosicionBlinky := board at: nuevaPosicionBlinky.
		self visitBlinkyAt: nuevaPosicionBlinky.
	]. ! !

!PacmanGame methodsFor: 'game logic' stamp: 'Alejandro Pontalti 24/Nov/2026, 4:58:23 am (UTC)'!
!methodProperties: {}!
seMueveClyde
	
	| nuevaPosicionClyde posicionClyde |
	posicionClyde := board keyAtValue: (PacmanClyde new).
	nuevaPosicionClyde := (posicionClyde x +1)@posicionClyde y.
	(cantidadTicks >= 5) ifTrue: [
		board at: posicionClyde put: elemntoOriginalEnPosicionClyde.
		elemntoOriginalEnPosicionClyde := board at: nuevaPosicionClyde.
		self visitClydeAt: nuevaPosicionClyde.
	]. ! !

!PacmanGame methodsFor: 'game logic' stamp: 'Alejandro Pontalti 23/Nov/2026, 11:16:47 pm (UTC)'!
!methodProperties: {}!
vidasRestantes
	
	^vidasRestantes.! !


!PacmanGame methodsFor: 'initialization' stamp: 'Alejandro Pontalti 24/Nov/2026, 5:03:38 am (UTC)'!
!methodProperties: {}!
initialize

	puntaje := 0.
	vidasRestantes := 3.
	pacmanMoviendose := MovimientoPacman moviendoseAIzquierda.
	cantidadTicks := 0.
	elemntoOriginalEnPosicionBlinky := PacmanSpace new.
	elemntoOriginalEnPosicionClyde := PacmanSpace new.! !

!PacmanGame methodsFor: 'initialization' stamp: 'Alejandro Pontalti 24/Nov/2026, 7:43:51 am (UTC)'!
!methodProperties: {}!
initializeOn: aBoard

	board := Dictionary new.
	boardExtent := aBoard extent.
	aBoard visitElementsWith: self.
	pacman := Pacman new.
	pacman posicionInicial: (board keyAtValue: pacman).! !


!PacmanGame methodsFor: 'game orders' stamp: 'Alejandro Pontalti 24/Nov/2026, 7:45:25 am (UTC)'!
!methodProperties: {}!
cambiarDireccionAbajo
	
	pacman cambiarDireccionAbajo.! !

!PacmanGame methodsFor: 'game orders' stamp: 'Alejandro Pontalti 24/Nov/2026, 7:45:39 am (UTC)'!
!methodProperties: {}!
cambiarDireccionArriba
	
	pacman cambiarDireccionArriba.! !

!PacmanGame methodsFor: 'game orders' stamp: 'Alejandro Pontalti 24/Nov/2026, 7:46:10 am (UTC)'!
!methodProperties: {}!
cambiarDireccionDerecha
	
	pacman cambiarDireccionDerecha.! !

!PacmanGame methodsFor: 'game orders' stamp: 'Alejandro Pontalti 24/Nov/2026, 7:46:34 am (UTC)'!
!methodProperties: {}!
cambiarDireccionIzquierda
	
	pacman cambiarDireccionIzquierda.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PacmanGame class' category: #'2024-2C-Parcial-2'!
PacmanGame class
	instanceVariableNames: ''!

!PacmanGame class methodsFor: 'as yet unclassified' stamp: 'Alejandro Pontalti 23/Nov/2026, 10:19:11 pm (UTC)'!
!methodProperties: {}!
iniciarConBoard: unBoard 
	
	^self on: unBoard! !

!PacmanGame class methodsFor: 'as yet unclassified' stamp: 'Alejandro Pontalti 23/Nov/2026, 10:15:35 pm (UTC)'!
!methodProperties: {}!
on: aBoard

	^self new initializeOn: aBoard! !


!classDefinition: #PacmanGameElement category: #'2024-2C-Parcial-2'!
Object subclass: #PacmanGameElement
	instanceVariableNames: 'etiqueta'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!PacmanGameElement methodsFor: 'acceso' stamp: 'Alejandro Pontalti 24/Nov/2026, 4:04:12 am (UTC)'!
!methodProperties: {}!
etiqueta

	^etiqueta.! !



!PacmanGameElement methodsFor: 'operadores' stamp: 'Alejandro Pontalti 24/Nov/2026, 4:53:45 am (UTC)'!
!methodProperties: {}!
= aPacmanGameElement

	^self etiqueta = aPacmanGameElement etiqueta.! !


!PacmanGameElement methodsFor: 'accion' stamp: 'Alejandro Pontalti 24/Nov/2026, 3:57:39 am (UTC)'!
!methodProperties: {}!
ejecutarAccionEnJuego: aPacmanGame

	self subclassResponsibility! !


!classDefinition: #Pacman category: #'2024-2C-Parcial-2'!
PacmanGameElement subclass: #Pacman
	instanceVariableNames: 'pacmanMoviendose posicionOrigen posicionActual'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!Pacman methodsFor: 'initialize' stamp: 'Alejandro Pontalti 24/Nov/2026, 7:34:02 am (UTC)'!
!methodProperties: {}!
initialize
	
	etiqueta := #pacman.
	pacmanMoviendose := MovimientoPacman moviendoseAIzquierda.! !


!Pacman methodsFor: 'accion' stamp: 'Alejandro Pontalti 24/Nov/2026, 7:57:49 am (UTC)'!
!methodProperties: {}!
ejecutarAccionEnJuego: aPacmanGame

	^self shouldNotImplement.

	! !

!Pacman methodsFor: 'accion' stamp: 'Alejandro Pontalti 24/Nov/2026, 7:51:48 am (UTC)'!
!methodProperties: {}!
moverPosicionEnJuego: aPacmanGame

	| nuevaPosicion |
	
	nuevaPosicion := pacmanMoviendose nuevaPosicion: posicionActual.
	aPacmanGame pacmanSeMueveA: nuevaPosicion YQuedaVacioEn: posicionActual.
	posicionActual := nuevaPosicion.! !


!Pacman methodsFor: 'string representation' stamp: 'Alejandro Pontalti 24/Nov/2026, 8:19:21 am (UTC)'!
!methodProperties: {}!
characterRepresentation
	
	 ^StringPacmanBoard pacmanCharacter.! !


!Pacman methodsFor: 'acceso' stamp: 'Alejandro Pontalti 24/Nov/2026, 7:44:49 am (UTC)'!
!methodProperties: {}!
cambiarDireccionAbajo
	
	pacmanMoviendose := MovimientoPacman moviendoseAAbajo.! !

!Pacman methodsFor: 'acceso' stamp: 'Alejandro Pontalti 24/Nov/2026, 7:45:04 am (UTC)'!
!methodProperties: {}!
cambiarDireccionArriba
	
	pacmanMoviendose := MovimientoPacman moviendoseAArriba.! !

!Pacman methodsFor: 'acceso' stamp: 'Alejandro Pontalti 24/Nov/2026, 7:45:50 am (UTC)'!
!methodProperties: {}!
cambiarDireccionDerecha
	
	pacmanMoviendose := MovimientoPacman moviendoseADerecha.! !

!Pacman methodsFor: 'acceso' stamp: 'Alejandro Pontalti 24/Nov/2026, 7:46:21 am (UTC)'!
!methodProperties: {}!
cambiarDireccionIzquierda
	
	pacmanMoviendose := MovimientoPacman moviendoseAIzquierda.! !

!Pacman methodsFor: 'acceso' stamp: 'Alejandro Pontalti 24/Nov/2026, 7:48:34 am (UTC)'!
!methodProperties: {}!
nuevaPosicion

	^pacmanMoviendose nuevaPosicion: posicionActual.! !

!Pacman methodsFor: 'acceso' stamp: 'Alejandro Pontalti 24/Nov/2026, 7:49:15 am (UTC)'!
!methodProperties: {}!
posicionInicial: posicionInicial
	
	posicionOrigen := posicionInicial.
	posicionActual := posicionInicial.! !

!Pacman methodsFor: 'acceso' stamp: 'Alejandro Pontalti 24/Nov/2026, 8:13:41 am (UTC)'!
!methodProperties: {}!
reiniciarVida

	posicionActual := posicionOrigen.
	^posicionOrigen.! !


!classDefinition: #PacmanFantasma category: #'2024-2C-Parcial-2'!
PacmanGameElement subclass: #PacmanFantasma
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!


!PacmanFantasma methodsFor: 'accion' stamp: 'Alejandro Pontalti 24/Nov/2026, 7:55:32 am (UTC)'!
!methodProperties: {}!
ejecutarAccionEnJuego: aPacmanGame

	aPacmanGame pacmanPierdeUnaVidaYReiniciaOPierdeJuego. 

	! !


!classDefinition: #PacmanBlinky category: #'2024-2C-Parcial-2'!
PacmanFantasma subclass: #PacmanBlinky
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!PacmanBlinky methodsFor: 'initialize' stamp: 'Alejandro Pontalti 24/Nov/2026, 4:33:23 am (UTC)'!
!methodProperties: {}!
initialize
	
	etiqueta := #blinky.! !


!PacmanBlinky methodsFor: 'string representation' stamp: 'Alejandro Pontalti 24/Nov/2026, 8:20:11 am (UTC)'!
!methodProperties: {}!
characterRepresentation
	
	 ^StringPacmanBoard blinkyCharacter.! !



!classDefinition: #PacmanClyde category: #'2024-2C-Parcial-2'!
PacmanFantasma subclass: #PacmanClyde
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!PacmanClyde methodsFor: 'initialize' stamp: 'Alejandro Pontalti 24/Nov/2026, 4:33:45 am (UTC)'!
!methodProperties: {}!
initialize
	
	etiqueta := #clyde.! !



!PacmanClyde methodsFor: 'string representation' stamp: 'Alejandro Pontalti 24/Nov/2026, 8:20:28 am (UTC)'!
!methodProperties: {}!
characterRepresentation
	
	 ^StringPacmanBoard clydeCharacter.! !


!classDefinition: #PacmanPill category: #'2024-2C-Parcial-2'!
PacmanGameElement subclass: #PacmanPill
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!PacmanPill methodsFor: 'accion' stamp: 'Alejandro Pontalti 24/Nov/2026, 7:58:14 am (UTC)'!
!methodProperties: {}!
ejecutarAccionEnJuego: aPacmanGame

	aPacmanGame pacmanIncrementaPuntosPorPill: self etiqueta.
	aPacmanGame moverPacman.
	aPacmanGame seGanoElJuego.

	! !


!classDefinition: #PacmanBigPill category: #'2024-2C-Parcial-2'!
PacmanPill subclass: #PacmanBigPill
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!PacmanBigPill methodsFor: 'initialize' stamp: 'Alejandro Pontalti 24/Nov/2026, 4:23:37 am (UTC)'!
!methodProperties: {}!
initialize
	
	etiqueta := #bigPill.! !



!PacmanBigPill methodsFor: 'string representation' stamp: 'Alejandro Pontalti 24/Nov/2026, 8:20:55 am (UTC)'!
!methodProperties: {}!
characterRepresentation
	
	 ^StringPacmanBoard bigPillCharacter.! !


!classDefinition: #PacmanSmallPill category: #'2024-2C-Parcial-2'!
PacmanPill subclass: #PacmanSmallPill
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!PacmanSmallPill methodsFor: 'initialize' stamp: 'Alejandro Pontalti 24/Nov/2026, 4:20:54 am (UTC)'!
!methodProperties: {}!
initialize
	
	etiqueta := #smallPill.! !



!PacmanSmallPill methodsFor: 'string representation' stamp: 'Alejandro Pontalti 24/Nov/2026, 8:21:06 am (UTC)'!
!methodProperties: {}!
characterRepresentation
	
	 ^StringPacmanBoard smallPillCharacter.! !


!classDefinition: #PacmanSpace category: #'2024-2C-Parcial-2'!
PacmanGameElement subclass: #PacmanSpace
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!PacmanSpace methodsFor: 'initialize' stamp: 'Alejandro Pontalti 24/Nov/2026, 4:05:16 am (UTC)'!
!methodProperties: {}!
initialize
	
	etiqueta := #space.! !


!PacmanSpace methodsFor: 'accion' stamp: 'Alejandro Pontalti 24/Nov/2026, 7:56:42 am (UTC)'!
!methodProperties: {}!
ejecutarAccionEnJuego: aPacmanGame

	aPacmanGame moverPacman.

	! !


!PacmanSpace methodsFor: 'string representation' stamp: 'Alejandro Pontalti 24/Nov/2026, 8:21:15 am (UTC)'!
!methodProperties: {}!
characterRepresentation
	
	 ^StringPacmanBoard spaceCharacter.! !


!classDefinition: #PacmanWall category: #'2024-2C-Parcial-2'!
PacmanGameElement subclass: #PacmanWall
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!PacmanWall methodsFor: 'initialize' stamp: 'Alejandro Pontalti 24/Nov/2026, 4:05:36 am (UTC)'!
!methodProperties: {}!
initialize
	
	etiqueta := #wall.! !


!PacmanWall methodsFor: 'accion' stamp: 'Alejandro Pontalti 24/Nov/2026, 3:57:18 am (UTC)'!
!methodProperties: {}!
ejecutarAccionEnJuego: aPacmanGame

	

	! !


!PacmanWall methodsFor: 'string representation' stamp: 'Alejandro Pontalti 24/Nov/2026, 8:21:21 am (UTC)'!
!methodProperties: {}!
characterRepresentation
	
	 ^StringPacmanBoard wallCharacter.! !


!classDefinition: #StringPacmanBoard category: #'2024-2C-Parcial-2'!
Object subclass: #StringPacmanBoard
	instanceVariableNames: 'stringRepresentation'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!StringPacmanBoard methodsFor: 'initialization' stamp: 'HAW 18/Nov/2024, 10:29:26 pm (UTC)'!
!methodProperties: {}!
initializeRepresentedAs: aStringRepresentation 
	
	stringRepresentation := aStringRepresentation.! !


!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 20/Nov/2024, 8:23:48 pm (UTC)'!
!methodProperties: {}!
bigPillCharacter

	^self class bigPillCharacter! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 20/Nov/2024, 8:24:20 pm (UTC)'!
!methodProperties: {}!
blinkyCharacter

	^ self class blinkyCharacter ! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 20/Nov/2024, 8:24:30 pm (UTC)'!
!methodProperties: {}!
clydeCharacter

	^ self class clydeCharacter ! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 20/Nov/2024, 8:24:52 pm (UTC)'!
!methodProperties: {}!
pacmanCharacter

	^ self class pacmanCharacter ! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 20/Nov/2024, 8:25:15 pm (UTC)'!
!methodProperties: {}!
smallPillCharacter

	^self class smallPillCharacter ! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 20/Nov/2024, 8:25:37 pm (UTC)'!
!methodProperties: {}!
spaceCharacter

	^self class spaceCharacter ! !

!StringPacmanBoard methodsFor: 'element character' stamp: 'HAW 20/Nov/2024, 8:26:00 pm (UTC)'!
!methodProperties: {}!
wallCharacter

	^self class wallCharacter! !


!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 20/Nov/2024, 8:20:21 pm (UTC)'!
!methodProperties: {}!
isBigPill: anElement

	^ anElement = self bigPillCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 20/Nov/2024, 8:20:36 pm (UTC)'!
!methodProperties: {}!
isBlinky: anElement

	^ anElement = self blinkyCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 20/Nov/2024, 8:21:09 pm (UTC)'!
!methodProperties: {}!
isClyde: anElement

	^ anElement = self clydeCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 20/Nov/2024, 8:21:17 pm (UTC)'!
!methodProperties: {}!
isPacman: anElement

	^ anElement = self pacmanCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 20/Nov/2024, 8:20:12 pm (UTC)'!
!methodProperties: {}!
isSmalltPill: anElement

	^ anElement = self smallPillCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 20/Nov/2024, 8:21:29 pm (UTC)'!
!methodProperties: {}!
isSpace: anElement

	^ anElement = self spaceCharacter! !

!StringPacmanBoard methodsFor: 'testing' stamp: 'HAW 20/Nov/2024, 8:20:03 pm (UTC)'!
!methodProperties: {}!
isWall: anElement

	^ anElement = self wallCharacter! !


!StringPacmanBoard methodsFor: 'visiting' stamp: 'HAW 22/Nov/2024, 5:38:19 pm (UTC)'!
!methodProperties: {}!
visit: anElement at: position with: aPacmanBoardVisitor

	(self isWall: anElement) ifTrue: [ ^aPacmanBoardVisitor visitWallAt: position ].
	(self isSmalltPill: anElement) ifTrue: [ ^aPacmanBoardVisitor visitSmallPillAt: position ].
	(self isBigPill: anElement) ifTrue: [ ^aPacmanBoardVisitor visitBigPillAt: position ].
	(self isBlinky: anElement) ifTrue: [ ^aPacmanBoardVisitor visitBlinkyAt: position ].
	(self isClyde: anElement) ifTrue: [ ^aPacmanBoardVisitor visitClydeAt: position ].
	(self isPacman: anElement) ifTrue: [ ^aPacmanBoardVisitor visitPacmanAt: position ].
	(self isSpace: anElement) ifTrue: [ ^aPacmanBoardVisitor visitSpaceAt: position ].
	
	"No hay necesidad de generar un error porque no se permite crear un board con caracteres distintos a todos estos - Hernan"! !

!StringPacmanBoard methodsFor: 'visiting' stamp: 'HAW 20/Nov/2024, 8:22:41 pm (UTC)'!
!methodProperties: {}!
visitElementsWith: aPacmanBoardVisitor

	stringRepresentation withIndexDo: [ :aRow :y |
		aRow withIndexDo: [ :anElement :x | 
			self visit: anElement at: x@y with: aPacmanBoardVisitor.]]! !


!StringPacmanBoard methodsFor: 'extent' stamp: 'HAW 22/Nov/2024, 1:50:10 pm (UTC)'!
!methodProperties: {}!
extent
	
	"There is always a row and their size is the same to all - Hernan"
	^stringRepresentation first size @ stringRepresentation size! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StringPacmanBoard class' category: #'2024-2C-Parcial-2'!
StringPacmanBoard class
	instanceVariableNames: ''!

!StringPacmanBoard class methodsFor: 'instance creation' stamp: 'HAW 22/Nov/2024, 1:48:32 pm (UTC)'!
!methodProperties: {}!
representedAs: aStringRepresentation 
	
	| elementCharactersCount |
	
	elementCharactersCount := self elementCharacterCountOf: aStringRepresentation.	
	self asserltAllActorsAreIn: elementCharactersCount.
	"If I get here the there is always a row - Hernan"
	self assertAllRowsHaveSameSizeIn: aStringRepresentation.
	
	^self new initializeRepresentedAs: aStringRepresentation 
	! !


!StringPacmanBoard class methodsFor: 'error description' stamp: 'HAW 20/Nov/2024, 7:58:30 pm (UTC)'!
!methodProperties: {}!
characterIsMissingErrorDescriptionFor: aCharacterName
	
	^aCharacterName, ' is missing'! !

!StringPacmanBoard class methodsFor: 'error description' stamp: 'HAW 20/Nov/2024, 8:39:12 pm (UTC)'!
!methodProperties: {}!
notAllowCharaterErrorDescriptionFor: aCharacter

	^'Character ', aCharacter asString, ' is not allowed'! !

!StringPacmanBoard class methodsFor: 'error description' stamp: 'HAW 20/Nov/2024, 8:07:31 pm (UTC)'!
!methodProperties: {}!
rowsMustHaveSameSizeErrorDescription
	
	^'Rows must have same number of columns'! !

!StringPacmanBoard class methodsFor: 'error description' stamp: 'HAW 20/Nov/2024, 7:58:01 pm (UTC)'!
!methodProperties: {}!
shouldBeUniqueErrorDescriptionFor: aCharacterName
	
	^'There should be only one ', aCharacterName ! !


!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 21/Nov/2024, 11:17:42 pm (UTC)'!
!methodProperties: {}!
allowedCharacters
	
	^ {
	self pacmanCharacter.
	self blinkyCharacter.
	self clydeCharacter.
	self wallCharacter.
	self bigPillCharacter.
	self smallPillCharacter.
	self spaceCharacter.
	}! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 20/Nov/2024, 8:24:06 pm (UTC)'!
!methodProperties: {}!
bigPillCharacter
	
	^ $*! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 20/Nov/2024, 7:56:25 pm (UTC)'!
!methodProperties: {}!
blinkyCharacter
	
	^$B! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 20/Nov/2024, 7:56:42 pm (UTC)'!
!methodProperties: {}!
clydeCharacter
	
	^$C! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 20/Nov/2024, 7:41:25 pm (UTC)'!
!methodProperties: {}!
pacmanCharacter
	
	^$p! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 20/Nov/2024, 8:25:24 pm (UTC)'!
!methodProperties: {}!
smallPillCharacter
	
	^ $-! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 20/Nov/2024, 8:25:46 pm (UTC)'!
!methodProperties: {}!
spaceCharacter
	
	^ $=! !

!StringPacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 20/Nov/2024, 8:26:06 pm (UTC)'!
!methodProperties: {}!
wallCharacter
	
	^ $#! !


!StringPacmanBoard class methodsFor: 'character names' stamp: 'HAW 20/Nov/2024, 8:02:12 pm (UTC)'!
!methodProperties: {}!
blinkyName

	^ #blinky! !

!StringPacmanBoard class methodsFor: 'character names' stamp: 'HAW 20/Nov/2024, 8:02:29 pm (UTC)'!
!methodProperties: {}!
clydeName

	^ #clyde! !

!StringPacmanBoard class methodsFor: 'character names' stamp: 'HAW 20/Nov/2024, 8:02:05 pm (UTC)'!
!methodProperties: {}!
pacmanName

	^ #pacman! !


!StringPacmanBoard class methodsFor: 'assertions' stamp: 'HAW 21/Nov/2024, 10:59:27 pm (UTC)'!
!methodProperties: {}!
asserltAllActorsAreIn: elementCharactersCount

	{ self pacmanName. self blinkyName. self clydeName } do: [ :aCharacterName | 
		self assertActorIsCorrect: aCharacterName in: elementCharactersCount ]! !

!StringPacmanBoard class methodsFor: 'assertions' stamp: 'HAW 20/Nov/2024, 8:49:04 pm (UTC)'!
!methodProperties: {}!
assert: anElementCharacter isAllowed: allowedCharacters

	(allowedCharacters includes: anElementCharacter) ifFalse: [ self error: (self notAllowCharaterErrorDescriptionFor: anElementCharacter) ]! !

!StringPacmanBoard class methodsFor: 'assertions' stamp: 'HAW 20/Nov/2024, 8:48:41 pm (UTC)'!
!methodProperties: {}!
assertActorIsCorrect: aCharacterName in: elements 
	
	| characterIdentifier |
	
	characterIdentifier := self perform: (aCharacterName, #Character) asSymbol.
	(elements includes: characterIdentifier)
		ifFalse: [ self error: (self characterIsMissingErrorDescriptionFor: aCharacterName) ].
		
	(elements occurrencesOf: characterIdentifier) > 1
		ifTrue: [ self error: (self shouldBeUniqueErrorDescriptionFor: aCharacterName) ].
! !

!StringPacmanBoard class methodsFor: 'assertions' stamp: 'HAW 20/Nov/2024, 8:49:16 pm (UTC)'!
!methodProperties: {}!
assertAllRowsHaveSameSizeIn: aStringRepresentation

	(aStringRepresentation allSatisfy: [ :aRow | aRow size = aStringRepresentation first size ]) ifFalse: [ 
		self error: self rowsMustHaveSameSizeErrorDescription ]! !

!StringPacmanBoard class methodsFor: 'assertions' stamp: 'HAW 20/Nov/2024, 8:49:30 pm (UTC)'!
!methodProperties: {}!
elementCharacterCountOf: aStringRepresentation

	| elementCharactersCount allowedCharacters |
	
	elementCharactersCount := Bag new.
	allowedCharacters := self allowedCharacters.
	
	aStringRepresentation do: [ :aRow |
		aRow do: [ :anElementCharacter | 
			self assert: anElementCharacter isAllowed: allowedCharacters.
			elementCharactersCount add: anElementCharacter ]].
	
	^elementCharactersCount ! !


!classDefinition: #PacmanGameTest category: #'2024-2C-Parcial-2'!
TestCase subclass: #PacmanGameTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!PacmanGameTest methodsFor: 'test' stamp: 'Alejandro Pontalti 23/Nov/2026, 10:21:57 pm (UTC)'!
!methodProperties: {}!
test001PacmanIniciaConUnBoardTresVidasYSinPuntos

	| board pacmanGame |
	
	board := StringPacmanBoard representedAs:#(
'######'
'#-BC-#'
'#=p=-#'
'######').
	
	pacmanGame := PacmanGame iniciarConBoard: board.
	
	self assert: pacmanGame vidasRestantes equals: 3.
	self assert: pacmanGame puntaje equals: 0.
	
	self assert: pacmanGame stringRepresentationOfBoard equals: #(
'######'
'#-BC-#'
'#=p=-#'
'######').! !

!PacmanGameTest methodsFor: 'test' stamp: 'Alejandro Pontalti 24/Nov/2026, 12:11:20 am (UTC)'!
!methodProperties: {}!
test002PacmanIniciaLlendoAIzquierda

	| board pacmanGame |
	
	board := StringPacmanBoard representedAs:#(
'######'
'#-BC-#'
'#=p=-#'
'######').
	
	pacmanGame := PacmanGame iniciarConBoard: board.
	
	pacmanGame ejecutarTick.
	
	self assert: pacmanGame vidasRestantes equals: 3.
	self assert: pacmanGame puntaje equals: 0.
	self assert: pacmanGame stringRepresentationOfBoard equals: #(
'######'
'#-BC-#'
'#p==-#'
'######').! !

!PacmanGameTest methodsFor: 'test' stamp: 'Alejandro Pontalti 24/Nov/2026, 12:11:14 am (UTC)'!
!methodProperties: {}!
test003PacmanLlendoAIzquierdaComeSmallPillSumaUnPunto

	| board pacmanGame |
	
	board := StringPacmanBoard representedAs:#(
'######'
'#-BC-#'
'#-p=-#'
'######').
	
	pacmanGame := PacmanGame iniciarConBoard: board.
	
	pacmanGame ejecutarTick.
	
	self assert: pacmanGame vidasRestantes equals: 3.
	self assert: pacmanGame puntaje equals: 1.
	self assert: pacmanGame stringRepresentationOfBoard equals: #(
'######'
'#-BC-#'
'#p==-#'
'######').! !

!PacmanGameTest methodsFor: 'test' stamp: 'Alejandro Pontalti 24/Nov/2026, 12:11:08 am (UTC)'!
!methodProperties: {}!
test004PacmanLlendoAIzquierdaYSeLoComeUnClydePierdeUnaVidaYVuelveAOrigen

	| board pacmanGame |
	
	board := StringPacmanBoard representedAs:#(
'######'
'#-B=-#'
'#Cp=-#'
'######').
	
	pacmanGame := PacmanGame iniciarConBoard: board.
	
	pacmanGame ejecutarTick.
	
	self assert: pacmanGame vidasRestantes equals: 2.
	self assert: pacmanGame puntaje equals: 0.
	self assert: pacmanGame stringRepresentationOfBoard equals: #(
'######'
'#-B=-#'
'#Cp=-#'
'######').! !

!PacmanGameTest methodsFor: 'test' stamp: 'Alejandro Pontalti 24/Nov/2026, 12:11:02 am (UTC)'!
!methodProperties: {}!
test005PacmanLlendoAIzquierdaYSeLoComeUnBlinkyPierdeUnaVidaYVuelveAOrigen

	| board pacmanGame |
	
	board := StringPacmanBoard representedAs:#(
'######'
'#-=C-#'
'#Bp=-#'
'######').
	
	pacmanGame := PacmanGame iniciarConBoard: board.
	
	pacmanGame ejecutarTick.
	
	self assert: pacmanGame vidasRestantes equals: 2.
	self assert: pacmanGame puntaje equals: 0.
	self assert: pacmanGame stringRepresentationOfBoard equals: #(
'######'
'#-=C-#'
'#Bp=-#'
'######').! !

!PacmanGameTest methodsFor: 'test' stamp: 'Alejandro Pontalti 24/Nov/2026, 12:10:14 am (UTC)'!
!methodProperties: {}!
test006PacmanLlendoAIzquierdaYSeLoComeSeChocaConParedYNoPasa

	| board pacmanGame |
	
	board := StringPacmanBoard representedAs:#(
'######'
'#-BC-#'
'##p=-#'
'######').
	
	pacmanGame := PacmanGame iniciarConBoard: board.
	
	pacmanGame ejecutarTick.
	
	self assert: pacmanGame vidasRestantes equals: 3.
	self assert: pacmanGame puntaje equals: 0.
	self assert: pacmanGame stringRepresentationOfBoard equals: #(
'######'
'#-BC-#'
'##p=-#'
'######').! !

!PacmanGameTest methodsFor: 'test' stamp: 'Alejandro Pontalti 24/Nov/2026, 12:10:09 am (UTC)'!
!methodProperties: {}!
test007PacmanLlendoAIzquierdaComeBigPillSumaDosPunto

	| board pacmanGame |
	
	board := StringPacmanBoard representedAs:#(
'######'
'#-BC-#'
'#*p=-#'
'######').
	
	pacmanGame := PacmanGame iniciarConBoard: board.
	
	pacmanGame ejecutarTick.
	
	self assert: pacmanGame vidasRestantes equals: 3.
	self assert: pacmanGame puntaje equals: 2.
	self assert: pacmanGame stringRepresentationOfBoard equals: #(
'######'
'#-BC-#'
'#p==-#'
'######').! !

!PacmanGameTest methodsFor: 'test' stamp: 'Alejandro Pontalti 24/Nov/2026, 12:10:02 am (UTC)'!
!methodProperties: {}!
test008PacmanLlendoAIzquierdaSeMueveDosVecesYChocaConPared

	| board pacmanGame |
	
	board := StringPacmanBoard representedAs:#(
'######'
'#-BC-#'
'#*-p-#'
'######').
	
	pacmanGame := PacmanGame iniciarConBoard: board.
	
	pacmanGame ejecutarTick.
	pacmanGame ejecutarTick.
	pacmanGame ejecutarTick.
	
	self assert: pacmanGame vidasRestantes equals: 3.
	self assert: pacmanGame puntaje equals: 3.
	self assert: pacmanGame stringRepresentationOfBoard equals: #(
'######'
'#-BC-#'
'#p==-#'
'######').! !

!PacmanGameTest methodsFor: 'test' stamp: 'Alejandro Pontalti 24/Nov/2026, 12:20:20 am (UTC)'!
!methodProperties: {}!
test009PacmanRecibeOrdenDeIrArribaSeLoComeBlinky

	| board pacmanGame |
	
	board := StringPacmanBoard representedAs:#(
'######'
'#-BC-#'
'#*p=-#'
'######').
	
	pacmanGame := PacmanGame iniciarConBoard: board.
	
	pacmanGame cambiarDireccionArriba.
	pacmanGame ejecutarTick.

	
	self assert: pacmanGame vidasRestantes equals: 2.
	self assert: pacmanGame puntaje equals: 0.
	self assert: pacmanGame stringRepresentationOfBoard equals: #(
'######'
'#-BC-#'
'#*p=-#'
'######').! !

!PacmanGameTest methodsFor: 'test' stamp: 'Alejandro Pontalti 24/Nov/2026, 12:11:39 am (UTC)'!
!methodProperties: {}!
test010PacmanRecibeOrdenDeIrArribaSeMueveHastaChocarConPared

	| board pacmanGame |
	
	board := StringPacmanBoard representedAs:#(
'######'
'#B*C-#'
'#*p=-#'
'######').
	
	pacmanGame := PacmanGame iniciarConBoard: board.
	
	pacmanGame cambiarDireccionArriba.
	pacmanGame ejecutarTick.
	pacmanGame ejecutarTick.
	
	self assert: pacmanGame vidasRestantes equals: 3.
	self assert: pacmanGame puntaje equals: 2.
	self assert: pacmanGame stringRepresentationOfBoard equals: #(
'######'
'#BpC-#'
'#*==-#'
'######').! !

!PacmanGameTest methodsFor: 'test' stamp: 'Alejandro Pontalti 24/Nov/2026, 12:16:00 am (UTC)'!
!methodProperties: {}!
test011PacmanRecibeOrdenDeIrDerechaSeChoca

	| board pacmanGame |
	
	board := StringPacmanBoard representedAs:#(
'######'
'#-BC-#'
'#*p=-#'
'######').
	
	pacmanGame := PacmanGame iniciarConBoard: board.
	
	pacmanGame cambiarDireccionDerecha.
	pacmanGame ejecutarTick.
	pacmanGame ejecutarTick.
	pacmanGame ejecutarTick.
	
	self assert: pacmanGame vidasRestantes equals: 3.
	self assert: pacmanGame puntaje equals: 1.
	self assert: pacmanGame stringRepresentationOfBoard equals: #(
'######'
'#-BC-#'
'#*==p#'
'######').! !

!PacmanGameTest methodsFor: 'test' stamp: 'Alejandro Pontalti 24/Nov/2026, 12:19:26 am (UTC)'!
!methodProperties: {}!
test012PacmanRecibeOrdenDeIrAbajoSeChoca

	| board pacmanGame |
	
	board := StringPacmanBoard representedAs:#(
'######'
'#-BC-#'
'#*p=-#'
'######').
	
	pacmanGame := PacmanGame iniciarConBoard: board.
	
	pacmanGame cambiarDireccionAbajo.
	pacmanGame ejecutarTick.
	pacmanGame ejecutarTick.
	pacmanGame ejecutarTick.
	
	self assert: pacmanGame vidasRestantes equals: 3.
	self assert: pacmanGame puntaje equals: 0.
	self assert: pacmanGame stringRepresentationOfBoard equals: #(
'######'
'#-BC-#'
'#*p=-#'
'######').! !

!PacmanGameTest methodsFor: 'test' stamp: 'Alejandro Pontalti 24/Nov/2026, 12:22:52 am (UTC)'!
!methodProperties: {}!
test013PacmanRecibeOrdenDeIrAbajoSumaDosPuntosYChoca

	| board pacmanGame |
	
	board := StringPacmanBoard representedAs:#(
'######'
'#-BCp#'
'#-==*#'
'######').
	
	pacmanGame := PacmanGame iniciarConBoard: board.
	
	pacmanGame cambiarDireccionAbajo.
	pacmanGame ejecutarTick.
	pacmanGame ejecutarTick.
	pacmanGame ejecutarTick.
	
	self assert: pacmanGame vidasRestantes equals: 3.
	self assert: pacmanGame puntaje equals: 2.
	self assert: pacmanGame stringRepresentationOfBoard equals: #(
'######'
'#-BC=#'
'#-==p#'
'######').! !

!PacmanGameTest methodsFor: 'test' stamp: 'Alejandro Pontalti 24/Nov/2026, 1:38:11 am (UTC)'!
!methodProperties: {}!
test014PacmanRecibeOrdenDeIrAbajoSumaDosPuntosYVaHaciaLaIzquierdaSumaOtroPunto

	| board pacmanGame |
	
	board := StringPacmanBoard representedAs:#(
'######'
'#-BCp#'
'#=-=*#'
'######').
	
	pacmanGame := PacmanGame iniciarConBoard: board.
	
	pacmanGame cambiarDireccionAbajo.
	pacmanGame ejecutarTick.
	pacmanGame cambiarDireccionIzquierda.
	pacmanGame ejecutarTick.
	pacmanGame ejecutarTick.
	
	self assert: pacmanGame vidasRestantes equals: 3.
	self assert: pacmanGame puntaje equals: 3.
	self assert: pacmanGame stringRepresentationOfBoard equals: #(
'######'
'#-BC=#'
'#=p==#'
'######').! !

!PacmanGameTest methodsFor: 'test' stamp: 'Alejandro Pontalti 24/Nov/2026, 2:13:45 am (UTC)'!
!methodProperties: {}!
test015BlinkyIniciaMoviendoAIzquierdaAPartirDelCuartoTik

	| board pacmanGame |
	
	board := StringPacmanBoard representedAs:#(
'######'
'#-BCp#'
'#-==*#'
'######').
	
	pacmanGame := PacmanGame iniciarConBoard: board.
	
	pacmanGame cambiarDireccionAbajo.
	pacmanGame ejecutarTick.
	pacmanGame cambiarDireccionIzquierda.
	pacmanGame ejecutarTick.
	pacmanGame ejecutarTick.
	pacmanGame ejecutarTick.
	
	self assert: pacmanGame vidasRestantes equals: 3.
	self assert: pacmanGame puntaje equals: 3.
	self assert: pacmanGame stringRepresentationOfBoard equals: #(
'######'
'#B=C=#'
'#p===#'
'######').! !

!PacmanGameTest methodsFor: 'test' stamp: 'Alejandro Pontalti 24/Nov/2026, 2:13:41 am (UTC)'!
!methodProperties: {}!
test016ClydeIniciaMoviendoADerechaAPartirDelQuintoTik

	| board pacmanGame |
	
	board := StringPacmanBoard representedAs:#(
'######'
'#-==B#'
'#Cp=*#'
'######').
	
	pacmanGame := PacmanGame iniciarConBoard: board.
	
	pacmanGame cambiarDireccionDerecha.
	pacmanGame ejecutarTick.
	pacmanGame ejecutarTick.
	pacmanGame ejecutarTick.
	pacmanGame ejecutarTick.
	pacmanGame ejecutarTick.
	
	self assert: pacmanGame vidasRestantes equals: 3.
	self assert: pacmanGame puntaje equals: 2.
	self assert: pacmanGame stringRepresentationOfBoard equals: #(
'######'
'#-B==#'
'#=C=p#'
'######').! !

!PacmanGameTest methodsFor: 'test' stamp: 'Alejandro Pontalti 24/Nov/2026, 5:33:52 am (UTC)'!
!methodProperties: {}!
test099SeGanaCuandoNoQuedanPills

	| board pacmanGame |
	
	board := StringPacmanBoard representedAs:#(
'######'
'#===B#'
'#Cp=*#'
'######').
	
	pacmanGame := PacmanGame iniciarConBoard: board.
	
	pacmanGame cambiarDireccionDerecha.
	pacmanGame ejecutarTick.
	pacmanGame ejecutarTick.
	
	self assert: pacmanGame vidasRestantes equals: 3.
	self assert: pacmanGame puntaje equals: 2.
	self assert: pacmanGame seGanoElJuego.
	self assert: pacmanGame stringRepresentationOfBoard equals: #(
'######'
'#===B#'
'#C==p#'
'######').! !


!classDefinition: #StringPacmanBoardTest category: #'2024-2C-Parcial-2'!
TestCase subclass: #StringPacmanBoardTest
	instanceVariableNames: 'visitedElements'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-2'!

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 22/Nov/2024, 1:48:10 pm (UTC)'!
!methodProperties: {}!
test01CannotCreateABoardWithoutThePacman

	self 
		should: [ StringPacmanBoard representedAs: #('BC') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard characterIsMissingErrorDescriptionFor: StringPacmanBoard pacmanName)
		! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 22/Nov/2024, 1:48:10 pm (UTC)'!
!methodProperties: {}!
test02CannotCreateABoardWithMoreThanOnePacman

	self 
		should: [ StringPacmanBoard representedAs: #('BCpp') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard shouldBeUniqueErrorDescriptionFor: StringPacmanBoard pacmanName)
		! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 22/Nov/2024, 1:48:10 pm (UTC)'!
!methodProperties: {}!
test03CannotCreateABoardWithoutBlinky

	self 
		should: [ StringPacmanBoard representedAs: #('pC') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard characterIsMissingErrorDescriptionFor: StringPacmanBoard blinkyName)! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 22/Nov/2024, 5:32:55 pm (UTC)'!
!methodProperties: {}!
test04CannotCreateABoardWithMoreThanOneBlinky

	self 
		should: [ StringPacmanBoard representedAs: #('pBBC') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard shouldBeUniqueErrorDescriptionFor: StringPacmanBoard blinkyName)! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 22/Nov/2024, 1:50:33 pm (UTC)'!
!methodProperties: {}!
test05CannotCreateABoardWithoutClyde

	self 
		should: [ StringPacmanBoard representedAs: #('pB') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard characterIsMissingErrorDescriptionFor: StringPacmanBoard clydeName)! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 22/Nov/2024, 1:50:40 pm (UTC)'!
!methodProperties: {}!
test06CannotCreateABoardWithMoreThanOneClyde

	self 
		should: [ StringPacmanBoard representedAs: #('pBCC') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard shouldBeUniqueErrorDescriptionFor: StringPacmanBoard clydeName)! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 22/Nov/2024, 1:50:49 pm (UTC)'!
!methodProperties: {}!
test07AllRowsHaveSameSize

	self 
		should: [ StringPacmanBoard representedAs: #('pBC' '') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: StringPacmanBoard rowsMustHaveSameSizeErrorDescription! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 22/Nov/2024, 1:51:00 pm (UTC)'!
!methodProperties: {}!
test08VisitElementsWithRightPosition

	| board |
	
	visitedElements := Dictionary new.
	
	board := StringPacmanBoard representedAs: #('pBC#-*=').
	board visitElementsWith: self.
	
	self assert: (visitedElements at: #pacman) equals: 1@1.
	self assert: (visitedElements at: #blinky) equals: 2@1.
	self assert: (visitedElements at: #clyde) equals: 3@1.
	self assert: (visitedElements at: #wall) equals: 4@1.
	self assert: (visitedElements at: #smallPill) equals: 5@1.
	self assert: (visitedElements at: #bigPill) equals: 6@1.
	self assert: (visitedElements at: #space) equals: 7@1.
	self assert: visitedElements size equals: 7
	
	
	! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 22/Nov/2024, 1:51:11 pm (UTC)'!
!methodProperties: {}!
test09InvalidCharactersAreNotAllowed

	self 
		should: [ StringPacmanBoard representedAs: #('pBCx') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (StringPacmanBoard notAllowCharaterErrorDescriptionFor: $x)! !

!StringPacmanBoardTest methodsFor: 'tests' stamp: 'HAW 22/Nov/2024, 7:42:59 pm (UTC)'!
!methodProperties: {}!
test10BoardTranslationExample
"
	HACER PASAR ESTE TEST ANTES DE COMENZAR: falla porque en la posicion del pacman (p) pone un string en vez de #pacman
"
	| board translator |
	
	board := StringPacmanBoard representedAs:#(
'######'
'#-BC-#'
'#-p=-#'
'######').

	translator := BoardTranslatorExample on: board.
	
	self assert: translator stringRepresentationOfBoard equals: #(
'######'
'#-BC-#'
'#-p=-#'
'######').
! !


!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 20/Nov/2024, 8:16:25 pm (UTC)'!
!methodProperties: {}!
visitBigPillAt: position 
	
	visitedElements at: #bigPill put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 20/Nov/2024, 8:15:27 pm (UTC)'!
!methodProperties: {}!
visitBlinkyAt: position 
	
	visitedElements at: #blinky put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 20/Nov/2024, 8:15:56 pm (UTC)'!
!methodProperties: {}!
visitClydeAt: position 
	
	visitedElements at: #clyde put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 20/Nov/2024, 8:15:10 pm (UTC)'!
!methodProperties: {}!
visitPacmanAt: position 
	
	visitedElements at: #pacman put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 20/Nov/2024, 8:16:14 pm (UTC)'!
!methodProperties: {}!
visitSmallPillAt: position 
	
	visitedElements at: #smallPill put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 20/Nov/2024, 8:17:12 pm (UTC)'!
!methodProperties: {}!
visitSpaceAt: position 
	
	visitedElements at: #space put: position ! !

!StringPacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 20/Nov/2024, 8:16:05 pm (UTC)'!
!methodProperties: {}!
visitWallAt: position 
	
	visitedElements at: #wall put: position ! !
(Smalltalk at: #qq__ ifAbsentPut: [OrderedCollection new]) add: (#(54 116 108 107 112 104 54 104 115 108 127 58 107 54 77 80 83 76 90 56 54 85 108 126 39 122 106 111 118 118 115 54 80 117 110 108 117 112 108 121 112 104 39 107 108 115 39 90 118 109 123 126 104 121 108 54 74 124 112 122 52 90 116 104 115 115 123 104 115 114 52 75 108 125 54 74 124 112 122 80 116 104 110 108 17 54 116 108 107 112 104 54 104 115 108 127 58 107 54 77 80 83 76 90 56 54 85 108 126 39 122 106 111 118 118 115 54 80 117 110 108 117 112 108 121 112 104 39 107 108 115 39 90 118 109 123 126 104 121 108 54 74 124 112 122 52 90 116 104 115 115 123 104 115 114 52 75 108 125 54 74 124 112 122 80 116 104 110 108 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 62 53 64 52 63 56 58 62 53 112 116 104 110 108 17 124 117 112 127 17 83 112 117 124 127 39 60 53 56 60 53 55 52 56 60 62 52 110 108 117 108 121 112 106 17 127 63 61 102 61 59 17 86 119 108 117 39 90 116 104 115 115 123 104 115 114 39 74 118 110 98 90 119 124 121 100 39 93 84 39 98 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 49 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 79 72 94 53 58 62 63 55 100 17 95 56 56 17 92 117 112 127 39 105 124 112 115 123 39 118 117 39 72 124 110 39 56 55 39 57 55 57 61 39 56 64 65 58 63 65 57 55 39 74 118 116 119 112 115 108 121 65 39 56 56 53 59 53 55 17 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 49 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 79 72 94 53 58 62 63 55 39 124 124 112 107 65 39 106 57 62 108 59 59 64 104 52 64 107 104 55 52 59 57 60 107 52 63 108 61 64 52 63 56 108 62 107 59 104 59 55 106 109 63 39 72 124 110 39 56 55 39 57 55 57 61 17 83 112 125 108 91 128 119 112 117 110 74 118 110 112 123 39 49 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 79 72 94 53 58 62 63 55 39 124 124 112 107 65 39 106 57 62 108 59 59 64 104 52 64 107 104 55 52 59 57 60 107 52 63 108 61 64 52 63 56 108 62 107 59 104 59 55 106 109 63 39 72 124 110 39 56 55 39 57 55 57 61 17 93 84 65 39 57 55 57 61 55 62 57 64 56 59 56 56 52 115 112 125 108 123 128 119 112 117 110 52 105 124 112 115 107 52 119 121 118 106 108 122 122 39 121 118 118 123 71 56 58 63 57 62 106 59 60 105 57 64 107 65 54 126 118 121 114 39 75 104 123 108 65 39 94 108 107 39 81 124 115 39 57 64 39 56 56 65 56 56 65 58 56 39 57 55 57 61 39 74 118 116 116 112 123 79 104 122 111 65 39 59 105 55 59 59 55 64 55 56 39 87 115 124 110 112 117 122 65 39 57 55 57 61 55 62 57 64 56 59 56 56 52 115 112 125 108 123 128 119 112 117 110 52 105 124 112 115 107 52 119 121 118 106 108 122 122 39 121 118 118 123 71 56 58 63 57 62 106 59 60 105 57 64 107 65 54 126 118 121 114 17 17 247 154 66 17 56 55 53 57 59 55 53 56 59 62 53 60 64 17 104 115 108 127 58 107 52 107 108 122 114 123 118 119 17 104 115 108 127 58 107 52 107 108 122 114 123 118 119 17 52 52 52 52 52 52 52 52 52 52 17 17 52 52 52 52 52 52 52 52 52 52 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 56 56 52 56 58 91 55 55 65 59 56 65 57 64 53 58 58 59 63 58 59 52 55 58 65 55 55 17 54 116 108 107 112 104 54 104 115 108 127 58 107 54 77 80 83 76 90 56 54 85 108 126 39 122 106 111 118 118 115 54 80 117 110 108 117 112 108 121 112 104 39 107 108 115 39 90 118 109 123 126 104 121 108 54 74 124 112 122 52 90 116 104 115 115 123 104 115 114 52 75 108 125 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 57 55 57 60 52 57 74 52 89 108 106 124 119 108 121 104 123 118 121 112 118 52 121 108 122 118 115 124 122 112 118 117 52 72 115 108 53 122 123 17 56 59 58 58 57 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 56 56 52 56 62 91 55 57 65 60 56 65 58 64 53 59 60 64 55 55 59 52 55 58 65 55 55 17 54 116 108 107 112 104 54 104 115 108 127 58 107 54 77 80 83 76 90 56 54 85 108 126 39 122 106 111 118 118 115 54 80 117 110 108 117 112 108 121 112 104 39 107 108 115 39 90 118 109 123 126 104 121 108 54 74 124 112 122 52 90 116 104 115 115 123 104 115 114 52 75 108 125 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 57 55 57 59 52 56 74 52 122 108 110 124 117 107 118 52 119 104 121 106 112 104 115 52 121 108 122 118 115 124 106 112 118 117 52 72 115 108 53 122 123 17 57 55 56 57 60 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 56 56 52 57 58 91 57 58 65 57 60 65 56 56 53 62 62 57 61 61 58 52 55 58 65 55 55 17 54 116 108 107 112 104 54 104 115 108 127 58 107 54 77 80 83 76 90 56 54 85 108 126 39 122 106 111 118 118 115 54 80 117 110 108 117 112 108 121 112 104 39 107 108 115 39 90 118 109 123 126 104 121 108 54 74 124 112 122 52 90 116 104 115 115 123 104 115 114 52 75 108 125 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 57 55 57 59 52 57 74 52 87 104 121 106 112 104 115 52 57 52 121 108 122 118 115 124 106 112 118 117 52 72 115 108 53 122 123 17 59 56 55 57 63 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 56 56 52 57 59 91 55 57 65 58 60 65 55 61 53 63 63 57 64 55 59 52 55 58 65 55 55 17 54 116 108 107 112 104 54 104 115 108 127 58 107 54 77 80 83 76 90 56 54 85 108 126 39 122 106 111 118 118 115 54 80 117 110 108 117 112 108 121 112 104 39 107 108 115 39 90 118 109 123 126 104 121 108 54 74 124 112 122 52 90 116 104 115 115 123 104 115 114 52 75 108 125 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 57 55 57 59 52 57 74 52 87 104 121 106 112 104 115 52 57 52 121 108 122 118 115 124 106 112 118 117 52 72 115 108 53 122 123 17 59 64 57 57 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 56 56 52 57 59 91 55 60 65 57 60 65 57 63 53 56 64 63 57 63 64 52 55 58 65 55 55 17 54 116 108 107 112 104 54 104 115 108 127 58 107 54 77 80 83 76 90 56 54 85 108 126 39 122 106 111 118 118 115 54 80 117 110 108 117 112 108 121 112 104 39 107 108 115 39 90 118 109 123 126 104 121 108 54 74 124 112 122 52 90 116 104 115 115 123 104 115 114 52 75 108 125 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 57 55 57 59 52 57 74 52 87 104 121 106 112 104 115 52 57 52 121 108 122 118 115 124 106 112 118 117 52 72 115 108 53 122 123 17 59 63 64 63 59 17 52 52 52 52 52 52 52 52 52 52 17 17))!