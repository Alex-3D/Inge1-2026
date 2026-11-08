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

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Pared class' category: #'2025-1C-Parcial-2'!
Pared class
	instanceVariableNames: ''!

!Pared class methodsFor: 'error' stamp: 'Alejandro pontalti 31/Oct/2026, 12:18:56 am (UTC)'!
!methodProperties: {}!
pinturaFueraDeRangoError

	^'La pintura que intenta agregar esta fuera del rango de la pared.'.! !

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

!Pintor methodsFor: 'acciones' stamp: 'Alejandro pontalti 31/Oct/2026, 12:03:42 am (UTC)'!
!methodProperties: {}!
pintar: unaPintura enPared: unaPared 
	
	unaPared agregarPintura: unaPintura .! !

!Pintor methodsFor: 'acciones' stamp: 'Alejandro pontalti 8/Nov/2026, 2:02:33 am (UTC)'!
!methodProperties: {}!
selecionarPintura: unaPintura dePared: unaPared 
	(unaPared incluyePintura: unaPintura) ifTrue: [pinturasSeleccionadas addLast: unaPintura ].! !


!Pintor methodsFor: 'initialize' stamp: 'Alejandro pontalti 8/Nov/2026, 2:01:15 am (UTC)'!
!methodProperties: {}!
initialize

	pinturasSeleccionadas := OrderedCollection new.! !


!Pintor methodsFor: 'accessing' stamp: 'Alejandro pontalti 8/Nov/2026, 2:03:44 am (UTC)'!
!methodProperties: {}!
pinturasSeleccionadas

	^pinturasSeleccionadas! !


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
