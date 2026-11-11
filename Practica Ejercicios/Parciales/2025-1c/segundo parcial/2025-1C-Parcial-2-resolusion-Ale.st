!classDefinition: #Pared category: #'2025-1C-Parcial-2'!
Object subclass: #Pared
	instanceVariableNames: 'pinturas extencion'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2025-1C-Parcial-2'!

!Pared methodsFor: 'acciones' stamp: 'Alejandro pontalti 5/Nov/2026, 12:48:28 am (UTC)'!
!methodProperties: {}!
agregarPintura: unaPintura  
	
	self pinturaAAgregarValida: unaPintura.
	
	pinturas add: unaPintura.! !

!Pared methodsFor: 'acciones' stamp: 'Alejandro Pontalti 11/Nov/2026, 2:01:35 am (UTC)'!
!methodProperties: {}!
seleccionarPintura: unaPintura

	^self validarYSeleccionarPintura: unaPintura.! !


!Pared methodsFor: 'access' stamp: 'Alejandro pontalti 5/Nov/2026, 12:28:01 am (UTC)'!
!methodProperties: {}!
incluyePintura: unaPintura 
	
	^(pinturas select: [:pintura | pintura = unaPintura ]) isEmpty not.! !


!Pared methodsFor: 'initialize' stamp: 'Alejandro pontalti 5/Nov/2026, 12:12:48 am (UTC)'!
!methodProperties: {}!
inicializarConExtencion: unaExtencion 
	
	extencion := unaExtencion.
	self initialize.
	^self.! !

!Pared methodsFor: 'initialize' stamp: 'Alejandro pontalti 31/Oct/2026, 1:02:50 am (UTC)'!
!methodProperties: {}!
initialize

	pinturas := OrderedCollection new.! !

!Pared methodsFor: 'initialize' stamp: 'Alejandro pontalti 5/Nov/2026, 12:14:36 am (UTC)'!
!methodProperties: {}!
initializeWith: unaExtencion 
	
	extencion := unaExtencion.! !


!Pared methodsFor: 'validaciones' stamp: 'Alejandro pontalti 5/Nov/2026, 12:50:27 am (UTC)'!
!methodProperties: {}!
pinturaAAgregarNoSeSuperpone: unaPintura
	
	pinturas isEmpty ifFalse: [ 
		pinturas do: [ :pintura |
			((unaPintura posicion = pintura posicion ) and: (unaPintura totalExtencion = pintura totalExtencion)) ifTrue: [^self error: Pared posicionOcupadaError. 
			].
		].
	].! !

!Pared methodsFor: 'validaciones' stamp: 'Alejandro pontalti 5/Nov/2026, 12:50:48 am (UTC)'!
!methodProperties: {}!
pinturaAAgregarValida: unaPintura

	self posicionAAgregarEnRango: unaPintura.
	
	self pinturaAAgregarNoSeSuperpone: unaPintura.! !

!Pared methodsFor: 'validaciones' stamp: 'Alejandro pontalti 5/Nov/2026, 12:49:40 am (UTC)'!
!methodProperties: {}!
posicionAAgregarEnRango: unaPintura

	((unaPintura posicion between: 0@0 and: extencion) and: (unaPintura totalExtencion between: 0@0 and: extencion)) ifFalse: [^self error: Pared pinturaFueraDeRangoError.].! !

!Pared methodsFor: 'validaciones' stamp: 'Alejandro Pontalti 11/Nov/2026, 1:58:40 am (UTC)'!
!methodProperties: {}!
validarNoVacio

	pinturas isEmpty ifTrue: [^self error: Pared pinturaSeleccionadaNoExisteEnParedError.].
	
	! !

!Pared methodsFor: 'validaciones' stamp: 'Alejandro Pontalti 11/Nov/2026, 2:01:35 am (UTC)'!
!methodProperties: {}!
validarYSeleccionarPintura: unaPintura
	
	|pinturasSeleccionadas|
	
	self validarNoVacio.
	pinturasSeleccionadas := pinturas select: [:pintura | pintura = unaPintura ].
	
	pinturasSeleccionadas ifNotEmpty: [^pinturasSeleccionadas first.] ifEmpty: [^self error: Pared pinturaSeleccionadaNoExisteEnParedError.].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Pared class' category: #'2025-1C-Parcial-2'!
Pared class
	instanceVariableNames: ''!

!Pared class methodsFor: 'error' stamp: 'Alejandro pontalti 31/Oct/2026, 12:18:56 am (UTC)'!
!methodProperties: {}!
pinturaFueraDeRangoError

	^'La pintura que intenta agregar esta fuera del rango de la pared.'.! !

!Pared class methodsFor: 'error' stamp: 'Alejandro Pontalti 11/Nov/2026, 2:10:18 am (UTC)'!
!methodProperties: {}!
pinturaSeleccionadaNoExisteEnParedError

	^'No existe la pintura que intenta seleccionar.'.! !

!Pared class methodsFor: 'error' stamp: 'Alejandro pontalti 31/Oct/2026, 12:39:59 am (UTC)'!
!methodProperties: {}!
posicionOcupadaError

	^'Ya existe una pintura en la posicion y extencion en la que intenta agregar la nueva pintura.'.! !


!classDefinition: #Pintor category: #'2025-1C-Parcial-2'!
Object subclass: #Pintor
	instanceVariableNames: 'pinturasSeleccionadas'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2025-1C-Parcial-2'!

!Pintor methodsFor: 'acciones' stamp: 'Alejandro Pontalti 11/Nov/2026, 2:18:50 am (UTC)'!
!methodProperties: {}!
agregarPinturaSeleccionadaNoRepetida: unaPintura
	
	(self pinturaSeleccionadaRepetida: unaPintura) ifTrue: [^self error: Pintor pinturaSeleccionadaRepetidaError] 
		ifFalse: [pinturasSeleccionadas addLast: unaPintura] .! !

!Pintor methodsFor: 'acciones' stamp: 'Alejandro Pontalti 11/Nov/2026, 4:43:54 am (UTC)'!
!methodProperties: {}!
alinearPinturasSeleccionadasADerecha
	
	|pinturaMayorPosicionX|
	
	self validarCantidadMinimaSeleccionadaParaAlinear.
	pinturaMayorPosicionX := self encontrarMayorPosicionXMasAnchoEnSeleccionadas.
	self alinearPinturasSeleccionadasAMayorPosicionXMasAncho: pinturaMayorPosicionX.! !

!Pintor methodsFor: 'acciones' stamp: 'Alejandro Pontalti 11/Nov/2026, 1:46:44 am (UTC)'!
!methodProperties: {}!
alinearPinturasSeleccionadasAIzquierda
	
	|pinturaMenorPosicionX|
	
	self validarCantidadMinimaSeleccionadaParaAlinear.
	pinturaMenorPosicionX := self encontrarMenorPosicionXEnSeleccionadas.
	self  alinearPinturasSeleccionadasAMenorPosicionX: pinturaMenorPosicionX.! !

!Pintor methodsFor: 'acciones' stamp: 'Alejandro pontalti 31/Oct/2026, 12:03:42 am (UTC)'!
!methodProperties: {}!
pintar: unaPintura enPared: unaPared 
	
	unaPared agregarPintura: unaPintura .! !

!Pintor methodsFor: 'acciones' stamp: 'Alejandro Pontalti 11/Nov/2026, 2:19:47 am (UTC)'!
!methodProperties: {}!
pinturaSeleccionadaRepetida: unaPintura
	
	^((pinturasSeleccionadas select: [ :pintura | unaPintura = pintura ]) isEmpty not). ! !

!Pintor methodsFor: 'acciones' stamp: 'Alejandro Pontalti 11/Nov/2026, 2:05:32 am (UTC)'!
!methodProperties: {}!
selecionarPintura: unaPintura dePared: unaPared 
	
	self agregarPinturaSeleccionadaNoRepetida: (unaPared seleccionarPintura: unaPintura).! !


!Pintor methodsFor: 'initialize' stamp: 'Alejandro pontalti 8/Nov/2026, 2:01:15 am (UTC)'!
!methodProperties: {}!
initialize

	pinturasSeleccionadas := OrderedCollection new.! !


!Pintor methodsFor: 'private' stamp: 'Alejandro Pontalti 11/Nov/2026, 4:52:10 am (UTC)'!
!methodProperties: {}!
alinearPinturasSeleccionadasAMayorPosicionXMasAncho: pinturaMayorPosicionXMasAncho

	|loQueLeFalta|
	
	pinturasSeleccionadas do: [ 
		:pintura | 
		loQueLeFalta := pinturaMayorPosicionXMasAncho - (pintura posicion x + pintura extencion x).
		pintura posicion: ((pintura posicion x + loQueLeFalta)@pintura posicion y).
	].! !

!Pintor methodsFor: 'private' stamp: 'Alejandro Pontalti 11/Nov/2026, 4:52:10 am (UTC)'!
!methodProperties: {}!
alinearPinturasSeleccionadasAMenorPosicionX: pinturaMenorPosicionX
	
	pinturasSeleccionadas do: [ :pintura | pintura posicion: (pinturaMenorPosicionX@pintura posicion y)].! !

!Pintor methodsFor: 'private' stamp: 'Alejandro Pontalti 11/Nov/2026, 4:37:21 am (UTC)'!
!methodProperties: {}!
encontrarMayorPosicionXMasAnchoEnSeleccionadas
	
	|pinturaMayorPosicionXMasAncho|
	
	pinturaMayorPosicionXMasAncho := pinturasSeleccionadas first posicion x.
	pinturaMayorPosicionXMasAncho := pinturaMayorPosicionXMasAncho + pinturasSeleccionadas first extencion x.
	
	pinturasSeleccionadas do: [ 
		:pintura | 
		((pintura posicion x + pintura extencion x) > pinturaMayorPosicionXMasAncho) ifTrue: [pinturaMayorPosicionXMasAncho := (pintura posicion x + pintura extencion x)]. 
	].
	
	^pinturaMayorPosicionXMasAncho.! !

!Pintor methodsFor: 'private' stamp: 'Alejandro Pontalti 11/Nov/2026, 1:43:52 am (UTC)'!
!methodProperties: {}!
encontrarMenorPosicionXEnSeleccionadas
	
	|pinturaMenorPosicionX|
	
	pinturaMenorPosicionX := pinturasSeleccionadas first posicion x.
	
	pinturasSeleccionadas do: [ 
		:pintura | 
		(pintura posicion x < pinturaMenorPosicionX) ifTrue: [pinturaMenorPosicionX := pintura posicion x]. 
	].
	
	^pinturaMenorPosicionX.! !

!Pintor methodsFor: 'private' stamp: 'Alejandro Pontalti 11/Nov/2026, 1:41:20 am (UTC)'!
!methodProperties: {}!
validarCantidadMinimaSeleccionadaParaAlinear

	(pinturasSeleccionadas size < 2) ifTrue: [^self error: Pintor pinturasSeleccionadasAlineacionError ].! !


!Pintor methodsFor: 'accessing' stamp: 'Alejandro pontalti 8/Nov/2026, 2:03:44 am (UTC)'!
!methodProperties: {}!
pinturasSeleccionadas

	^pinturasSeleccionadas! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Pintor class' category: #'2025-1C-Parcial-2'!
Pintor class
	instanceVariableNames: ''!

!Pintor class methodsFor: 'error' stamp: 'Alejandro Pontalti 10/Nov/2026, 11:30:20 pm (UTC)'!
!methodProperties: {}!
pinturaSeleccionadaRepetidaError

	^'La pintura que intenta seleccionar esta repetida pared.'.! !

!Pintor class methodsFor: 'error' stamp: 'Alejandro Pontalti 11/Nov/2026, 1:35:14 am (UTC)'!
!methodProperties: {}!
pinturasSeleccionadasAlineacionError

	^'Deben haber seleccionadas mas de 1 pintira para poder alinearlas.'.! !


!classDefinition: #Pintura category: #'2025-1C-Parcial-2'!
Object subclass: #Pintura
	instanceVariableNames: 'posicion extencion'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2025-1C-Parcial-2'!

!Pintura methodsFor: 'initialize' stamp: 'Alejandro pontalti 31/Oct/2026, 12:00:27 am (UTC)'!
!methodProperties: {}!
inicializarEnPosicion: unaPosicion conExtencion: unaExtencion
	
	posicion := unaPosicion.
	extencion := unaExtencion.! !


!Pintura methodsFor: 'accessing' stamp: 'Alejandro pontalti 31/Oct/2026, 12:28:11 am (UTC)'!
!methodProperties: {}!
extencion
	
	^extencion! !

!Pintura methodsFor: 'accessing' stamp: 'Alejandro pontalti 31/Oct/2026, 12:25:39 am (UTC)'!
!methodProperties: {}!
posicion
	
	^posicion! !

!Pintura methodsFor: 'accessing' stamp: 'Alejandro pontalti 31/Oct/2026, 12:33:47 am (UTC)'!
!methodProperties: {}!
totalExtencion
	
	^posicion + extencion.! !


!Pintura methodsFor: 'mutable' stamp: 'Alejandro Pontalti 11/Nov/2026, 4:52:10 am (UTC)'!
!methodProperties: {}!
posicion: unPunto 
	
	posicion := unPunto.! !


!classDefinition: #PintorTest category: #'2025-1C-Parcial-2'!
TestCase subclass: #PintorTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2025-1C-Parcial-2'!

!PintorTest methodsFor: 'test' stamp: 'Alejandro pontalti 5/Nov/2026, 12:15:09 am (UTC)'!
!methodProperties: {}!
test001AgregarPinturaAParedEnPosicion

	| unPintor unaPared unaPintura |
	unPintor := Pintor new.
	unaPared := Pared new initializeWith: 14@8.
	unaPintura := Pintura new inicializarEnPosicion: 10@5 conExtencion: 3@2.
	
	unPintor pintar: unaPintura enPared: unaPared.
	
	self assert: (unaPared incluyePintura: unaPintura).
	
	! !

!PintorTest methodsFor: 'test' stamp: 'Alejandro pontalti 5/Nov/2026, 12:15:20 am (UTC)'!
!methodProperties: {}!
test002NoPuedeAgregarPinturaAParedEnPosicionFueraDeRango

	| unPintor unaPared unaPintura |
	unPintor := Pintor new.
	unaPared := Pared new initializeWith: 12@6.
	unaPintura := Pintura new inicializarEnPosicion: 10@5 conExtencion: 3@2.
	
	self should: [unPintor pintar: unaPintura enPared: unaPared.]
	raise: Error 
	withExceptionDo: [ :error | error messageText = Pared pinturaFueraDeRangoError.].
	
	self deny: (unaPared incluyePintura: unaPintura).
	
	! !

!PintorTest methodsFor: 'test' stamp: 'Alejandro pontalti 5/Nov/2026, 12:15:48 am (UTC)'!
!methodProperties: {}!
test003NoPuedeAgregarPinturaAParedEnPosicionYExtencionYaOcupadas

	| unPintor unaPared unaPintura otraPintura |
	unPintor := Pintor new.
	unaPared := Pared new initializeWith: 14@8.
	unaPintura := Pintura new inicializarEnPosicion: 10@5 conExtencion: 3@2.
	unPintor pintar: unaPintura enPared: unaPared.
	otraPintura := Pintura new inicializarEnPosicion: 10@5 conExtencion: 3@2.
	
	self should: [unPintor pintar: otraPintura enPared: unaPared.]
	raise: Error 
	withExceptionDo: [ :error | error messageText = Pared posicionOcupadaError.].
	
	self assert: (unaPared incluyePintura: unaPintura).
	self deny: (unaPared incluyePintura: otraPintura).
	
	! !

!PintorTest methodsFor: 'test' stamp: 'Alejandro pontalti 5/Nov/2026, 12:31:34 am (UTC)'!
!methodProperties: {}!
test004puedeAgregarMasDeUnaPinturaEnParedEnPosicionesYExtencionesValidas

	| unPintor unaPared unaPintura otraPintura |
	unPintor := Pintor new.
	unaPared := Pared new initializeWith: 14@8.
	unaPintura := Pintura new inicializarEnPosicion: 10@5 conExtencion: 3@2.
	unPintor pintar: unaPintura enPared: unaPared.
	otraPintura := Pintura new inicializarEnPosicion: 8@2 conExtencion: 4@4.
	
	unPintor pintar: otraPintura enPared: unaPared.
		
	self assert: (unaPared incluyePintura: unaPintura).
	self assert: (unaPared incluyePintura: otraPintura).
	
	! !

!PintorTest methodsFor: 'test' stamp: 'Alejandro pontalti 5/Nov/2026, 12:46:43 am (UTC)'!
!methodProperties: {}!
test005noPuedeAgregarMasDeUnaPinturaEnParedEnPosicionesYExtencionesOcupadas

	| unPintor unaPared unaPintura otraPintura unaPinturaMas |
	unPintor := Pintor new.
	unaPared := Pared new initializeWith: 14@8.
	unaPintura := Pintura new inicializarEnPosicion: 10@5 conExtencion: 3@2.
	unPintor pintar: unaPintura enPared: unaPared.
	otraPintura := Pintura new inicializarEnPosicion: 8@2 conExtencion: 4@4.
	unPintor pintar: otraPintura enPared: unaPared.
	unaPinturaMas := Pintura new inicializarEnPosicion: 8@2 conExtencion: 4@4.
	
	self should: [unPintor pintar: unaPinturaMas enPared: unaPared.]
	raise: Error 
	withExceptionDo: [ :error | error messageText = Pared posicionOcupadaError.].
		
	self assert: (unaPared incluyePintura: unaPintura).
	self assert: (unaPared incluyePintura: otraPintura).
	self deny: (unaPared incluyePintura: unaPinturaMas).
	
	! !

!PintorTest methodsFor: 'test' stamp: 'Alejandro pontalti 8/Nov/2026, 1:46:41 am (UTC)'!
!methodProperties: {}!
test006puedeAgregarMasDeUnaPinturaEnParedesDistintas

	| unPintor unaPared unaPintura otraPintura unaPinturaMas otraPared |
	unPintor := Pintor new.
	unaPared := Pared new initializeWith: 14@8.
	otraPared := Pared new initializeWith: 14@8.
	unaPintura := Pintura new inicializarEnPosicion: 10@5 conExtencion: 3@2.
	unPintor pintar: unaPintura enPared: unaPared.
	otraPintura := Pintura new inicializarEnPosicion: 8@2 conExtencion: 4@4.
	unPintor pintar: otraPintura enPared: unaPared.
	unaPinturaMas := Pintura new inicializarEnPosicion: 8@2 conExtencion: 4@4.
	
	unPintor pintar: unaPinturaMas enPared: otraPared.
		
	self assert: (unaPared incluyePintura: unaPintura).
	self assert: (unaPared incluyePintura: otraPintura).
	self assert: (otraPared incluyePintura: unaPinturaMas).
	
	! !

!PintorTest methodsFor: 'test' stamp: 'Alejandro pontalti 8/Nov/2026, 2:05:58 am (UTC)'!
!methodProperties: {}!
test007puedeSeleccionarPinturaDePared

	| unPintor unaPared unaPintura |
	unPintor := Pintor new.
	unaPared := Pared new initializeWith: 14@8.
	unaPintura := Pintura new inicializarEnPosicion: 10@5 conExtencion: 3@2.
	unPintor pintar: unaPintura enPared: unaPared.	
	unPintor selecionarPintura: unaPintura dePared: unaPared.
		
	self assert: (unaPared incluyePintura: unaPintura).
	self assert: (unPintor pinturasSeleccionadas = {unaPintura }asOrderedCollection ).! !

!PintorTest methodsFor: 'test' stamp: 'Alejandro Pontalti 11/Nov/2026, 2:09:09 am (UTC)'!
!methodProperties: {}!
test008noPuedeSeleccionarPinturaQueNoEsteEnPared

	| unPintor unaPared unaPintura |
	unPintor := Pintor new.
	unaPared := Pared new initializeWith: 14@8.
	unaPintura := Pintura new inicializarEnPosicion: 10@5 conExtencion: 3@2.
	
	self should: [unPintor selecionarPintura: unaPintura dePared: unaPared.]  
	raise: Error 
	withExceptionDo: [:error | error messageText = Pared posicionOcupadaError.].
		
	self deny: (unaPared incluyePintura: unaPintura).
	self assert: (unPintor pinturasSeleccionadas isEmpty ).! !

!PintorTest methodsFor: 'test' stamp: 'Alejandro Pontalti 11/Nov/2026, 2:10:45 am (UTC)'!
!methodProperties: {}!
test009noPuedeSeleccionarPinturasRepetidasDePared

	| unPintor unaPared unaPintura otraPintura unaPinturaMas |
	unPintor := Pintor new.
	unaPared := Pared new initializeWith: 14@8.
	unaPintura := Pintura new inicializarEnPosicion: 10@5 conExtencion: 3@2.
	otraPintura := Pintura new inicializarEnPosicion: 8@2 conExtencion: 4@4.
	unPintor pintar: otraPintura enPared: unaPared.
	unaPinturaMas := Pintura new inicializarEnPosicion: 8@3 conExtencion: 4@4.
	unPintor pintar: unaPinturaMas enPared: unaPared.
	unPintor pintar: unaPintura enPared: unaPared.	
	unPintor selecionarPintura: unaPintura dePared: unaPared.
	unPintor selecionarPintura: otraPintura dePared: unaPared.
	unPintor selecionarPintura: unaPinturaMas dePared: unaPared.
	
	self should: [unPintor selecionarPintura: unaPintura dePared: unaPared.]
	raise: Error 
	withExceptionDo: [ :error | error messageText = Pintor pinturaSeleccionadaRepetidaError.].
		
	self assert: (unaPared incluyePintura: unaPintura).
	self assert: (unaPared incluyePintura: otraPintura).
	self assert: (unaPared incluyePintura: unaPinturaMas).
	self assert: (unPintor pinturasSeleccionadas = {unaPintura. otraPintura. unaPinturaMas }asOrderedCollection ).! !

!PintorTest methodsFor: 'test' stamp: 'Alejandro Pontalti 11/Nov/2026, 4:24:44 am (UTC)'!
!methodProperties: {}!
test010alinearPinturasSeleccionadasALaIzquierdaMueveLosXHaciaElMenorX

	| unPintor unaPared unaPintura otraPintura unaPinturaMas |
	unPintor := Pintor new.
	unaPared := Pared new initializeWith: 14@8.
	unaPintura := Pintura new inicializarEnPosicion: 10@5 conExtencion: 3@2.
	otraPintura := Pintura new inicializarEnPosicion: 8@2 conExtencion: 4@4.
	unPintor pintar: otraPintura enPared: unaPared.
	unaPinturaMas := Pintura new inicializarEnPosicion: 2@2 conExtencion: 4@4.
	unPintor pintar: unaPinturaMas enPared: unaPared.
	unPintor pintar: unaPintura enPared: unaPared.	
	unPintor selecionarPintura: unaPintura dePared: unaPared.
	unPintor selecionarPintura: otraPintura dePared: unaPared.
	unPintor selecionarPintura: unaPinturaMas dePared: unaPared.
	
	unPintor alinearPinturasSeleccionadasAIzquierda.

	self assert: (unPintor pinturasSeleccionadas = {unaPintura. otraPintura. unaPinturaMas }asOrderedCollection ).
	self assert: (unaPintura posicion x = 2).
	self assert: (unaPintura posicion x = otraPintura posicion x).
	self assert: (unaPinturaMas posicion x = otraPintura posicion x).
	! !

!PintorTest methodsFor: 'test' stamp: 'Alejandro Pontalti 11/Nov/2026, 2:11:11 am (UTC)'!
!methodProperties: {}!
test011noPuedeAlinearPinturasSiSeleccionoMenosDeDosPinturas

	| unPintor unaPared unaPintura |
	unPintor := Pintor new.
	unaPared := Pared new initializeWith: 14@8.
	unaPintura := Pintura new inicializarEnPosicion: 10@5 conExtencion: 3@2.
	unPintor pintar: unaPintura enPared: unaPared.	
	unPintor selecionarPintura: unaPintura dePared: unaPared.
	
	self should: [unPintor alinearPinturasSeleccionadasAIzquierda.]
	raise: Error
	withExceptionDo: [ :error | error messageText = Pintor pinturasSeleccionadasAlineacionError.] . 

	self assert: (unPintor pinturasSeleccionadas = {unaPintura }asOrderedCollection ).
	self assert: (unaPintura posicion x = 10).! !

!PintorTest methodsFor: 'test' stamp: 'Alejandro Pontalti 11/Nov/2026, 4:28:43 am (UTC)'!
!methodProperties: {}!
test012alinearPinturasSeleccionadasALaDerechaMueveLosXHaciaElMayorXMasAncho

	| unPintor unaPared unaPintura otraPintura unaPinturaMas |
	unPintor := Pintor new.
	unaPared := Pared new initializeWith: 20@8.
	unaPintura := Pintura new inicializarEnPosicion: 10@5 conExtencion: 3@2.
	otraPintura := Pintura new inicializarEnPosicion: 8@2 conExtencion: 4@4.
	unPintor pintar: otraPintura enPared: unaPared.
	unaPinturaMas := Pintura new inicializarEnPosicion: 2@2 conExtencion: 4@4.
	unPintor pintar: unaPinturaMas enPared: unaPared.
	unPintor pintar: unaPintura enPared: unaPared.	
	unPintor selecionarPintura: unaPintura dePared: unaPared.
	unPintor selecionarPintura: otraPintura dePared: unaPared.
	unPintor selecionarPintura: unaPinturaMas dePared: unaPared.
	
	unPintor alinearPinturasSeleccionadasADerecha.

	self assert: (unPintor pinturasSeleccionadas = {unaPintura. otraPintura. unaPinturaMas }asOrderedCollection ).
	self assert: ((unaPintura posicion x + unaPintura extencion x) = 13).
	self assert: ((otraPintura posicion x + otraPintura extencion x) = 13).
	self assert: ((unaPinturaMas posicion x + unaPinturaMas extencion x) = 13).
	! !
