!classDefinition: #Pared category: #'2025-1C-Parcial-2'!
Object subclass: #Pared
	instanceVariableNames: 'pinturas extencion'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2025-1C-Parcial-2'!

!Pared methodsFor: 'acciones' stamp: 'Alejandro pontalti 31/Oct/2026, 1:23:08 am (UTC)'!
!methodProperties: {}!
agregarPintura: unaPintura  
	
	((unaPintura posicion between: 0@0 and: extencion) and: (unaPintura totalExtencion between: 0@0 and: extencion)) ifFalse: [^self error: Pared pinturaFueraDeRangoError.].
	pinturas isNil ifFalse: [
		((unaPintura posicion = pinturas at:1 posicion ) and: (unaPintura totalExtencion = pinturas totalExtencion)) ifTrue: [^self error: Pared posicionOcupadaError. 
			].
		].
	
	pinturas add: unaPintura.! !


!Pared methodsFor: 'access' stamp: 'Alejandro pontalti 30/Oct/2026, 11:47:04 pm (UTC)'!
!methodProperties: {}!
incluyePintura: unaPintura 
	
	^pinturas = unaPintura .! !


!Pared methodsFor: 'initialize' stamp: 'Alejandro pontalti 31/Oct/2026, 12:12:29 am (UTC)'!
!methodProperties: {}!
inicializarConExtencion: unaExtencion 
	
	extencion := unaExtencion.! !

!Pared methodsFor: 'initialize' stamp: 'Alejandro pontalti 31/Oct/2026, 1:02:50 am (UTC)'!
!methodProperties: {}!
initialize

	pinturas := OrderedCollection new.! !

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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2025-1C-Parcial-2'!

!Pintor methodsFor: 'acciones' stamp: 'Alejandro pontalti 31/Oct/2026, 12:03:42 am (UTC)'!
!methodProperties: {}!
pintar: unaPintura enPared: unaPared 
	
	unaPared agregarPintura: unaPintura .! !


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

!PintorTest methodsFor: 'test' stamp: 'Alejandro pontalti 31/Oct/2026, 12:11:16 am (UTC)'!
!methodProperties: {}!
test001AgregarPinturaAParedEnPosicion

	| unPintor unaPared unaPintura |
	unPintor := Pintor new.
	unaPared := Pared new inicializarConExtencion: 14@8.
	unaPintura := Pintura new inicializarEnPosicion: 10@5 conExtencion: 3@2.
	
	unPintor pintar: unaPintura enPared: unaPared.
	
	self assert: (unaPared incluyePintura: unaPintura).
	
	! !

!PintorTest methodsFor: 'test' stamp: 'Alejandro pontalti 31/Oct/2026, 12:17:13 am (UTC)'!
!methodProperties: {}!
test002NoPuedeAgregarPinturaAParedEnPosicionFueraDeRango

	| unPintor unaPared unaPintura |
	unPintor := Pintor new.
	unaPared := Pared new inicializarConExtencion: 12@6.
	unaPintura := Pintura new inicializarEnPosicion: 10@5 conExtencion: 3@2.
	
	self should: [unPintor pintar: unaPintura enPared: unaPared.]
	raise: Error 
	withExceptionDo: [ :error | error messageText = Pared pinturaFueraDeRangoError.].
	
	self deny: (unaPared incluyePintura: unaPintura).
	
	! !

!PintorTest methodsFor: 'test' stamp: 'Alejandro pontalti 31/Oct/2026, 12:38:17 am (UTC)'!
!methodProperties: {}!
test003NoPuedeAgregarPinturaAParedEnPosicionYExtencionYaOcupadas

	| unPintor unaPared unaPintura otraPintura |
	unPintor := Pintor new.
	unaPared := Pared new inicializarConExtencion: 14@8.
	unaPintura := Pintura new inicializarEnPosicion: 10@5 conExtencion: 3@2.
	unPintor pintar: unaPintura enPared: unaPared.
	otraPintura := Pintura new inicializarEnPosicion: 10@5 conExtencion: 3@2.
	
	self should: [unPintor pintar: otraPintura enPared: unaPared.]
	raise: Error 
	withExceptionDo: [ :error | error messageText = Pared posicionOcupadaError.].
	
	self assert: (unaPared incluyePintura: unaPintura).
	self deny: (unaPared incluyePintura: otraPintura).
	
	! !
