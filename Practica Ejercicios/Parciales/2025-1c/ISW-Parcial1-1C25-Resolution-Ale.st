!classDefinition: #EscapeDeFlota category: #'ISW-Parcial1-1C25'!
Object subclass: #EscapeDeFlota
	instanceVariableNames: 'flota navesDestruidas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW-Parcial1-1C25'!

!EscapeDeFlota methodsFor: 'acciones' stamp: 'asd 22/Sep/2026, 2:49:33 am (UTC)'!
!methodProperties: {}!
atravesar: unaTrayectoria

	self class validarNoVacioYSinRepetidos: unaTrayectoria conErrorVacio: self class rutaVaciaDescripcionDeError yErrorRepetidos: self class sectoresRepetidosDescripcionDeError.

	flota do: [
		:nave |
		nave deFlota: self atravesar: unaTrayectoria.
	].! !

!EscapeDeFlota methodsFor: 'acciones' stamp: 'asd 21/Sep/2026, 11:39:04 pm (UTC)'!
!methodProperties: {}!
enrolar: navesAEnrolar

	flota := navesAEnrolar.! !


!EscapeDeFlota methodsFor: 'privado' stamp: 'asd 22/Sep/2026, 2:26:47 am (UTC)'!
!methodProperties: {}!
agregarNaveDestruida: unaNave

	navesDestruidas add: unaNave.! !


!EscapeDeFlota methodsFor: 'acceso' stamp: 'asd 22/Sep/2026, 3:46:43 am (UTC)'!
!methodProperties: {}!
haSobrevivido: unaNave

	^(navesDestruidas select: [:otraNave| unaNave = otraNave] ) size = 0! !

!EscapeDeFlota methodsFor: 'acceso' stamp: 'asd 22/Sep/2026, 2:30:59 am (UTC)'!
!methodProperties: {}!
numeroDeSobrevivientesEs: unNumero

	^(flota size - navesDestruidas size) = unNumero.! !


!EscapeDeFlota methodsFor: 'creacion' stamp: 'asd 22/Sep/2026, 3:08:34 am (UTC)'!
!methodProperties: {}!
initialize

	navesDestruidas := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EscapeDeFlota class' category: #'ISW-Parcial1-1C25'!
EscapeDeFlota class
	instanceVariableNames: ''!

!EscapeDeFlota class methodsFor: 'creacion' stamp: 'asd 22/Sep/2026, 12:10:01 am (UTC)'!
!methodProperties: {}!
enrolar: navesAEnrolar
	
	self validarFlota: navesAEnrolar.
	
	^self new enrolar: navesAEnrolar.! !


!EscapeDeFlota class methodsFor: 'validacion' stamp: 'asd 22/Sep/2026, 2:49:33 am (UTC)'!
!methodProperties: {}!
validarFlota: navesAEnrolar

	"navesAEnrolar isEmpty ifTrue: [^self error: self flotaSinNavesDescripcionDeError. ].
	navesAEnrolar do:[
		:unaNave| (navesAEnrolar select: [
			:otraNave| unaNave = otraNave.
		]) size > 1 ifTrue: [^self error: self todasLasNavesDebenSerDiferentesDescripcionDeError ].	
	]."

	self validarNoVacioYSinRepetidos: navesAEnrolar conErrorVacio: self flotaSinNavesDescripcionDeError yErrorRepetidos: self todasLasNavesDebenSerDiferentesDescripcionDeError.! !

!EscapeDeFlota class methodsFor: 'validacion' stamp: 'asd 22/Sep/2026, 2:49:33 am (UTC)'!
!methodProperties: {}!
validarNoVacioYSinRepetidos: unaLista conErrorVacio: errorVacio yErrorRepetidos: ErrorRepetidos

	unaLista isEmpty ifTrue: [^self error: errorVacio. ].
	unaLista do:[
		:unElemento| (unaLista select: [
			:otraElemento| unElemento = otraElemento.
		]) size > 1 ifTrue: [^self error: ErrorRepetidos ].	
	].! !


!EscapeDeFlota class methodsFor: 'message error' stamp: 'NR 28/Sep/2025, 3:38:12 am (UTC)'!
!methodProperties: {}!
flotaSinNavesDescripcionDeError

	^ 'La flota no puede estar vacia'! !

!EscapeDeFlota class methodsFor: 'message error' stamp: 'NR 28/Sep/2025, 3:38:25 am (UTC)'!
!methodProperties: {}!
rutaVaciaDescripcionDeError

	^ 'La ruta no puede ser vacia'! !

!EscapeDeFlota class methodsFor: 'message error' stamp: 'NR 28/Sep/2025, 3:40:29 am (UTC)'!
!methodProperties: {}!
sectoresRepetidosDescripcionDeError

	^ 'La ruta no puede tener sectores repetidos'! !

!EscapeDeFlota class methodsFor: 'message error' stamp: 'NR 28/Sep/2025, 3:38:52 am (UTC)'!
!methodProperties: {}!
todasLasNavesDebenSerDiferentesDescripcionDeError

	^ 'Todas las naves de la flota deben ser unicas'! !


!classDefinition: #EstadoCasco category: #'ISW-Parcial1-1C25'!
Object subclass: #EstadoCasco
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW-Parcial1-1C25'!

!EstadoCasco methodsFor: 'acceso' stamp: 'asd 22/Sep/2026, 12:33:54 am (UTC)'!
!methodProperties: {}!
dañado

	self subclassResponsibility! !

!EstadoCasco methodsFor: 'acceso' stamp: 'asd 22/Sep/2026, 12:33:48 am (UTC)'!
!methodProperties: {}!
destruido

	self subclassResponsibility! !


!classDefinition: #Destruido category: #'ISW-Parcial1-1C25'!
EstadoCasco subclass: #Destruido
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW-Parcial1-1C25'!

!Destruido methodsFor: 'acceso' stamp: 'asd 22/Sep/2026, 3:45:12 am (UTC)'!
!methodProperties: {}!
comoLlegoLaNave: nave

	nave fuyDestruido.! !

!Destruido methodsFor: 'acceso' stamp: 'asd 22/Sep/2026, 2:27:57 am (UTC)'!
!methodProperties: {}!
continuarEnTrayectoria: trayectoria enNave: nave

	nave fuyDestruido.! !

!Destruido methodsFor: 'acceso' stamp: 'asd 22/Sep/2026, 1:07:53 am (UTC)'!
!methodProperties: {}!
dañado

	^true.! !

!Destruido methodsFor: 'acceso' stamp: 'asd 22/Sep/2026, 2:53:02 am (UTC)'!
!methodProperties: {}!
destruido

	^true.! !


!classDefinition: #Impecable category: #'ISW-Parcial1-1C25'!
EstadoCasco subclass: #Impecable
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW-Parcial1-1C25'!

!Impecable methodsFor: 'acceso' stamp: 'asd 22/Sep/2026, 3:37:19 am (UTC)'!
!methodProperties: {}!
comoLlegoLaNave: nave

	"siga siga..."
	! !

!Impecable methodsFor: 'acceso' stamp: 'asd 22/Sep/2026, 1:53:31 am (UTC)'!
!methodProperties: {}!
continuarConSector: sector enNave: nave

	nave continuarTrayectoriaEnSector: sector.! !

!Impecable methodsFor: 'acceso' stamp: 'asd 22/Sep/2026, 3:49:10 am (UTC)'!
!methodProperties: {}!
dañado

	^false.! !

!Impecable methodsFor: 'acceso' stamp: 'asd 22/Sep/2026, 1:07:44 am (UTC)'!
!methodProperties: {}!
destruido

	^false.! !


!classDefinition: #Impulsor category: #'ISW-Parcial1-1C25'!
Object subclass: #Impulsor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW-Parcial1-1C25'!

!Impulsor methodsFor: 'acciones' stamp: 'asd 22/Sep/2026, 2:17:51 am (UTC)'!
!methodProperties: {}!
atravesaSector: sector enNave: nave

	self subclassResponsibility! !


!classDefinition: #Graviton category: #'ISW-Parcial1-1C25'!
Impulsor subclass: #Graviton
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW-Parcial1-1C25'!

!Graviton methodsFor: 'acciones' stamp: 'asd 22/Sep/2026, 3:59:35 am (UTC)'!
!methodProperties: {}!
atravesaSector: sector enNave: nave

	sector atravesandoEnGravitonConNave: nave.! !


!classDefinition: #ImpulsoEstandart category: #'ISW-Parcial1-1C25'!
Impulsor subclass: #ImpulsoEstandart
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW-Parcial1-1C25'!

!ImpulsoEstandart methodsFor: 'acciones' stamp: 'asd 22/Sep/2026, 2:17:37 am (UTC)'!
!methodProperties: {}!
atravesaSector: sector enNave: nave

	sector atravesandoEnImpulsoConNave: nave.! !


!classDefinition: #Warp category: #'ISW-Parcial1-1C25'!
Impulsor subclass: #Warp
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW-Parcial1-1C25'!

!Warp methodsFor: 'acciones' stamp: 'asd 22/Sep/2026, 3:54:01 am (UTC)'!
!methodProperties: {}!
atravesaSector: sector enNave: nave

	sector atravesandoEnWarpConNave: nave.! !


!classDefinition: #Nave category: #'ISW-Parcial1-1C25'!
Object subclass: #Nave
	instanceVariableNames: 'impulsor escudos maniobrabilidad combustible maximoNivelDeDañoCasco estadoCasco flota nivelDeDaño'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW-Parcial1-1C25'!

!Nave methodsFor: 'acciones' stamp: 'asd 22/Sep/2026, 1:25:55 am (UTC)'!
!methodProperties: {}!
continuarTrayectoriaEnSector: sector

	impulsor atravesaSector: sector enNave: self.! !

!Nave methodsFor: 'acciones' stamp: 'asd 22/Sep/2026, 4:29:11 am (UTC)'!
!methodProperties: {}!
cruzandoConRadiacion: nivelRadiacion conGravedad: nivelGravedad ygastoDeCombustible: cantidadCombustibleGastado  

	combustible := combustible - cantidadCombustibleGastado.
	
	(maniobrabilidad < nivelGravedad ) ifTrue: [nivelDeDaño := nivelDeDaño +1].
	(escudos < nivelRadiacion ) ifTrue: [nivelDeDaño := nivelDeDaño +1].
	
	(combustible < 0) ifTrue: [
		combustible := 0.
		estadoCasco := Destruido new.
	] ifFalse: [
			(maximoNivelDeDañoCasco < nivelDeDaño) ifTrue: [
			estadoCasco := Destruido new.
		].
	]! !

!Nave methodsFor: 'acciones' stamp: 'asd 22/Sep/2026, 3:38:28 am (UTC)'!
!methodProperties: {}!
deFlota: unaFlota atravesar: unaTrayectoria

	|trayectoriaEnCurso|
	flota := unaFlota .
	trayectoriaEnCurso := OrderedCollection newFrom: unaTrayectoria.
	"trayectoriaEnCurso do: [:sector | ^estadoCasco continuarConSector: sector enNave: self ]."
	
	[estadoCasco destruido or: (trayectoriaEnCurso isEmpty)] whileFalse: [
		|sectorActual|
		sectorActual := trayectoriaEnCurso removeFirst.
		estadoCasco continuarConSector: sectorActual enNave: self.
	].

	estadoCasco comoLlegoLaNave: self.! !

!Nave methodsFor: 'acciones' stamp: 'asd 22/Sep/2026, 2:26:40 am (UTC)'!
!methodProperties: {}!
fuyDestruido

	flota agregarNaveDestruida: self.! !

!Nave methodsFor: 'acciones' stamp: 'asd 22/Sep/2026, 4:12:49 am (UTC)'!
!methodProperties: {}!
penalidadEscudos: unaPenalidad

	escudos := escudos * unaPenalidad .! !

!Nave methodsFor: 'acciones' stamp: 'asd 22/Sep/2026, 4:13:45 am (UTC)'!
!methodProperties: {}!
penalidadManiobra: unaPenalidad

	maniobrabilidad := maniobrabilidad * unaPenalidad .! !

!Nave methodsFor: 'acciones' stamp: 'asd 22/Sep/2026, 4:17:12 am (UTC)'!
!methodProperties: {}!
reduccionDeEscudos: unNumero

	escudos := escudos - unNumero .! !


!Nave methodsFor: 'creacion' stamp: 'asd 22/Sep/2026, 3:51:28 am (UTC)'!
!methodProperties: {}!
crearNaveConManiobras: capacidadManiobrabilidad yEscudos: cantidadEscudos yCombustible: cantidadCombustible yCasco: recistenciaCasco conImpulsor: unImpulsor
	
	impulsor := unImpulsor .
	maniobrabilidad := capacidadManiobrabilidad .
	escudos := cantidadEscudos .
	combustible := cantidadCombustible .
	maximoNivelDeDañoCasco := recistenciaCasco.
	nivelDeDaño := 0.
	estadoCasco := Impecable new.
	! !


!Nave methodsFor: 'acceso' stamp: 'asd 22/Sep/2026, 1:43:06 am (UTC)'!
!methodProperties: {}!
cantidadCombustible

	^combustible .! !

!Nave methodsFor: 'acceso' stamp: 'asd 22/Sep/2026, 3:52:08 am (UTC)'!
!methodProperties: {}!
dañada

	^nivelDeDaño > 0.! !

!Nave methodsFor: 'acceso' stamp: 'asd 22/Sep/2026, 1:42:17 am (UTC)'!
!methodProperties: {}!
destruida

	^estadoCasco destruido.! !

!Nave methodsFor: 'acceso' stamp: 'asd 22/Sep/2026, 4:08:24 am (UTC)'!
!methodProperties: {}!
fuerzaDeEscudosEn: unNumero

	^(escudos = unNumero).! !

!Nave methodsFor: 'acceso' stamp: 'asd 22/Sep/2026, 3:51:13 am (UTC)'!
!methodProperties: {}!
nivelDeDañoEs: unNumero

	^(nivelDeDaño = unNumero).! !

!Nave methodsFor: 'acceso' stamp: 'asd 22/Sep/2026, 3:22:22 am (UTC)'!
!methodProperties: {}!
sinCombustible

	^combustible = 0.! !

!Nave methodsFor: 'acceso' stamp: 'asd 22/Sep/2026, 1:45:37 am (UTC)'!
!methodProperties: {}!
valorCombustible: valor

	^combustible = valor.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Nave class' category: #'ISW-Parcial1-1C25'!
Nave class
	instanceVariableNames: ''!

!Nave class methodsFor: 'prototipos' stamp: 'asd 22/Sep/2026, 4:07:12 am (UTC)'!
!methodProperties: {}!
nuevaNaveContrabandistaConGravitones

	^self new crearNaveConManiobras: 70 yEscudos: 50 yCombustible: 95 yCasco: 2 conImpulsor: Graviton new.! !

!Nave class methodsFor: 'prototipos' stamp: 'asd 22/Sep/2026, 3:23:45 am (UTC)'!
!methodProperties: {}!
nuevaNaveContrabandistaConImpulsoEstandar

	^self new crearNaveConManiobras: 70 yEscudos: 50 yCombustible: 95 yCasco: 2 conImpulsor: ImpulsoEstandart new.! !

!Nave class methodsFor: 'prototipos' stamp: 'asd 22/Sep/2026, 3:53:41 am (UTC)'!
!methodProperties: {}!
nuevaNaveContrabandistaConVelocidadLuz

	^self new crearNaveConManiobras: 70 yEscudos: 50 yCombustible: 95 yCasco: 2 conImpulsor: Warp new.! !

!Nave class methodsFor: 'prototipos' stamp: 'asd 22/Sep/2026, 12:48:55 am (UTC)'!
!methodProperties: {}!
nuevoCruceroPesadoConImpulsoEstandar

	^self new crearNaveConManiobras: 50 yEscudos: 100 yCombustible: 50 yCasco: 5 conImpulsor: ImpulsoEstandart new.! !


!classDefinition: #Sector category: #'ISW-Parcial1-1C25'!
Object subclass: #Sector
	instanceVariableNames: 'gravedad radiacion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW-Parcial1-1C25'!

!Sector methodsFor: 'creacion' stamp: 'asd 22/Sep/2026, 12:42:33 am (UTC)'!
!methodProperties: {}!
conRadiacion: nivelDeRadiacion yGravedad: nivelDeGravedad

	radiacion := nivelDeRadiacion .
	gravedad := nivelDeGravedad .! !


!Sector methodsFor: 'acciones' stamp: 'asd 22/Sep/2026, 4:09:27 am (UTC)'!
!methodProperties: {}!
atravesandoEnGravitonConNave: nave

	self subclassResponsibility! !

!Sector methodsFor: 'acciones' stamp: 'asd 22/Sep/2026, 2:18:06 am (UTC)'!
!methodProperties: {}!
atravesandoEnImpulsoConNave: nave

	self subclassResponsibility! !

!Sector methodsFor: 'acciones' stamp: 'asd 22/Sep/2026, 4:09:31 am (UTC)'!
!methodProperties: {}!
atravesandoEnWarpConNave: nave

	self subclassResponsibility! !


!classDefinition: #Asteroides category: #'ISW-Parcial1-1C25'!
Sector subclass: #Asteroides
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW-Parcial1-1C25'!

!Asteroides methodsFor: 'acciones' stamp: 'asd 22/Sep/2026, 4:30:36 am (UTC)'!
!methodProperties: {}!
atravesandoEnGravitonConNave: nave

	nave cruzandoConRadiacion: radiacion conGravedad: 0 ygastoDeCombustible: 20 ! !

!Asteroides methodsFor: 'acciones' stamp: 'asd 22/Sep/2026, 4:20:28 am (UTC)'!
!methodProperties: {}!
atravesandoEnImpulsoConNave: nave

	nave reduccionDeEscudos: 20.
	nave cruzandoConRadiacion: radiacion conGravedad: gravedad ygastoDeCombustible: 10 ! !

!Asteroides methodsFor: 'acciones' stamp: 'asd 22/Sep/2026, 4:27:59 am (UTC)'!
!methodProperties: {}!
atravesandoEnWarpConNave: nave

	nave penalidadEscudos: 0.
	nave penalidadManiobra: 0.
	nave cruzandoConRadiacion: radiacion conGravedad: gravedad ygastoDeCombustible: 10 ! !


!classDefinition: #Nebulosa category: #'ISW-Parcial1-1C25'!
Sector subclass: #Nebulosa
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW-Parcial1-1C25'!

!Nebulosa methodsFor: 'acciones' stamp: 'asd 22/Sep/2026, 4:32:37 am (UTC)'!
!methodProperties: {}!
atravesandoEnGravitonConNave: nave

	nave cruzandoConRadiacion: radiacion conGravedad: gravedad ygastoDeCombustible: 30 ! !

!Nebulosa methodsFor: 'acciones' stamp: 'asd 22/Sep/2026, 4:32:08 am (UTC)'!
!methodProperties: {}!
atravesandoEnImpulsoConNave: nave

	nave penalidadEscudos: 0.7.
	nave cruzandoConRadiacion: radiacion conGravedad: gravedad ygastoDeCombustible: 10 ! !

!Nebulosa methodsFor: 'acciones' stamp: 'asd 22/Sep/2026, 4:32:56 am (UTC)'!
!methodProperties: {}!
atravesandoEnWarpConNave: nave

	nave cruzandoConRadiacion: 0 conGravedad: 0 ygastoDeCombustible: 0 ! !


!classDefinition: #Planetario category: #'ISW-Parcial1-1C25'!
Sector subclass: #Planetario
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW-Parcial1-1C25'!

!Planetario methodsFor: 'acciones' stamp: 'asd 22/Sep/2026, 4:20:53 am (UTC)'!
!methodProperties: {}!
atravesandoEnGravitonConNave: nave

	nave penalidadManiobra: 0.8.
	nave cruzandoConRadiacion: radiacion conGravedad: gravedad ygastoDeCombustible: 10 ! !

!Planetario methodsFor: 'acciones' stamp: 'asd 22/Sep/2026, 4:20:28 am (UTC)'!
!methodProperties: {}!
atravesandoEnImpulsoConNave: nave

	nave cruzandoConRadiacion: radiacion conGravedad: gravedad ygastoDeCombustible: 10 ! !

!Planetario methodsFor: 'acciones' stamp: 'asd 22/Sep/2026, 4:20:28 am (UTC)'!
!methodProperties: {}!
atravesandoEnWarpConNave: nave

	nave cruzandoConRadiacion: 0 conGravedad: gravedad ygastoDeCombustible: 10 ! !


!classDefinition: #EscapeDeFlotaTests category: #'ISW-Parcial1-1C25'!
TestCase subclass: #EscapeDeFlotaTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW-Parcial1-1C25'!

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 10/Jul/2025, 10:58:18 pm (UTC)'!
!methodProperties: {}!
test01LaFlotaDebeTenerAlMenosUnaNave
	
	self 
		should: [ EscapeDeFlota enrolar: {  } ] 
		raise: Error-MessageNotUnderstood 
		withMessageText: EscapeDeFlota flotaSinNavesDescripcionDeError ! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 10/Jul/2025, 10:58:49 pm (UTC)'!
!methodProperties: {}!
test02LaFlotaNoPuedeTenerNavesDuplicadas

	| cruceroPesadoConImpulsoEstandar |
	
	cruceroPesadoConImpulsoEstandar := self nuevoCruceroPesadoConImpulsoEstandar.
	
	self 
		should: [ EscapeDeFlota enrolar: { cruceroPesadoConImpulsoEstandar. cruceroPesadoConImpulsoEstandar } ] 
		raise: Error-MessageNotUnderstood 
		withMessageText: EscapeDeFlota todasLasNavesDebenSerDiferentesDescripcionDeError ! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 17/Jul/2025, 8:58:13 am (UTC)'!
!methodProperties: {}!
test03LaRutaDeSectoresARecorrerNoPuedeSerVacia

	| cruceroPesadoConImpulso flota |
	
	cruceroPesadoConImpulso := self nuevoCruceroPesadoConImpulsoEstandar.
	self assert: (cruceroPesadoConImpulso valorCombustible: 50).
	
	flota := EscapeDeFlota enrolar: { cruceroPesadoConImpulso }.
	
	self 
		should: [ flota atravesar: {  } ] 
		raise: Error-MessageNotUnderstood  
		withExceptionDo: [ :error | 
			self assert: EscapeDeFlota rutaVaciaDescripcionDeError equals: error messageText.
			self assert: (cruceroPesadoConImpulso valorCombustible: 50) ]
! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 17/Jul/2025, 8:58:22 am (UTC)'!
!methodProperties: {}!
test04CombustibleDeLaNaveDebeSerSuficienteParaAtravesarUnicoSectorPlanetarioYSobrevivir

	| sector flota cruceroPesadoConImpulso |
	
	"Crucero Pesado -> Maniobravilidad: 50. Escudos: 100. Combustible: 50. NivelesDeDañoCasco: 5."
	cruceroPesadoConImpulso := self nuevoCruceroPesadoConImpulsoEstandar.
	self assert: (cruceroPesadoConImpulso valorCombustible: 50).
	
	flota := EscapeDeFlota enrolar: { cruceroPesadoConImpulso }.
	
	sector := self nuevoSectorPlanetarioConGravedad: 50 yRadiacion: 50.
	
	flota atravesar: { sector }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: cruceroPesadoConImpulso ).
	self assert: (cruceroPesadoConImpulso valorCombustible: (50 - 10))
	
	
	
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 18/Jul/2025, 12:06:58 am (UTC)'!
!methodProperties: {}!
test05LaRutaDeSectoresARecorrerNoPuedeTenerSectoresRepetidos

	| cruceroPesadoConImpulso flota sector |
	
	cruceroPesadoConImpulso := self nuevoCruceroPesadoConImpulsoEstandar.
	self assert: (cruceroPesadoConImpulso valorCombustible: 50).
	
	flota := EscapeDeFlota enrolar: { cruceroPesadoConImpulso }.
	
	sector := self nuevoSectorPlanetarioConGravedad: 50 yRadiacion: 50.
	
	self 
		should: [ flota atravesar: { sector. sector } ] 
		raise: Error-MessageNotUnderstood  
		withExceptionDo: [ :error | 
			self assert: EscapeDeFlota sectoresRepetidosDescripcionDeError equals: error messageText.
			self assert: (cruceroPesadoConImpulso valorCombustible: 50) ]
! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'asd 22/Sep/2026, 3:40:50 am (UTC)'!
!methodProperties: {}!
test06NaveQueSeQuedaSinCombustibleMientrasCruzaSectorNoSobrevive

	| flota naveContrabandistaConImpulso |
	
	"Nave Contrabandista: -> Maniobravilidad: 70. Escudos: 50. Combustible: 95. NivelesDeDañoCasco: 2."
	naveContrabandistaConImpulso := self nuevaNaveContrabandistaConImpulsoEstandar.
	self deny: naveContrabandistaConImpulso sinCombustible.

	flota := EscapeDeFlota enrolar: { naveContrabandistaConImpulso }.
	
	"Secuencia de 10 sistemas planetarios seguidos con combustible para 9.5..."
	flota atravesar: (self nuevoTrayectoDeSectoresPlanetariosDeLongitud: 10 conGravedad: 50 yRadiacion: 50).
	
	self assert: (flota numeroDeSobrevivientesEs: 0).
	self deny: (flota haSobrevivido: naveContrabandistaConImpulso).
	self assert: naveContrabandistaConImpulso sinCombustible
	
	
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 18/Jul/2025, 12:06:34 am (UTC)'!
!methodProperties: {}!
test07NavePuedeQuedarseSinCombustiblePeroSobrevivir

	| flota cruceroPesadoConImpulso |
	
	"Crucero Pesado -> Maniobravilidad: 50. Escudos: 100. Combustible: 50. NivelesDeDañoCasco: 5."
	cruceroPesadoConImpulso := self nuevoCruceroPesadoConImpulsoEstandar.
	self deny: cruceroPesadoConImpulso sinCombustible.
	
	flota := EscapeDeFlota enrolar: { cruceroPesadoConImpulso }.
	
	"Secuencia de 5 sistemas planetarios seguidos... Llega justo!!"
	flota atravesar: (self nuevoTrayectoDeSectoresPlanetariosDeLongitud: 5 conGravedad: 50 yRadiacion: 50).
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: cruceroPesadoConImpulso ).
	self assert: cruceroPesadoConImpulso sinCombustible.
	self assert: (cruceroPesadoConImpulso valorCombustible: 0).
	
	
	
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 18/Jul/2025, 12:06:30 am (UTC)'!
!methodProperties: {}!
test08NaveQueSeQuedaSinCombustibleAntesDePasarPorTodosLosSectoresNoSobrevive

	| flota cruceroPesadoConImpulso |
	
	"Crucero Pesado -> Maniobravilidad: 50. Escudos: 100. Combustible: 50. NivelesDeDañoCasco: 5."
	cruceroPesadoConImpulso := self nuevoCruceroPesadoConImpulsoEstandar.
	self deny: cruceroPesadoConImpulso sinCombustible.

	flota := EscapeDeFlota enrolar: { cruceroPesadoConImpulso }.
	
	"Secuencia de 6 sistemas planetarios seguidos con combustible para 5..."
	flota atravesar: (self nuevoTrayectoDeSectoresPlanetariosDeLongitud: 6 conGravedad: 50 yRadiacion: 50).
	
	self assert: (flota numeroDeSobrevivientesEs: 0).
	self deny: (flota haSobrevivido: cruceroPesadoConImpulso).
	self assert: cruceroPesadoConImpulso sinCombustible
	
	
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 18/Jul/2025, 12:06:25 am (UTC)'!
!methodProperties: {}!
test09NaveQueAtraviesaSectorConMayorGravedadQueSuManiobravilidadSufreDaños

	| flota cruceroPesadoConImpulso |
	
	"Crucero Pesado -> Maniobravilidad: 50. Escudos: 100. Combustible: 50. NivelesDeDañoCasco: 5."
	cruceroPesadoConImpulso := self nuevoCruceroPesadoConImpulsoEstandar.
	self deny: cruceroPesadoConImpulso dañada.
	self assert: (cruceroPesadoConImpulso nivelDeDañoEs: 0).
	
	flota := EscapeDeFlota enrolar: { cruceroPesadoConImpulso }.
	
	flota atravesar: { self nuevoSectorPlanetarioConGravedad: 70 yRadiacion: 50 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: cruceroPesadoConImpulso ).
	self assert: cruceroPesadoConImpulso dañada.
	self assert: (cruceroPesadoConImpulso nivelDeDañoEs: 1).

	
	
	
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 18/Jul/2025, 12:06:21 am (UTC)'!
!methodProperties: {}!
test10NaveQueAtraviesaSectorConMayorRadiacionQueSusEscudosDeEnergiaSufreDaños

	| flota cruceroPesadoConImpulso |
	
	"Crucero Pesado -> Maniobravilidad: 50. Escudos: 100. Combustible: 50. NivelesDeDañoCasco: 5."
	cruceroPesadoConImpulso := self nuevoCruceroPesadoConImpulsoEstandar.
	self deny: cruceroPesadoConImpulso dañada.
	self assert: (cruceroPesadoConImpulso nivelDeDañoEs: 0).
	
	flota := EscapeDeFlota enrolar: { cruceroPesadoConImpulso }.
	
	flota atravesar: { self nuevoSectorPlanetarioConGravedad: 50 yRadiacion: 200 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: cruceroPesadoConImpulso ).
	self assert: cruceroPesadoConImpulso dañada.
	self assert: (cruceroPesadoConImpulso nivelDeDañoEs: 1).
	

	
	
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 18/Jul/2025, 12:06:15 am (UTC)'!
!methodProperties: {}!
test11NaveAtravesandoSectorConMayorGravedadYRadiacionQueSuManiobravilidadYEscudosDeEnergiaSufreElDobleDeDaño

	| flota cruceroPesadoConImpulso |
	
	"Crucero Pesado -> Maniobravilidad: 50. Escudos: 100. Combustible: 50. NivelesDeDañoCasco: 5."
	cruceroPesadoConImpulso := self nuevoCruceroPesadoConImpulsoEstandar.
	self deny: cruceroPesadoConImpulso dañada.
	self assert: (cruceroPesadoConImpulso nivelDeDañoEs: 0).

	flota := EscapeDeFlota enrolar: { cruceroPesadoConImpulso }.
	
	flota atravesar: { self nuevoSectorPlanetarioConGravedad: 70 yRadiacion: 200 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: cruceroPesadoConImpulso ).
	self assert: cruceroPesadoConImpulso dañada.
	self assert: (cruceroPesadoConImpulso nivelDeDañoEs: 2).
	
	
	
	
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 18/Jul/2025, 12:06:11 am (UTC)'!
!methodProperties: {}!
test12NaveQueSufreMasNivelesDeDañoQueLaCapacidadDeSuCascoEsDestruidaYNoSobreviveAlEscape

	| flota cruceroPesadoConImpulso |
	
	"Crucero Pesado -> Maniobravilidad: 50. Escudos: 100. Combustible: 50. NivelesDeDañoCasco: 5."
	cruceroPesadoConImpulso := self nuevoCruceroPesadoConImpulsoEstandar.
	self deny: cruceroPesadoConImpulso destruida.
	
	flota := EscapeDeFlota enrolar: { cruceroPesadoConImpulso }.
	
	"6 niveles de daño en una clase de naves que sólo admite 5 como máximo..."
	flota atravesar: (self nuevoTrayectoDeSectoresPlanetariosDeLongitud: 3 conGravedad: 70 yRadiacion: 200).
	
	self assert: (flota numeroDeSobrevivientesEs: 0).
	self deny: (flota haSobrevivido: cruceroPesadoConImpulso).
	self assert: cruceroPesadoConImpulso destruida
	
	
	
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 18/Jul/2025, 12:06:07 am (UTC)'!
!methodProperties: {}!
test13NaveAtravesandoSectorPlanetarioUsandoVelocidadLuzIgnoraRadiacionDelSector

	| flota naveContrabandistaConVelocidadLuz |
	
	"Si se atraviesa un sector planetario utilizando velocidad luz (Warp, Light Speed, Subluminal, FTL: Faster Than Light, o como tu autor de ciencia ficción favorito lo llame), se puede pasar tan rápido que se ignoran los efectos de la radiación"
	
	"Nave Contrabandista: -> Maniobravilidad: 70. Escudos: 50. Combustible: 95. NivelesDeDañoCasco: 2."
	naveContrabandistaConVelocidadLuz := self nuevaNaveContrabandistaConVelocidadLuz.
	self deny: naveContrabandistaConVelocidadLuz dañada.
	self assert: (naveContrabandistaConVelocidadLuz nivelDeDañoEs: 0).

	flota := EscapeDeFlota enrolar: { naveContrabandistaConVelocidadLuz}.
	
	flota atravesar: { self nuevoSectorPlanetarioConGravedad: 50 yRadiacion: 200 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConVelocidadLuz).
	self deny: naveContrabandistaConVelocidadLuz dañada.
	self assert: (naveContrabandistaConVelocidadLuz nivelDeDañoEs: 0).
	self assert: (naveContrabandistaConVelocidadLuz valorCombustible: (95 - 10)).
	
	flota atravesar: { self nuevoSectorPlanetarioConGravedad: 90 yRadiacion: 200 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConVelocidadLuz).
	
	"El daño proviene aquí de la alta gravedad y no de la radiación..."	
	self assert: naveContrabandistaConVelocidadLuz dañada.
	self assert: (naveContrabandistaConVelocidadLuz nivelDeDañoEs: 1).
	self assert: (naveContrabandistaConVelocidadLuz valorCombustible: (95 - 20))
	
	
	
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 18/Jul/2025, 12:06:02 am (UTC)'!
!methodProperties: {}!
test14NaveAtravesandoSectorPlanetarioUsandoGravitonesDecrementaManiobravilidadEn20Porciento

	| flota naveContrabandistaConGravitones |
	
	"Si se atraviesa un sector planetario utilizando propulsion por gravitones el piloto tiene mayor dificultad en controlar la nave en el sector. 20% de penalización en su maniobravilidad"
	
	"Nave Contrabandista: -> Maniobravilidad: 70. Escudos: 50. Combustible: 95. NivelesDeDañoCasco: 2."
	naveContrabandistaConGravitones := self nuevaNaveContrabandistaConGravitones.
	self deny: naveContrabandistaConGravitones dañada.
	self assert: (naveContrabandistaConGravitones valorCombustible: 95).

	flota := EscapeDeFlota enrolar: { naveContrabandistaConGravitones }.
	
	flota atravesar: { self nuevoSectorPlanetarioConGravedad: 70 * 0.8 yRadiacion: 40 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConGravitones).
	self deny: naveContrabandistaConGravitones dañada.
	self assert: (naveContrabandistaConGravitones valorCombustible: 95 - 10).
	
	flota atravesar: { self nuevoSectorPlanetarioConGravedad: (70 * 0.8) + 1 yRadiacion: 40 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConGravitones).
	
	"La gravedad supera la coordinacion del piloto navegando sector planetario con gravitones, luego la nave es dañada"
	self assert: naveContrabandistaConGravitones dañada.
	self assert: (naveContrabandistaConGravitones nivelDeDañoEs: 1).
	self assert: (naveContrabandistaConGravitones valorCombustible: 95 - 20).

! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 18/Jul/2025, 12:05:58 am (UTC)'!
!methodProperties: {}!
test15NaveAtravesandoSectorDeAsteroidesUsandoImpulsoEstandarReduceSusEscudosDeEnergia

	| flota naveContrabandistaConImpulso |
	
	"Si se atraviesa un sector de asteroides utilizando el propulsor de impulso estandar, los escudos indefectiblemente reciben el impacto de los asteroides (nada que pueda hacer el piloto con ese tipo de propulsores) y se reducen permanentemente en 20"
	
	"Nave Contrabandista: -> Maniobravilidad: 70. Escudos: 50. Combustible: 95. NivelesDeDañoCasco: 2."
	naveContrabandistaConImpulso := self nuevaNaveContrabandistaConImpulsoEstandar.
	self deny: naveContrabandistaConImpulso dañada.
	self assert: (naveContrabandistaConImpulso nivelDeDañoEs: 0).
	self assert: (naveContrabandistaConImpulso fuerzaDeEscudosEn: 50).

	flota := EscapeDeFlota enrolar: { naveContrabandistaConImpulso}.
	flota atravesar: { self nuevoSectorDeAsteroidesConGravedad: 65 yRadiacion: 35 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConImpulso).
	self assert: (naveContrabandistaConImpulso fuerzaDeEscudosEn: 50 - 20).
	
	"La nave sufre daño porque los escudos de energia descendieron por debajo de la radiacion del sector"
	self assert: naveContrabandistaConImpulso dañada.
	self assert: (naveContrabandistaConImpulso nivelDeDañoEs: 1).
	
	

	
	
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 18/Jul/2025, 12:05:53 am (UTC)'!
!methodProperties: {}!
test16NaveAtravesandoSectorDeAsteroidesUsandoVelocidadLuzAgotaSusEscudosACeroYSufreDaños

	| flota naveContrabandistaConVelocidadLuz |
	
	"Si se atraviesa un sector de asteroides utilizando velocidad luz, vas derecho al desastre... quien sea que haya trazado ese curso estará condenado, porque irá en linea recta contra un cinturón de asteroides a la velocidad de la luz (duh!!). En terminos prácticos, la nave pierde todos sus escudos de energía permanentemente (pasan a 0) debido a los impactos con los asteroides, se le inflinje 1 nivel de daño al casco y además casi seguro se le suma otro nivel más por radiación al esta no contar más con sus escudos"
	
	"Nave Contrabandista: -> Maniobravilidad: 70. Escudos: 50. Combustible: 95. NivelesDeDañoCasco: 2."
	naveContrabandistaConVelocidadLuz := self nuevaNaveContrabandistaConVelocidadLuz.
	self deny: naveContrabandistaConVelocidadLuz dañada.
	self assert: (naveContrabandistaConVelocidadLuz nivelDeDañoEs: 0).
	self assert: (naveContrabandistaConVelocidadLuz fuerzaDeEscudosEn: 50).
	
	flota := EscapeDeFlota enrolar: { naveContrabandistaConVelocidadLuz }.
	
	flota atravesar: { self nuevoSectorDeAsteroidesConGravedad: 65 yRadiacion: 30 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConVelocidadLuz).
	
	"Usar Velocidad Luz con asteroides acaba con los escudos y suma 1 nivel de daño al casco".
	"La radición daña adicionalmente al casco de la nave ya que sus escudos se reducen a 0"
	self assert: (naveContrabandistaConVelocidadLuz fuerzaDeEscudosEn: 0).
	self assert: naveContrabandistaConVelocidadLuz dañada.
	self assert: (naveContrabandistaConVelocidadLuz nivelDeDañoEs: 1 + 1).
	
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 18/Jul/2025, 12:05:48 am (UTC)'!
!methodProperties: {}!
test17NaveAtravesandoSectorDeAsteroidesUsandoGravitonesIgnoraGravedadPeroConsumeElDobleDeCombustible

	| flota naveContrabandistaConGravitones |
	
	"Si se atraviesa un sector de asteroides utilizando el avanzado sistema de propulsores basado en Gravitones, el piloto automático de la nave puede sin problema eludirlos sin impactos. Como el piloto no participa, no se tiene en cuenta el rating de maniobrabilidad de la nave, ni la gravedad del sector"
	
	"Al mismo tiempo, lamentablemente el sistema consume el doble de combustible que lo normal"
	
	"Nave Contrabandista: -> Maniobravilidad: 70. Escudos: 50. Combustible: 95. NivelesDeDañoCasco: 2."
	naveContrabandistaConGravitones := self nuevaNaveContrabandistaConGravitones.
	
	flota := EscapeDeFlota enrolar: { naveContrabandistaConGravitones}.
	
	"La alta gravedad no son nada para el sistema avanzado de propulsores de Gravitones"
	flota atravesar: { self nuevoSectorDeAsteroidesConGravedad: 90 yRadiacion: 30 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConGravitones).
	self deny: naveContrabandistaConGravitones dañada.
	"Doble gasto de combustible"
	self assert: (naveContrabandistaConGravitones valorCombustible: (95 - 20)).

	"La radiación del sector es la que produce el daño (60 supera a los 50 de los escudos de la nave) y no la gravedad..."
	flota atravesar: { self nuevoSectorDeAsteroidesConGravedad: 90 yRadiacion: 60 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConGravitones).
	self assert: naveContrabandistaConGravitones dañada.
	self assert: (naveContrabandistaConGravitones nivelDeDañoEs: 1).
	"Doble gasto de combustible"
	self assert: (naveContrabandistaConGravitones valorCombustible: (95 - 40))
	! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 18/Jul/2025, 1:47:51 am (UTC)'!
!methodProperties: {}!
test18NaveAtravesandoSectorNebulosaUsandoImpulsoEstandarDecrementaEscudosAl30Porciento

	| flota naveContrabandistaConImpulso |
	
	"Si se atraviesa una nebulosa con propulsores de impulso estandar, se esta mucho tiempo dentro de la misma y los escudos empiezan a perder efectividad. 30% de penalizacion a los escudos mientras se la cruza"
	
	"Nave Contrabandista: -> Maniobravilidad: 70. Escudos: 50. Combustible: 95. NivelesDeDañoCasco: 2."
	naveContrabandistaConImpulso := self nuevaNaveContrabandistaConImpulsoEstandar .
	self deny: naveContrabandistaConImpulso dañada.
	self assert: (naveContrabandistaConImpulso valorCombustible: 95).

	flota := EscapeDeFlota enrolar: { naveContrabandistaConImpulso }.
	
	flota atravesar: { self nuevoSectorNebulosaConGravedad: 50 yRadiacion: 50 * 0.7 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConImpulso).
	self deny: naveContrabandistaConImpulso dañada.
	self assert: (naveContrabandistaConImpulso valorCombustible: 95 - 10).


	flota atravesar: { self nuevoSectorNebulosaConGravedad: 50 yRadiacion: (50 * 0.7) + 1}.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConImpulso).
	"La radiación supera el desgaste extremo de los escudos, y por lo tanto la nave es dañada"
	self assert: naveContrabandistaConImpulso dañada.
	self assert: (naveContrabandistaConImpulso nivelDeDañoEs: 1).
	self assert: (naveContrabandistaConImpulso valorCombustible: 95 - 20).
! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 18/Jul/2025, 12:05:37 am (UTC)'!
!methodProperties: {}!
test19NaveAtravesandoSectorNebulosaUsandoVelocidadLuzNoConsumeCombustibleEIgnoraGravedadYRadiacionDelSector

	| flota naveContrabandistaConVelocidadLuz |
	
	"Si se viaja hacia una nebulosa utilizando velocidad luz, el modulo Warp se revigoriza por un efecto cuántico bien conocido por el contacto con los gases de la nébula, y casi la teletransporta de inmediato al próximo sector galáctico de la trayectoria del viaje. Luego no se consume combustible, y no se efectua ninguno de los chequeos típicos de supervivencia en el sector"
	
	"Nave Contrabandista: -> Maniobravilidad: 70. Escudos: 50. Combustible: 95. NivelesDeDañoCasco: 2."
	naveContrabandistaConVelocidadLuz := self nuevaNaveContrabandistaConVelocidadLuz.
	self deny: naveContrabandistaConVelocidadLuz dañada.
	self assert: (naveContrabandistaConVelocidadLuz valorCombustible: 95).

	flota := EscapeDeFlota enrolar: { naveContrabandistaConVelocidadLuz }.
	
	flota atravesar: { self nuevoSectorNebulosaConGravedad: 90 yRadiacion: 90 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConVelocidadLuz).
	self deny: naveContrabandistaConVelocidadLuz dañada.
	self assert: (naveContrabandistaConVelocidadLuz valorCombustible: 95).
! !

!EscapeDeFlotaTests methodsFor: 'tests' stamp: 'NR 18/Jul/2025, 12:05:31 am (UTC)'!
!methodProperties: {}!
test20NaveAtravesandoSectorNebulosaUsandoGravitonesEsAfectadaPorGravedadYRadiacionNormalmentePeroConsumientoElTripleDeCombustible

	| flota naveContrabandistaConGravitones |
	
	"La nebulosa afecta los propulsores de gravitones haciendolos menos eficientes. Consume 3 veces el valor de combustible normal sin ningun otro beneficio"
	
	"Nave Contrabandista: -> Maniobravilidad: 70. Escudos: 50. Combustible: 95. NivelesDeDañoCasco: 2."
	naveContrabandistaConGravitones := self nuevaNaveContrabandistaConGravitones .
	self deny: naveContrabandistaConGravitones dañada.
	self assert: (naveContrabandistaConGravitones valorCombustible: 95).

	flota := EscapeDeFlota enrolar: { naveContrabandistaConGravitones }.
	
	flota atravesar: { self nuevoSectorNebulosaConGravedad: 70 yRadiacion: 50 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConGravitones).
	self deny: naveContrabandistaConGravitones dañada.
	self assert: (naveContrabandistaConGravitones valorCombustible: 95 - 30).

	flota atravesar: { self nuevoSectorNebulosaConGravedad: 71 yRadiacion: 51 }.
	
	self assert: (flota numeroDeSobrevivientesEs: 1).
	self assert: (flota haSobrevivido: naveContrabandistaConGravitones).
	self assert: naveContrabandistaConGravitones dañada.
	self assert: (naveContrabandistaConGravitones nivelDeDañoEs: 2).
	self assert: (naveContrabandistaConGravitones valorCombustible: 95 - 60)! !


!EscapeDeFlotaTests methodsFor: 'naves' stamp: 'asd 22/Sep/2026, 4:07:35 am (UTC)'!
!methodProperties: {}!
nuevaNaveContrabandistaConGravitones

	^Nave nuevaNaveContrabandistaConGravitones.! !

!EscapeDeFlotaTests methodsFor: 'naves' stamp: 'asd 22/Sep/2026, 3:24:21 am (UTC)'!
!methodProperties: {}!
nuevaNaveContrabandistaConImpulsoEstandar

	^Nave nuevaNaveContrabandistaConImpulsoEstandar.! !

!EscapeDeFlotaTests methodsFor: 'naves' stamp: 'asd 22/Sep/2026, 3:58:39 am (UTC)'!
!methodProperties: {}!
nuevaNaveContrabandistaConVelocidadLuz

	^Nave nuevaNaveContrabandistaConVelocidadLuz.! !

!EscapeDeFlotaTests methodsFor: 'naves' stamp: 'asd 22/Sep/2026, 12:50:28 am (UTC)'!
!methodProperties: {}!
nuevoCruceroPesadoConImpulsoEstandar

	^Nave nuevoCruceroPesadoConImpulsoEstandar.! !


!EscapeDeFlotaTests methodsFor: 'sectores' stamp: 'asd 22/Sep/2026, 4:10:16 am (UTC)'!
!methodProperties: {}!
nuevoSectorDeAsteroidesConGravedad: gravedad yRadiacion: radiacion

	^Asteroides new conRadiacion: radiacion yGravedad: gravedad ! !

!EscapeDeFlotaTests methodsFor: 'sectores' stamp: 'asd 22/Sep/2026, 4:34:03 am (UTC)'!
!methodProperties: {}!
nuevoSectorNebulosaConGravedad: gravedad yRadiacion: radiacion
 
	^Nebulosa new conRadiacion: radiacion yGravedad: gravedad ! !

!EscapeDeFlotaTests methodsFor: 'sectores' stamp: 'asd 22/Sep/2026, 12:52:55 am (UTC)'!
!methodProperties: {}!
nuevoSectorPlanetarioConGravedad: gravedad yRadiacion: radiacion

	^Planetario new conRadiacion: radiacion yGravedad: gravedad .
! !

!EscapeDeFlotaTests methodsFor: 'sectores' stamp: 'asd 22/Sep/2026, 3:31:53 am (UTC)'!
!methodProperties: {}!
nuevoTrayectoDeSectoresPlanetariosDeLongitud: numeroDeSectores conGravedad: gravedad yRadiacion: radiacion

	|trayectoria index|
	
	trayectoria := OrderedCollection new.
	index := 1.
	[index <= numeroDeSectores] whileTrue: [
		index := index + 1.
		trayectoria add: (self nuevoSectorPlanetarioConGravedad: gravedad yRadiacion: radiacion) 
	].
	
	^trayectoria .! !


!EscapeDeFlotaTests methodsFor: 'propulsores' stamp: 'NR 28/Sep/2025, 3:33:03 am (UTC)'!
!methodProperties: {}!
propulsoresDeGravitones

	self shouldBeImplemented ! !

!EscapeDeFlotaTests methodsFor: 'propulsores' stamp: 'NR 28/Sep/2025, 3:32:59 am (UTC)'!
!methodProperties: {}!
propulsoresDeImpulsoEstandar

	self shouldBeImplemented ! !

!EscapeDeFlotaTests methodsFor: 'propulsores' stamp: 'NR 28/Sep/2025, 3:32:53 am (UTC)'!
!methodProperties: {}!
propulsoresDeVelocidadLuz

	self shouldBeImplemented ! !
