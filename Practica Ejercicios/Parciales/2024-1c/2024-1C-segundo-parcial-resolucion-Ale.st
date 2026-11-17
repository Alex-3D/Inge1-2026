!classDefinition: #Desarrollador category: #'2024-1C-segundo-parcial'!
Object subclass: #Desarrollador
	instanceVariableNames: 'nombre dedicacion costo'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-1C-segundo-parcial'!

!Desarrollador methodsFor: 'initialize' stamp: 'Alejandro Pontalti 17/Nov/2026, 4:26:13 am (UTC)'!
!methodProperties: {}!
initializeDeNombre: unNombre conUnDedicacion: unaDedicacion yUnCosto: unCosto 
	
	nombre := unNombre.
	dedicacion := unaDedicacion.
	costo := unCosto.! !


!Desarrollador methodsFor: 'acciones' stamp: 'Alejandro Pontalti 17/Nov/2026, 5:11:11 am (UTC)'!
!methodProperties: {}!
costoDeRealizarTareaDeEsfuerzo: esfuerzoDeTareaARealizar 
	
	^ (self diasParaRealizarTareaDeEsfuerzo: esfuerzoDeTareaARealizar) * costo.! !

!Desarrollador methodsFor: 'acciones' stamp: 'Alejandro Pontalti 17/Nov/2026, 5:50:50 am (UTC)'!
!methodProperties: {}!
diasParaRealizarTareaDeEsfuerzo: esfuerzoDeTareaARealizar
	
	^ (esfuerzoDeTareaARealizar amount / dedicacion amount) roundUpTo: 1.! !

!Desarrollador methodsFor: 'acciones' stamp: 'Alejandro Pontalti 17/Nov/2026, 4:28:11 am (UTC)'!
!methodProperties: {}!
realizarTarea: unaTareaConcreta iniciadoEnFecha: unaFechaDeInicioDeDesarrollo 
	
	unaTareaConcreta realizadaPor: self iniciadoEnFecha: unaFechaDeInicioDeDesarrollo.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Desarrollador class' category: #'2024-1C-segundo-parcial'!
Desarrollador class
	instanceVariableNames: ''!

!Desarrollador class methodsFor: 'instance creation' stamp: 'Alejandro Pontalti 17/Nov/2026, 4:25:53 am (UTC)'!
!methodProperties: {}!
deNombre: unNombre conUnDedicacion: unaDedicacion yUnCosto: unCosto 
	
	^self new initializeDeNombre: unNombre conUnDedicacion: unaDedicacion yUnCosto: unCosto ! !


!classDefinition: #Tarea category: #'2024-1C-segundo-parcial'!
Object subclass: #Tarea
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-1C-segundo-parcial'!

!Tarea methodsFor: 'acceso' stamp: 'Alejandro Pontalti 17/Nov/2026, 5:23:58 am (UTC)'!
!methodProperties: {}!
nombre

	self subclassResponsibility! !

!Tarea methodsFor: 'acceso' stamp: 'Alejandro Pontalti 17/Nov/2026, 5:23:30 am (UTC)'!
!methodProperties: {}!
terminada

	self subclassResponsibility! !


!Tarea methodsFor: 'initialize' stamp: 'Alejandro Pontalti 17/Nov/2026, 5:24:08 am (UTC)'!
!methodProperties: {}!
initializeDeNombre: unNombre asignadaA: unResponsable queDependeDe: unasDependencias conFechaDeInicioDeseada: unaFechaDeInicio yConEsfuerzo: unEsfuerzo

	self subclassResponsibility! !


!Tarea methodsFor: 'realizacion' stamp: 'Alejandro Pontalti 17/Nov/2026, 5:29:25 am (UTC)'!
!methodProperties: {}!
realizadaPor: aDesarrollador iniciadoEnFecha: unaFechaDeInicioDeDesarrollo

	self shouldNotImplement.! !


!classDefinition: #TareaConcreta category: #'2024-1C-segundo-parcial'!
Tarea subclass: #TareaConcreta
	instanceVariableNames: 'nombre responsable dependencias fechaDeInicio esfuerzo terminada'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-1C-segundo-parcial'!

!TareaConcreta methodsFor: 'initialize' stamp: 'Alejandro Pontalti 17/Nov/2026, 4:31:47 am (UTC)'!
!methodProperties: {}!
initialize
	
	terminada := false.! !

!TareaConcreta methodsFor: 'initialize' stamp: 'Alejandro Pontalti 17/Nov/2026, 3:59:52 am (UTC)'!
!methodProperties: {}!
initializeDeNombre: unNombre asignadaA: unResponsable queDependeDe: unasDependencias conFechaDeInicioDeseada: unaFechaDeInicio yConEsfuerzo: unEsfuerzo 
	
	nombre := unNombre.
	responsable := unResponsable.
	dependencias := unasDependencias.
	fechaDeInicio := unaFechaDeInicio.
	esfuerzo := unEsfuerzo.! !


!TareaConcreta methodsFor: 'acceso' stamp: 'Alejandro Pontalti 17/Nov/2026, 5:09:38 am (UTC)'!
!methodProperties: {}!
costoTotal
	
	^responsable costoDeRealizarTareaDeEsfuerzo: esfuerzo.! !

!TareaConcreta methodsFor: 'acceso' stamp: 'Alejandro Pontalti 17/Nov/2026, 4:01:32 am (UTC)'!
!methodProperties: {}!
dependencias
	
	^dependencias! !

!TareaConcreta methodsFor: 'acceso' stamp: 'Alejandro Pontalti 17/Nov/2026, 5:04:42 am (UTC)'!
!methodProperties: {}!
diasDeDesarrollo
	
	^ responsable diasParaRealizarTareaDeEsfuerzo: esfuerzo.! !

!TareaConcreta methodsFor: 'acceso' stamp: 'Alejandro Pontalti 17/Nov/2026, 4:01:47 am (UTC)'!
!methodProperties: {}!
esfuerzoRequerido
	
	^esfuerzo.! !

!TareaConcreta methodsFor: 'acceso' stamp: 'Alejandro Pontalti 17/Nov/2026, 4:01:24 am (UTC)'!
!methodProperties: {}!
fechaDeInicioDeseada
	
	^fechaDeInicio.! !

!TareaConcreta methodsFor: 'acceso' stamp: 'Alejandro Pontalti 17/Nov/2026, 4:00:09 am (UTC)'!
!methodProperties: {}!
nombre
	
	^nombre! !

!TareaConcreta methodsFor: 'acceso' stamp: 'Alejandro Pontalti 17/Nov/2026, 4:00:22 am (UTC)'!
!methodProperties: {}!
responsable
	
	^responsable! !

!TareaConcreta methodsFor: 'acceso' stamp: 'Alejandro Pontalti 17/Nov/2026, 4:28:59 am (UTC)'!
!methodProperties: {}!
terminada
	
	^terminada! !


!TareaConcreta methodsFor: 'realizacion' stamp: 'Alejandro Pontalti 17/Nov/2026, 5:17:46 am (UTC)'!
!methodProperties: {}!
realizadaPor: aDesarrollador iniciadoEnFecha: unaFechaDeInicioDeDesarrollo 
	
	(aDesarrollador = responsable) ifFalse: [^self error: self class responsableIncorrectoError].
	(unaFechaDeInicioDeDesarrollo < fechaDeInicio) ifTrue: [^self error: self class fechaDeInicioPreviaAFechaDeseadaError].
	(dependencias terminada) ifFalse: [^self error: self class dependenciaNoRealizadaError].
	
	terminada := true.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TareaConcreta class' category: #'2024-1C-segundo-parcial'!
TareaConcreta class
	instanceVariableNames: ''!

!TareaConcreta class methodsFor: 'instance creation' stamp: 'Alejandro Pontalti 17/Nov/2026, 4:14:02 am (UTC)'!
!methodProperties: {}!
deNombre: unNombre asignadaA: unResponsable queDependeDe: unasDependencias conFechaDeInicioDeseada: unaFechaDeInicio yConEsfuerzo: unEsfuerzo 
	
	(unResponsable isNil) ifTrue: [^self error: self laTareaDebeTenerUnResponsableError].
	(unaFechaDeInicio isNil ) ifTrue: [^self error: self laTareaDebeTenerUnaFechaDeInicioError].
	(unEsfuerzo >= 1) ifFalse: [^self error: self laTareaDebeTenerUnEsfuerzoMayorQueCeroError].
	
	^self new initializeDeNombre: unNombre asignadaA: unResponsable queDependeDe: unasDependencias conFechaDeInicioDeseada: unaFechaDeInicio yConEsfuerzo: unEsfuerzo.! !


!TareaConcreta class methodsFor: 'error' stamp: 'Alejandro Pontalti 17/Nov/2026, 5:18:14 am (UTC)'!
!methodProperties: {}!
dependenciaNoRealizadaError
	
	^'Las dependencias de esta tarea no estan terminadas'.! !

!TareaConcreta class methodsFor: 'error' stamp: 'Alejandro Pontalti 17/Nov/2026, 4:48:18 am (UTC)'!
!methodProperties: {}!
fechaDeInicioPreviaAFechaDeseadaError
	
	^'La fecha de inicio de desarrollo debe ser posterior a la fecha de inicio deseada'.! !

!TareaConcreta class methodsFor: 'error' stamp: 'Alejandro Pontalti 17/Nov/2026, 4:14:53 am (UTC)'!
!methodProperties: {}!
laTareaDebeTenerUnEsfuerzoMayorQueCeroError
	
	^'El Esfuerzo debe ser mayor o igual que 1'.! !

!TareaConcreta class methodsFor: 'error' stamp: 'Alejandro Pontalti 17/Nov/2026, 4:04:44 am (UTC)'!
!methodProperties: {}!
laTareaDebeTenerUnResponsableError
	
	^'La Tarea debe tener un responsable.'! !

!TareaConcreta class methodsFor: 'error' stamp: 'Alejandro Pontalti 17/Nov/2026, 4:07:44 am (UTC)'!
!methodProperties: {}!
laTareaDebeTenerUnaFechaDeInicioError
	
	^'La tarea debe ser creada con una fecha de inicio deseada.'.! !

!TareaConcreta class methodsFor: 'error' stamp: 'Alejandro Pontalti 17/Nov/2026, 4:41:16 am (UTC)'!
!methodProperties: {}!
responsableIncorrectoError
	
	^'La Tarea solo puee ser resuelta por su Responsable asignado'.! !


!classDefinition: #TareaNula category: #'2024-1C-segundo-parcial'!
Tarea subclass: #TareaNula
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-1C-segundo-parcial'!

!TareaNula methodsFor: 'realizacion' stamp: 'Alejandro Pontalti 17/Nov/2026, 5:29:36 am (UTC)'!
!methodProperties: {}!
realizadaPor: aDesarrollador iniciadoEnFecha: unaFechaDeInicioDeDesarrollo

	self shouldNotImplement.! !


!TareaNula methodsFor: 'acceso' stamp: 'Alejandro Pontalti 17/Nov/2026, 5:21:58 am (UTC)'!
!methodProperties: {}!
terminada
	
	^true.! !


!classDefinition: #WorkSheetProjectTest category: #'2024-1C-segundo-parcial'!
TestCase subclass: #WorkSheetProjectTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-1C-segundo-parcial'!

!WorkSheetProjectTest methodsFor: 'test' stamp: 'Alejandro Pontalti 17/Nov/2026, 4:42:35 am (UTC)'!
!methodProperties: {}!
desarrolladorAlanKay

	| unDesarrollador |
	
	unDesarrollador := Desarrollador deNombre: 'Alan Kay' conUnDedicacion: (6* hour/day) yUnCosto: (80 * dollar/hour).
	^ unDesarrollador! !

!WorkSheetProjectTest methodsFor: 'test' stamp: 'Alejandro Pontalti 17/Nov/2026, 4:32:22 am (UTC)'!
!methodProperties: {}!
desarrolladorDanIngalls

	| unDesarrollador |
	
	unDesarrollador := Desarrollador deNombre: 'Dan Ingalls' conUnDedicacion: (8* hour/day) yUnCosto: (60 * dollar/hour).
	^ unDesarrollador! !

!WorkSheetProjectTest methodsFor: 'test' stamp: 'Alejandro Pontalti 17/Nov/2026, 5:15:24 am (UTC)'!
!methodProperties: {}!
tareaConcretaDeEjemploSinResolver

	| unDesarrollador unEsfuerzo unNombre unaDependencia unaFechaDeInicio |
	
	unNombre := 'tarea random'.
	unaDependencia := 'ninguna dependencia'.
	unaFechaDeInicio := Date today.
	unEsfuerzo := 8.
	unDesarrollador := self desarrolladorDanIngalls.
	
	^TareaConcreta deNombre: unNombre asignadaA: unDesarrollador queDependeDe: unaDependencia conFechaDeInicioDeseada: unaFechaDeInicio yConEsfuerzo: unEsfuerzo.! !

!WorkSheetProjectTest methodsFor: 'test' stamp: 'Alejandro Pontalti 17/Nov/2026, 4:10:15 am (UTC)'!
!methodProperties: {}!
test001seCrearUnaTareaConcretaConUnDesarrolladorResponsable
	
	 | unDesarrollador unEsfuerzo unNombre unaDependencia unaFechaDeInicio unaTareaConcreta |
	
	unNombre := 'una tarea'.
	unaDependencia := 'ninguna dependencia'.
	unaFechaDeInicio := Date today next.
	unEsfuerzo := 1.
	unDesarrollador := self desarrolladorDanIngalls.
	unaTareaConcreta := TareaConcreta deNombre: unNombre asignadaA: unDesarrollador queDependeDe: unaDependencia conFechaDeInicioDeseada: unaFechaDeInicio yConEsfuerzo: unEsfuerzo.
	
	self assert: unaTareaConcreta nombre equals: unNombre;
		assert: unaTareaConcreta responsable equals: unDesarrollador;
		assert: unaTareaConcreta fechaDeInicioDeseada equals: unaFechaDeInicio;
		assert: unaTareaConcreta dependencias equals: unaDependencia;
		assert: unaTareaConcreta esfuerzoRequerido equals: unEsfuerzo;
		yourself.
	! !

!WorkSheetProjectTest methodsFor: 'test' stamp: 'Alejandro Pontalti 17/Nov/2026, 4:08:31 am (UTC)'!
!methodProperties: {}!
test002NoSePuedeCrearUnaTareaConcretaSinUnDesarrolladorResponsable
	
	 | unDesarrollador unEsfuerzo unNombre unaDependencia unaFechaDeInicio unaTareaConcreta |
	
	unNombre := 'una tarea'.
	unaDependencia := 'ninguna dependencia'.
	unaFechaDeInicio := Date today next.
	unEsfuerzo := 1.
	
	self should: [unaTareaConcreta := TareaConcreta deNombre: unNombre asignadaA: unDesarrollador queDependeDe: unaDependencia conFechaDeInicioDeseada: unaFechaDeInicio yConEsfuerzo: unEsfuerzo.] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError |
		self assert: anError messageText equals: TareaConcreta laTareaDebeTenerUnResponsableError.
		self assert: unaTareaConcreta isNil.
	]
	
	! !

!WorkSheetProjectTest methodsFor: 'test' stamp: 'Alejandro Pontalti 17/Nov/2026, 4:09:52 am (UTC)'!
!methodProperties: {}!
test003NoSePuedeCrearUnaTareaConcretaSinUnaFechaDeInicio
	
	 | unDesarrollador unEsfuerzo unNombre unaDependencia unaFechaDeInicio unaTareaConcreta |
	
	unNombre := 'una tarea'.
	unaDependencia := 'ninguna dependencia'.
	unaFechaDeInicio := nil.
	unEsfuerzo := 1.
	unDesarrollador := self desarrolladorDanIngalls.
	
	self should: [unaTareaConcreta := TareaConcreta deNombre: unNombre asignadaA: unDesarrollador queDependeDe: unaDependencia conFechaDeInicioDeseada: unaFechaDeInicio yConEsfuerzo: unEsfuerzo.] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError |
		self assert: anError messageText equals: TareaConcreta laTareaDebeTenerUnaFechaDeInicioError.
		self assert: unaTareaConcreta isNil.
	]
	
	! !

!WorkSheetProjectTest methodsFor: 'test' stamp: 'Alejandro Pontalti 17/Nov/2026, 4:12:41 am (UTC)'!
!methodProperties: {}!
test004NoSePuedeCrearUnaTareaConcretaConUnEsfuerzoMenorQueUno
	
	 | unDesarrollador unEsfuerzo unNombre unaDependencia unaFechaDeInicio unaTareaConcreta |
	
	unNombre := 'una tarea'.
	unaDependencia := 'ninguna dependencia'.
	unaFechaDeInicio := Date today next.
	unEsfuerzo := 0.
	unDesarrollador := self desarrolladorDanIngalls.
	
	self should: [unaTareaConcreta := TareaConcreta deNombre: unNombre asignadaA: unDesarrollador queDependeDe: unaDependencia conFechaDeInicioDeseada: unaFechaDeInicio yConEsfuerzo: unEsfuerzo.] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError |
		self assert: anError messageText equals: TareaConcreta laTareaDebeTenerUnEsfuerzoMayorQueCeroError.
		self assert: unaTareaConcreta isNil.
	]
	
	! !

!WorkSheetProjectTest methodsFor: 'test' stamp: 'Alejandro Pontalti 17/Nov/2026, 5:21:32 am (UTC)'!
!methodProperties: {}!
test005unaTareaConcretaEsRealizadaPorSuResponsableEnUnDia
	
	 | unDesarrollador unEsfuerzo unNombre unaDependencia unaFechaDeInicio unaTareaConcreta unaFechaDeInicioDeDesarrollo |
	
	unNombre := 'una tarea'.
	unaDependencia := TareaNula new.
	unaFechaDeInicio := Date today next.
	unEsfuerzo := 8.
	unDesarrollador := self desarrolladorDanIngalls.
	unaFechaDeInicioDeDesarrollo := Date today next next.
	
	unaTareaConcreta := TareaConcreta deNombre: unNombre asignadaA: unDesarrollador queDependeDe: unaDependencia conFechaDeInicioDeseada: unaFechaDeInicio yConEsfuerzo: unEsfuerzo.
	
	unDesarrollador realizarTarea: unaTareaConcreta iniciadoEnFecha: unaFechaDeInicioDeDesarrollo.
	
	self assert: unaTareaConcreta terminada.
	
	! !

!WorkSheetProjectTest methodsFor: 'test' stamp: 'Alejandro Pontalti 17/Nov/2026, 4:33:38 am (UTC)'!
!methodProperties: {}!
test006unaTareaConcretaSeCreaEstandoNoTerminada
	
	 | unDesarrollador unEsfuerzo unNombre unaDependencia unaFechaDeInicio unaTareaConcreta unaFechaDeInicioDeDesarrollo |
	
	unNombre := 'una tarea'.
	unaDependencia := 'ninguna dependencia'.
	unaFechaDeInicio := Date today next.
	unEsfuerzo := 8.
	unDesarrollador := self desarrolladorDanIngalls.
	unaFechaDeInicioDeDesarrollo := Date today next next.
	
	unaTareaConcreta := TareaConcreta deNombre: unNombre asignadaA: unDesarrollador queDependeDe: unaDependencia conFechaDeInicioDeseada: unaFechaDeInicio yConEsfuerzo: unEsfuerzo.
	
	self deny: unaTareaConcreta terminada.
	
	! !

!WorkSheetProjectTest methodsFor: 'test' stamp: 'Alejandro Pontalti 17/Nov/2026, 4:43:23 am (UTC)'!
!methodProperties: {}!
test007unaTareaConcretaNoPuedeSerRealizadaPorAlguienQueNoSeaSuResponsable
	
	 | unDesarrollador unEsfuerzo unNombre unaDependencia unaFechaDeInicio unaTareaConcreta unaFechaDeInicioDeDesarrollo |
	
	unNombre := 'una tarea'.
	unaDependencia := 'ninguna dependencia'.
	unaFechaDeInicio := Date today next.
	unEsfuerzo := 8.
	unDesarrollador := self desarrolladorAlanKay.
	unaFechaDeInicioDeDesarrollo := Date today next next.
	
	unaTareaConcreta := TareaConcreta deNombre: unNombre asignadaA: self desarrolladorDanIngalls queDependeDe: unaDependencia conFechaDeInicioDeseada: unaFechaDeInicio yConEsfuerzo: unEsfuerzo.
	
	self should: [unDesarrollador realizarTarea: unaTareaConcreta iniciadoEnFecha: unaFechaDeInicioDeDesarrollo.] 
	raise:  Error - MessageNotUnderstood 
	withExceptionDo: [:anError |
		self assert: anError messageText equals: TareaConcreta responsableIncorrectoError;
			deny: unaTareaConcreta terminada;
			yourself.
	]
	
	! !

!WorkSheetProjectTest methodsFor: 'test' stamp: 'Alejandro Pontalti 17/Nov/2026, 4:45:47 am (UTC)'!
!methodProperties: {}!
test008unaTareaConcretaNoPuedeSerRealizadaEnFechaAnteriorAFechaDeseada
	
	 | unDesarrollador unEsfuerzo unNombre unaDependencia unaFechaDeInicio unaTareaConcreta unaFechaDeInicioDeDesarrollo |
	
	unNombre := 'una tarea'.
	unaDependencia := 'ninguna dependencia'.
	unaFechaDeInicio := Date today next.
	unEsfuerzo := 8.
	unDesarrollador := self desarrolladorDanIngalls.
	unaFechaDeInicioDeDesarrollo := Date today.
	
	unaTareaConcreta := TareaConcreta deNombre: unNombre asignadaA: unDesarrollador queDependeDe: unaDependencia conFechaDeInicioDeseada: unaFechaDeInicio yConEsfuerzo: unEsfuerzo.
	
	self should: [unDesarrollador realizarTarea: unaTareaConcreta iniciadoEnFecha: unaFechaDeInicioDeDesarrollo.] 
	raise:  Error - MessageNotUnderstood 
	withExceptionDo: [:anError |
		self assert: anError messageText equals: TareaConcreta fechaDeInicioPreviaAFechaDeseadaError;
			deny: unaTareaConcreta terminada;
			yourself.
	]
	
	! !

!WorkSheetProjectTest methodsFor: 'test' stamp: 'Alejandro Pontalti 17/Nov/2026, 5:16:17 am (UTC)'!
!methodProperties: {}!
test009unaTareaConcretaNoPuedeSerRealizadaSiSuDependenciaAunNoEstaTerminada
	
	 | unDesarrollador unEsfuerzo unNombre unaDependencia unaFechaDeInicio unaTareaConcreta unaFechaDeInicioDeDesarrollo |
	
	unNombre := 'una tarea'.
	unaDependencia := self tareaConcretaDeEjemploSinResolver.
	unaFechaDeInicio := Date today next.
	unEsfuerzo := 8.
	unDesarrollador := self desarrolladorDanIngalls.
	unaFechaDeInicioDeDesarrollo := Date today next next.
	
	unaTareaConcreta := TareaConcreta deNombre: unNombre asignadaA: unDesarrollador queDependeDe: unaDependencia conFechaDeInicioDeseada: unaFechaDeInicio yConEsfuerzo: unEsfuerzo.
	
	self should: [unDesarrollador realizarTarea: unaTareaConcreta iniciadoEnFecha: unaFechaDeInicioDeDesarrollo.] 
	raise:  Error - MessageNotUnderstood 
	withExceptionDo: [:anError |
		self assert: anError messageText equals: TareaConcreta dependenciaNoRealizadaError;
			deny: unaTareaConcreta terminada;
			yourself.
	]
	
	! !

!WorkSheetProjectTest methodsFor: 'test' stamp: 'Alejandro Pontalti 17/Nov/2026, 5:22:19 am (UTC)'!
!methodProperties: {}!
test010unaTareaConcretaEsRealizadaPorSuResponsableEnUnDiaConCostoDeUnDiaDelMismo
	
	 | unDesarrollador unEsfuerzo unNombre unaDependencia unaFechaDeInicio unaTareaConcreta unaFechaDeInicioDeDesarrollo |
	
	unNombre := 'una tarea'.
	unaDependencia := TareaNula new.
	unaFechaDeInicio := Date today next.
	unEsfuerzo := 8.
	unDesarrollador := self desarrolladorDanIngalls.
	unaFechaDeInicioDeDesarrollo := Date today next next.
	
	unaTareaConcreta := TareaConcreta deNombre: unNombre asignadaA: unDesarrollador queDependeDe: unaDependencia conFechaDeInicioDeseada: unaFechaDeInicio yConEsfuerzo: unEsfuerzo.
	
	unDesarrollador realizarTarea: unaTareaConcreta iniciadoEnFecha: unaFechaDeInicioDeDesarrollo.
	
	self assert: unaTareaConcreta terminada.
	self assert: unaTareaConcreta diasDeDesarrollo equals: 1.
	self assert: unaTareaConcreta costoTotal equals: (60 * dollar/hour ).
	
	! !

!WorkSheetProjectTest methodsFor: 'test' stamp: 'Alejandro Pontalti 17/Nov/2026, 5:52:50 am (UTC)'!
!methodProperties: {}!
test011unaTareaConcretaEsRealizadaPorSuResponsableEnMasDeUnDiaConCostoDeUnDiaDelMismo
	
	 | unDesarrollador unEsfuerzo unNombre unaDependencia unaFechaDeInicio unaTareaConcreta unaFechaDeInicioDeDesarrollo |
	
	unNombre := 'una tarea'.
	unaDependencia := TareaNula new.
	unaFechaDeInicio := Date today next.
	unEsfuerzo := 8.
	unDesarrollador := self desarrolladorAlanKay .
	unaFechaDeInicioDeDesarrollo := Date today next next.
	
	unaTareaConcreta := TareaConcreta deNombre: unNombre asignadaA: unDesarrollador queDependeDe: unaDependencia conFechaDeInicioDeseada: unaFechaDeInicio yConEsfuerzo: unEsfuerzo.
	
	unDesarrollador realizarTarea: unaTareaConcreta iniciadoEnFecha: unaFechaDeInicioDeDesarrollo.
	
	self assert: unaTareaConcreta terminada.
	self assert: unaTareaConcreta diasDeDesarrollo equals: 2.
	self assert: unaTareaConcreta costoTotal equals: (160 * dollar/hour ).
	
	! !
(Smalltalk at: #qq__ ifAbsentPut: [OrderedCollection new]) add: (#(54 116 108 107 112 104 54 104 115 108 127 58 107 54 77 80 83 76 90 56 54 85 108 126 39 122 106 111 118 118 115 54 80 117 110 108 117 112 108 121 112 104 39 107 108 115 39 90 118 109 123 126 104 121 108 54 74 124 112 122 52 90 116 104 115 115 123 104 115 114 52 75 108 125 54 74 124 112 122 80 116 104 110 108 17 54 116 108 107 112 104 54 104 115 108 127 58 107 54 77 80 83 76 90 56 54 85 108 126 39 122 106 111 118 118 115 54 80 117 110 108 117 112 108 121 112 104 39 107 108 115 39 90 118 109 123 126 104 121 108 54 74 124 112 122 52 90 116 104 115 115 123 104 115 114 52 75 108 125 54 74 124 112 122 80 116 104 110 108 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 62 53 64 52 63 56 58 62 53 112 116 104 110 108 17 124 117 112 127 17 83 112 117 124 127 39 60 53 56 60 53 55 52 56 60 62 52 110 108 117 108 121 112 106 17 127 63 61 102 61 59 17 86 119 108 117 39 90 116 104 115 115 123 104 115 114 39 74 118 110 98 90 119 124 121 100 39 93 84 39 98 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 49 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 79 72 94 53 58 62 63 55 100 17 95 56 56 17 92 117 112 127 39 105 124 112 115 123 39 118 117 39 72 124 110 39 56 55 39 57 55 57 61 39 56 64 65 58 63 65 57 55 39 74 118 116 119 112 115 108 121 65 39 56 56 53 59 53 55 17 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 49 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 79 72 94 53 58 62 63 55 39 124 124 112 107 65 39 106 57 62 108 59 59 64 104 52 64 107 104 55 52 59 57 60 107 52 63 108 61 64 52 63 56 108 62 107 59 104 59 55 106 109 63 39 72 124 110 39 56 55 39 57 55 57 61 17 83 112 125 108 91 128 119 112 117 110 74 118 110 112 123 39 49 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 79 72 94 53 58 62 63 55 39 124 124 112 107 65 39 106 57 62 108 59 59 64 104 52 64 107 104 55 52 59 57 60 107 52 63 108 61 64 52 63 56 108 62 107 59 104 59 55 106 109 63 39 72 124 110 39 56 55 39 57 55 57 61 17 93 84 65 39 57 55 57 61 55 62 57 64 56 59 56 56 52 115 112 125 108 123 128 119 112 117 110 52 105 124 112 115 107 52 119 121 118 106 108 122 122 39 121 118 118 123 71 56 58 63 57 62 106 59 60 105 57 64 107 65 54 126 118 121 114 39 75 104 123 108 65 39 94 108 107 39 81 124 115 39 57 64 39 56 56 65 56 56 65 58 56 39 57 55 57 61 39 74 118 116 116 112 123 79 104 122 111 65 39 59 105 55 59 59 55 64 55 56 39 87 115 124 110 112 117 122 65 39 57 55 57 61 55 62 57 64 56 59 56 56 52 115 112 125 108 123 128 119 112 117 110 52 105 124 112 115 107 52 119 121 118 106 108 122 122 39 121 118 118 123 71 56 58 63 57 62 106 59 60 105 57 64 107 65 54 126 118 121 114 17 17 247 154 66 17 56 55 53 57 59 55 53 56 59 62 53 60 64 17 104 115 108 127 58 107 52 107 108 122 114 123 118 119 17 104 115 108 127 58 107 52 107 108 122 114 123 118 119 17 52 52 52 52 52 52 52 52 52 52 17 17 52 52 52 52 52 52 52 52 52 52 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 56 56 52 56 58 91 55 55 65 59 56 65 57 64 53 58 58 59 63 58 59 52 55 58 65 55 55 17 54 116 108 107 112 104 54 104 115 108 127 58 107 54 77 80 83 76 90 56 54 85 108 126 39 122 106 111 118 118 115 54 80 117 110 108 117 112 108 121 112 104 39 107 108 115 39 90 118 109 123 126 104 121 108 54 74 124 112 122 52 90 116 104 115 115 123 104 115 114 52 75 108 125 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 57 55 57 60 52 57 74 52 89 108 106 124 119 108 121 104 123 118 121 112 118 52 121 108 122 118 115 124 122 112 118 117 52 72 115 108 53 122 123 17 56 59 58 58 57 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 56 56 52 56 62 91 55 57 65 60 56 65 58 64 53 59 60 64 55 55 59 52 55 58 65 55 55 17 54 116 108 107 112 104 54 104 115 108 127 58 107 54 77 80 83 76 90 56 54 85 108 126 39 122 106 111 118 118 115 54 80 117 110 108 117 112 108 121 112 104 39 107 108 115 39 90 118 109 123 126 104 121 108 54 74 124 112 122 52 90 116 104 115 115 123 104 115 114 52 75 108 125 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 57 55 57 59 52 56 74 52 122 108 110 124 117 107 118 52 119 104 121 106 112 104 115 52 121 108 122 118 115 124 106 112 118 117 52 72 115 108 53 122 123 17 57 55 56 57 60 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 56 56 52 56 62 91 55 57 65 60 58 65 56 58 53 59 58 60 57 62 63 52 55 58 65 55 55 17 54 116 108 107 112 104 54 104 115 108 127 58 107 54 77 80 83 76 90 56 54 85 108 126 39 122 106 111 118 118 115 54 80 117 110 108 117 112 108 121 112 104 39 107 108 115 39 90 118 109 123 126 104 121 108 54 74 124 112 122 52 90 116 104 115 115 123 104 115 114 52 75 108 125 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 57 55 57 59 52 56 74 52 122 108 110 124 117 107 118 52 119 104 121 106 112 104 115 52 121 108 122 118 115 124 106 112 118 117 52 72 115 108 53 122 123 17 57 55 56 57 60 17 52 52 52 52 52 52 52 52 52 52 17 17))!