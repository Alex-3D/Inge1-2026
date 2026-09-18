!classDefinition: #Jugador category: #Penales!
Object subclass: #Jugador
	instanceVariableNames: 'fuerzaBase direccionUltimaJugada'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Jugador methodsFor: 'access' stamp: 'asd 16/Sep/2026, 3:57:10 am (UTC)'!
!methodProperties: {}!
direccionUltimaJugada

	^direccionUltimaJugada.! !

!Jugador methodsFor: 'access' stamp: 'asd 16/Sep/2026, 3:57:31 am (UTC)'!
!methodProperties: {}!
direccionUltimaJugada: unaCoordenada

	direccionUltimaJugada := unaCoordenada.! !

!Jugador methodsFor: 'access' stamp: 'asd 16/Sep/2026, 12:30:23 am (UTC)'!
!methodProperties: {}!
fuerzaBase

	^fuerzaBase.! !


!Jugador methodsFor: 'initialize' stamp: 'asd 16/Sep/2026, 4:07:28 am (UTC)'!
!methodProperties: {}!
initialize

	direccionUltimaJugada := [^self error: self class direccionUltimaJugadaError.]! !

!Jugador methodsFor: 'initialize' stamp: 'asd 16/Sep/2026, 12:30:23 am (UTC)'!
!methodProperties: {}!
initializeWith: unaFuerza

	fuerzaBase := unaFuerza.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Jugador class' category: #Penales!
Jugador class
	instanceVariableNames: ''!

!Jugador class methodsFor: 'message errors' stamp: 'asd 16/Sep/2026, 4:00:24 am (UTC)'!
!methodProperties: {}!
direccionUltimaJugadaError

	^'Aun no hubo jugada!!'! !


!Jugador class methodsFor: 'instance creation' stamp: 'asd 16/Sep/2026, 12:37:35 am (UTC)'!
!methodProperties: {}!
decideTirarAColocarSuFuerzaBaseEs: unaFuerza

	^self new initializeWith: unaFuerza.! !

!Jugador class methodsFor: 'instance creation' stamp: 'asd 16/Sep/2026, 12:30:23 am (UTC)'!
!methodProperties: {}!
esperaPorTiroYSeAdelantaSuFuerzaBaseEs: unaFuerza

	^self new initializeWith: unaFuerza.! !


!classDefinition: #Arquero category: #Penales!
Jugador subclass: #Arquero
	instanceVariableNames: 'tipoDeAtajada'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Arquero methodsFor: 'initialize' stamp: 'asd 16/Sep/2026, 3:39:41 am (UTC)'!
!methodProperties: {}!
initializeWith: unaFuerza and: unTipoDeAtajada

	self initializeWith: unaFuerza.
	tipoDeAtajada := unTipoDeAtajada.! !


!Arquero methodsFor: 'access' stamp: 'asd 17/Sep/2026, 9:43:40 pm (UTC)'!
!methodProperties: {}!
atajo: coordenadaTiro y: unaPelota 

	^tipoDeAtajada seIntercepto: coordenadaTiro y: direccionUltimaJugada y: unaPelota.! !

!Arquero methodsFor: 'access' stamp: 'asd 17/Sep/2026, 11:16:46 pm (UTC)'!
!methodProperties: {}!
fuerzaDeAtajada: unaPelota y: unTipoDeTiro 

	^tipoDeAtajada fuerzaDeJugada: unaPelota y: fuerzaBase y: unTipoDeTiro.! !


!Arquero methodsFor: 'acctions' stamp: 'asd 18/Sep/2026, 3:10:38 am (UTC)'!
!methodProperties: {}!
tePatearonAMatarConJabulani: unVar y: unaFuerzaTiro y: coordenadaResultanteTiro

	tipoDeAtajada sePateoAMatarConJabulani: unVar y: unaFuerzaTiro y: fuerzaBase y: coordenadaResultanteTiro y: self direccionUltimaJugada.! !

!Arquero methodsFor: 'acctions' stamp: 'asd 18/Sep/2026, 3:12:26 am (UTC)'!
!methodProperties: {}!
tePatearonAMatarConPlayera: unVar y: unaFuerzaTiro y: coordenadaResultanteTiro

	tipoDeAtajada sePateoAMatarConPlayera: unVar y: unaFuerzaTiro y: fuerzaBase y: coordenadaResultanteTiro y: self direccionUltimaJugada. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Arquero class' category: #Penales!
Arquero class
	instanceVariableNames: ''!

!Arquero class methodsFor: 'instance creation' stamp: 'asd 17/Sep/2026, 12:50:24 am (UTC)'!
!methodProperties: {}!
eligeDireccionAntesDeTiroSuFuerzaBaseEs: unaFuerza

	^self new initializeWith: unaFuerza and: TipoDeJugada atajadaSeTiraAntes.! !

!Arquero class methodsFor: 'instance creation' stamp: 'asd 17/Sep/2026, 12:50:24 am (UTC)'!
!methodProperties: {}!
esperaPorTiroYSeAdelantaSuFuerzaBaseEs: unaFuerza

	^self new initializeWith: unaFuerza and: TipoDeJugada atajadaSeTiraDespues.! !


!classDefinition: #Delantero category: #Penales!
Jugador subclass: #Delantero
	instanceVariableNames: 'tipoDeTiro'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Delantero methodsFor: 'initialize' stamp: 'asd 16/Sep/2026, 1:04:08 am (UTC)'!
!methodProperties: {}!
initializeWith: unaFuerza and: unTipoDeTiro

	self initializeWith: unaFuerza.
	tipoDeTiro := unTipoDeTiro.! !


!Delantero methodsFor: 'acctions' stamp: 'asd 18/Sep/2026, 1:48:29 am (UTC)'!
!methodProperties: {}!
patearCon: unVar y: unaPelota

	tipoDeTiro patearCon: unVar y: fuerzaBase y: unaPelota y: self direccionUltimaJugada.! !


!Delantero methodsFor: 'access' stamp: 'asd 17/Sep/2026, 10:20:59 pm (UTC)'!
!methodProperties: {}!
direccionResultante

	^tipoDeTiro coordenadaJugada: direccionUltimaJugada.! !

!Delantero methodsFor: 'access' stamp: 'asd 17/Sep/2026, 7:11:27 am (UTC)'!
!methodProperties: {}!
fuerzaDelTiro: unaPelota

	^tipoDeTiro fuerzaDeJugada: unaPelota y: fuerzaBase.! !

!Delantero methodsFor: 'access' stamp: 'asd 16/Sep/2026, 12:48:50 am (UTC)'!
!methodProperties: {}!
tipoDeTiro

	^tipoDeTiro.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Delantero class' category: #Penales!
Delantero class
	instanceVariableNames: ''!

!Delantero class methodsFor: 'instance creation' stamp: 'asd 17/Sep/2026, 12:50:24 am (UTC)'!
!methodProperties: {}!
decideTirarAColocarSuFuerzaBaseEs: unaFuerza

	^self new initializeWith: unaFuerza and: TipoDeJugada tiroAColocar.! !

!Delantero class methodsFor: 'instance creation' stamp: 'asd 17/Sep/2026, 9:56:29 pm (UTC)'!
!methodProperties: {}!
decideTirarAMatarSuFuerzaBaseEs: unaFuerza

	^self new initializeWith: unaFuerza and: TipoDeJugada tiroAMatar.! !


!classDefinition: #Pelota category: #Penales!
Object subclass: #Pelota
	instanceVariableNames: 'multiplicadorFuerzaDelantero penalizacionFuerzaDelantero multiplicadorFuerzaArquero visiblieAnteElVar'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Pelota methodsFor: 'initialize' stamp: 'asd 17/Sep/2026, 5:38:19 am (UTC)'!
!methodProperties: {}!
initialize

	multiplicadorFuerzaDelantero := 1.
	visiblieAnteElVar := true.! !

!Pelota methodsFor: 'initialize' stamp: 'asd 17/Sep/2026, 9:12:31 pm (UTC)'!
!methodProperties: {}!
initializeWith: unMultiplicadorDelantero and: unaPenalizacionDelantero and: unMultiplicadorArquero and: visibilidad

	multiplicadorFuerzaDelantero := unMultiplicadorDelantero.
	penalizacionFuerzaDelantero := unaPenalizacionDelantero.
	multiplicadorFuerzaArquero := unMultiplicadorArquero.
	visiblieAnteElVar := visibilidad.! !


!Pelota methodsFor: 'access' stamp: 'asd 17/Sep/2026, 6:19:05 am (UTC)'!
!methodProperties: {}!
fuerzaArquero

	^multiplicadorFuerzaArquero.! !

!Pelota methodsFor: 'access' stamp: 'asd 17/Sep/2026, 6:19:50 am (UTC)'!
!methodProperties: {}!
fuerzaDelantero

	^multiplicadorFuerzaDelantero.! !

!Pelota methodsFor: 'access' stamp: 'asd 17/Sep/2026, 9:06:20 pm (UTC)'!
!methodProperties: {}!
penalizacionDelantero

	^penalizacionFuerzaDelantero.! !

!Pelota methodsFor: 'access' stamp: 'asd 17/Sep/2026, 3:01:56 am (UTC)'!
!methodProperties: {}!
visiblieAnteElVar

	^visiblieAnteElVar! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Pelota class' category: #Penales!
Pelota class
	instanceVariableNames: ''!

!Pelota class methodsFor: 'prototipes' stamp: 'asd 17/Sep/2026, 10:39:35 pm (UTC)'!
!methodProperties: {}!
jabulaniSudafricanaRapida

	^self new initializeWith: 0.2 and: 0 and: 0 and: false.! !

!Pelota class methodsFor: 'prototipes' stamp: 'asd 17/Sep/2026, 10:36:06 pm (UTC)'!
!methodProperties: {}!
playeraLentaCostaAzul

	^self new initializeWith: 0 and: 0.2 and: 0.5 and: true.! !


!classDefinition: #Jabulani category: #Penales!
Pelota subclass: #Jabulani
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Jabulani methodsFor: 'acctions' stamp: 'asd 18/Sep/2026, 2:58:28 am (UTC)'!
!methodProperties: {}!
seTiroAMatar: unVar conFuerza: fuerzaResultante yCoordenadaResultante: coordenadaResultante

	unVar sePateoAMatarConJabulaniyFuerza: fuerzaResultante yCoordenada: coordenadaResultante.! !


!classDefinition: #Playera category: #Penales!
Pelota subclass: #Playera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Playera methodsFor: 'acctions' stamp: 'asd 18/Sep/2026, 3:02:31 am (UTC)'!
!methodProperties: {}!
seTiroAMatar: unVar conFuerza: fuerzaResultante yCoordenadaResultante: coordenadaResultante

	unVar sePateoAMatarConPlayerayFuerza: fuerzaResultante yCoordenada: coordenadaResultante.! !


!classDefinition: #Penales category: #Penales!
Object subclass: #Penales
	instanceVariableNames: 'delantero arquero puntajeDelantero puntajeArquero unaPelota varActual'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Penales methodsFor: 'score' stamp: 'asd 15/Sep/2026, 11:50:51 pm (UTC)'!
!methodProperties: {}!
arqueroAtaja
	
	puntajeArquero := puntajeArquero +1.! !

!Penales methodsFor: 'score' stamp: 'asd 15/Sep/2026, 11:51:18 pm (UTC)'!
!methodProperties: {}!
delanteroMeteGol
	
	puntajeDelantero := puntajeDelantero +1.! !

!Penales methodsFor: 'score' stamp: 'asd 15/Sep/2026, 11:50:16 pm (UTC)'!
!methodProperties: {}!
puntajeDeArquero

	^puntajeArquero.! !

!Penales methodsFor: 'score' stamp: 'asd 15/Sep/2026, 11:50:27 pm (UTC)'!
!methodProperties: {}!
puntajeDeDelantero

	^puntajeDelantero.! !


!Penales methodsFor: 'play' stamp: 'asd 18/Sep/2026, 2:45:32 am (UTC)'!
!methodProperties: {}!
arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: coordenadaDelantero arqueroSeLanzaEnDirección: coordenadaArquero
	
	self validarRangoCoordenadas: coordenadaDelantero y: coordenadaArquero.
	
	delantero direccionUltimaJugada: coordenadaDelantero.
	arquero direccionUltimaJugada: coordenadaArquero.
	varActual := Var new initializeWith: delantero and: arquero and: pelota.
	varActual observarPenalConCoordenadas: coordenadaDelantero y: coordenadaArquero.
	
	(varActual arqueroAtajo)ifTrue: [self arqueroAtaja] ifFalse: [self delanteroMeteGol].
	
	
	
	
	
	
	! !

!Penales methodsFor: 'play' stamp: 'asd 17/Sep/2026, 11:51:45 pm (UTC)'!
!methodProperties: {}!
varDireccionRemateResultante

	^varActual direccionRemateResultante.! !

!Penales methodsFor: 'play' stamp: 'asd 17/Sep/2026, 11:51:45 pm (UTC)'!
!methodProperties: {}!
varFuerzaResultanteDeAtajada

	^varActual fuerzaResultanteDeAtajada.! !

!Penales methodsFor: 'play' stamp: 'asd 17/Sep/2026, 11:51:45 pm (UTC)'!
!methodProperties: {}!
varFuerzaResultanteDeTiro

	^varActual fuerzaResultanteDeTiro.! !


!Penales methodsFor: 'validation' stamp: 'asd 17/Sep/2026, 11:47:34 pm (UTC)'!
!methodProperties: {}!
validarRangoCoordenadas: coordenadaDelantero y: coordenadaArquero

	(coordenadaDelantero between: 0@0 and: 2@2)ifFalse: [^self error: self class direccionTiroFueraDeRango.].
	(coordenadaArquero between: 0@0 and: 2@2)ifFalse: [^self error: self class direccionArqueroFueraDeRango.].! !


!Penales methodsFor: 'initialize' stamp: 'asd 15/Sep/2026, 11:49:34 pm (UTC)'!
!methodProperties: {}!
initialize

	puntajeDelantero := 0.
	puntajeArquero := 0.! !

!Penales methodsFor: 'initialize' stamp: 'asd 18/Sep/2026, 12:01:49 am (UTC)'!
!methodProperties: {}!
initializeWith: unDelantero and: unArquero

	delantero := unDelantero.
	arquero := unArquero.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Penales class' category: #Penales!
Penales class
	instanceVariableNames: ''!

!Penales class methodsFor: 'message errors' stamp: 'NR 19/Sep/2023, 9:12:49 am (UTC)'!
!methodProperties: {}!
direccionArqueroFueraDeRango
	
	^'El arquero debe lanzarse a coordenadas válidas'! !

!Penales class methodsFor: 'message errors' stamp: 'NR 19/Sep/2023, 9:12:32 am (UTC)'!
!methodProperties: {}!
direccionTiroFueraDeRango
	
	^'La pelota debe dirigirse a coordenadas válidas'! !


!Penales class methodsFor: 'instance creation' stamp: 'asd 15/Sep/2026, 11:43:43 pm (UTC)'!
!methodProperties: {}!
conDelantero: delantero yArquero: arquero

	^self new initializeWith: delantero and: arquero.! !


!classDefinition: #TipoDeJugada category: #Penales!
Object subclass: #TipoDeJugada
	instanceVariableNames: 'multiplicadorDeFuerza'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!TipoDeJugada methodsFor: 'access' stamp: 'asd 17/Sep/2026, 6:32:21 am (UTC)'!
!methodProperties: {}!
fuerzaDeJugada: unaPelota y: unaFuerza 

	self subclassResponsibility! !


!TipoDeJugada methodsFor: 'initialize' stamp: 'asd 16/Sep/2026, 12:42:56 am (UTC)'!
!methodProperties: {}!
initialize

	multiplicadorDeFuerza := 0.! !

!TipoDeJugada methodsFor: 'initialize' stamp: 'asd 16/Sep/2026, 12:42:36 am (UTC)'!
!methodProperties: {}!
initializeWith: unMultiplo

	multiplicadorDeFuerza := unMultiplo.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TipoDeJugada class' category: #Penales!
TipoDeJugada class
	instanceVariableNames: ''!

!TipoDeJugada class methodsFor: 'prototype' stamp: 'asd 17/Sep/2026, 1:06:55 am (UTC)'!
!methodProperties: {}!
atajadaSeTiraAntes
	
	^AtajadaSeTiraAntes new.! !

!TipoDeJugada class methodsFor: 'prototype' stamp: 'asd 17/Sep/2026, 1:07:27 am (UTC)'!
!methodProperties: {}!
atajadaSeTiraDespues
	
	^AtajadaSeTiraDespues new.! !

!TipoDeJugada class methodsFor: 'prototype' stamp: 'asd 17/Sep/2026, 7:18:52 am (UTC)'!
!methodProperties: {}!
tiroAColocar
	
	^TiroAColocar new.! !

!TipoDeJugada class methodsFor: 'prototype' stamp: 'asd 17/Sep/2026, 7:18:57 am (UTC)'!
!methodProperties: {}!
tiroAMatar
	
	^TiroAMatar new.! !


!classDefinition: #Atajada category: #Penales!
TipoDeJugada subclass: #Atajada
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Atajada methodsFor: 'access' stamp: 'asd 18/Sep/2026, 3:27:34 am (UTC)'!
!methodProperties: {}!
atajarCon: fuerzaResultanteArquero y: fuerzaResultanteDelantero

	^fuerzaResultanteArquero >= fuerzaResultanteDelantero! !

!Atajada methodsFor: 'access' stamp: 'asd 17/Sep/2026, 11:16:36 pm (UTC)'!
!methodProperties: {}!
fuerzaDeJugada: unaPelota y: unaFuerza y: unTipoDeTiro  

	self subclassResponsibility! !

!Atajada methodsFor: 'access' stamp: 'asd 18/Sep/2026, 2:12:30 am (UTC)'!
!methodProperties: {}!
intersepcionSoloX: coordenadaTiro y: coordenadaArquero

	^(coordenadaArquero x = coordenadaTiro x).! !

!Atajada methodsFor: 'access' stamp: 'asd 18/Sep/2026, 3:19:21 am (UTC)'!
!methodProperties: {}!
intersepcionSoloY: coordenadaTiro y: coordenadaArquero

	^(coordenadaArquero y = coordenadaTiro y).! !

!Atajada methodsFor: 'access' stamp: 'asd 18/Sep/2026, 2:12:48 am (UTC)'!
!methodProperties: {}!
intersepcionTotal: coordenadaTiro y: coordenadaArquero

	^(coordenadaArquero = coordenadaTiro).! !

!Atajada methodsFor: 'access' stamp: 'asd 17/Sep/2026, 9:41:06 pm (UTC)'!
!methodProperties: {}!
seIntercepto: coordenadaTiro y: coordenadaArquero y: unaPelota  

	self subclassResponsibility! !


!classDefinition: #AtajadaSeTiraAntes category: #Penales!
Atajada subclass: #AtajadaSeTiraAntes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!AtajadaSeTiraAntes methodsFor: 'access' stamp: 'asd 17/Sep/2026, 11:33:43 pm (UTC)'!
!methodProperties: {}!
fuerzaDeJugada: unaPelota y: unaFuerza y: unTipoDeTiro  

	^(unaFuerza * multiplicadorDeFuerza - (unaFuerza * unTipoDeTiro penalizacionArquero)) + (unaFuerza * unaPelota fuerzaArquero).! !

!AtajadaSeTiraAntes methodsFor: 'access' stamp: 'asd 18/Sep/2026, 2:22:41 am (UTC)'!
!methodProperties: {}!
fuerzaDeJugadaAColocarConJabulani: unaFuerza

	^unaFuerza * multiplicadorDeFuerza.! !

!AtajadaSeTiraAntes methodsFor: 'access' stamp: 'asd 18/Sep/2026, 3:22:55 am (UTC)'!
!methodProperties: {}!
fuerzaDeJugadaAColocarConPlayera: unaFuerza

	^unaFuerza*2.! !

!AtajadaSeTiraAntes methodsFor: 'access' stamp: 'asd 18/Sep/2026, 2:22:28 am (UTC)'!
!methodProperties: {}!
fuerzaDeJugadaAMatarConJabulani: unaFuerza

	^unaFuerza.! !

!AtajadaSeTiraAntes methodsFor: 'access' stamp: 'asd 18/Sep/2026, 3:23:07 am (UTC)'!
!methodProperties: {}!
fuerzaDeJugadaAMatarConPlayera: unaFuerza

	^unaFuerza*1.2.! !

!AtajadaSeTiraAntes methodsFor: 'access' stamp: 'asd 18/Sep/2026, 2:21:36 am (UTC)'!
!methodProperties: {}!
fuerzaDeJugadaConPlayera: unaFuerza

	^unaFuerza * multiplicadorDeFuerza + (unaFuerza * 0.2).! !

!AtajadaSeTiraAntes methodsFor: 'access' stamp: 'asd 18/Sep/2026, 3:29:32 am (UTC)'!
!methodProperties: {}!
interceptarAColocarConJabulani: coordenadaTiro y: coordenadaArquero

	^self intersepcionTotal: coordenadaTiro y: coordenadaArquero.! !

!AtajadaSeTiraAntes methodsFor: 'access' stamp: 'asd 18/Sep/2026, 3:29:52 am (UTC)'!
!methodProperties: {}!
interceptarAColocarConPlayera: coordenadaTiro y: coordenadaArquero

	^self intersepcionTotal: coordenadaTiro y: coordenadaArquero.! !

!AtajadaSeTiraAntes methodsFor: 'access' stamp: 'asd 18/Sep/2026, 2:13:17 am (UTC)'!
!methodProperties: {}!
interceptarAMatarConJabulani: coordenadaTiro y: coordenadaArquero

	^self intersepcionSoloX: coordenadaTiro y: coordenadaArquero.! !

!AtajadaSeTiraAntes methodsFor: 'access' stamp: 'asd 18/Sep/2026, 3:19:03 am (UTC)'!
!methodProperties: {}!
interceptarAMatarConPlayera: coordenadaTiro y: coordenadaArquero

	^self intersepcionSoloY: coordenadaTiro y: coordenadaArquero.! !

!AtajadaSeTiraAntes methodsFor: 'access' stamp: 'asd 17/Sep/2026, 9:41:06 pm (UTC)'!
!methodProperties: {}!
seIntercepto: coordenadaTiro y: coordenadaArquero y: unaPelota  

	^(coordenadaArquero = coordenadaTiro).! !

!AtajadaSeTiraAntes methodsFor: 'access' stamp: 'asd 18/Sep/2026, 2:41:22 am (UTC)'!
!methodProperties: {}!
sePateoAMatarConJabulani: unVar y: fuerzaArquero y: fuerzaDelantero y: coordenadaTiro y: coordenadaAtajada

	|coordenadaResultante fuerzaResultante resultado|
	
	coordenadaResultante := self interceptarAMatarConJabulani: coordenadaTiro y: coordenadaAtajada.
	fuerzaResultante := self fuerzaDeJugadaAMatarConJabulani: fuerzaArquero.
	resultado := self atajarCon: fuerzaResultante y: fuerzaDelantero. 
	
	unVar resultadoPenalFue: resultado conCoordenadaArquero: coordenadaResultante yFuerzaResultanteArquero: fuerzaResultante.! !

!AtajadaSeTiraAntes methodsFor: 'access' stamp: 'asd 18/Sep/2026, 3:13:10 am (UTC)'!
!methodProperties: {}!
sePateoAMatarConPlayera: unVar y: fuerzaArquero y: fuerzaDelantero y: coordenadaTiro y: coordenadaAtajada

	|coordenadaResultante fuerzaResultante resultado|
	
	coordenadaResultante := self interceptarAMatarConPlayera: coordenadaTiro y: coordenadaAtajada.
	fuerzaResultante := self fuerzaDeJugadaAMatarConPlayera: fuerzaArquero.
	resultado := self atajarCon: fuerzaResultante y: fuerzaDelantero. 
	
	unVar resultadoPenalFue: resultado conCoordenadaArquero: coordenadaResultante yFuerzaResultanteArquero: fuerzaResultante.! !


!AtajadaSeTiraAntes methodsFor: 'initialize' stamp: 'asd 17/Sep/2026, 1:05:18 am (UTC)'!
!methodProperties: {}!
initialize

	multiplicadorDeFuerza :=1.5 .! !


!classDefinition: #AtajadaSeTiraDespues category: #Penales!
Atajada subclass: #AtajadaSeTiraDespues
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!AtajadaSeTiraDespues methodsFor: 'access' stamp: 'asd 17/Sep/2026, 11:16:36 pm (UTC)'!
!methodProperties: {}!
fuerzaDeJugada: unaPelota y: unaFuerza y: unTipoDeTiro  

	^unaFuerza * multiplicadorDeFuerza.! !

!AtajadaSeTiraDespues methodsFor: 'access' stamp: 'asd 18/Sep/2026, 3:41:11 am (UTC)'!
!methodProperties: {}!
interceptarAColocarConJabulani: coordenadaTiro y: coordenadaArquero

	^self intersepcionTotal: coordenadaTiro y: coordenadaArquero.! !

!AtajadaSeTiraDespues methodsFor: 'access' stamp: 'asd 18/Sep/2026, 3:40:25 am (UTC)'!
!methodProperties: {}!
interceptarAColocarConPlayera: coordenadaTiro y: coordenadaArquero

	^false.! !

!AtajadaSeTiraDespues methodsFor: 'access' stamp: 'asd 18/Sep/2026, 3:38:28 am (UTC)'!
!methodProperties: {}!
interceptarAMatarConJabulani: coordenadaTiro y: coordenadaArquero

	^false.! !

!AtajadaSeTiraDespues methodsFor: 'access' stamp: 'asd 18/Sep/2026, 3:39:02 am (UTC)'!
!methodProperties: {}!
interceptarAMatarConPlayera: coordenadaTiro y: coordenadaArquero

	^true.! !

!AtajadaSeTiraDespues methodsFor: 'access' stamp: 'asd 17/Sep/2026, 9:49:26 pm (UTC)'!
!methodProperties: {}!
seIntercepto: coordenadaTiro y: coordenadaArquero y: unaPelota  

	^(coordenadaArquero x = coordenadaTiro x) and: unaPelota visiblieAnteElVar not.! !

!AtajadaSeTiraDespues methodsFor: 'access' stamp: 'asd 18/Sep/2026, 3:47:17 am (UTC)'!
!methodProperties: {}!
sePateoAMatarConJabulani: unVar y: fuerzaArquero y: fuerzaDelantero y: coordenadaTiro y: coordenadaAtajada

	|coordenadaResultante fuerzaResultante resultado|
	
	coordenadaResultante := self interceptarAMatarConJabulani: coordenadaTiro y: coordenadaAtajada.
	fuerzaResultante := self fuerzaDeJugadaAMatarConJabulani: fuerzaArquero.
	resultado := self atajarCon: fuerzaResultante y: fuerzaDelantero. 
	
	unVar resultadoPenalFue: resultado conCoordenadaArquero: coordenadaResultante yFuerzaResultanteArquero: fuerzaResultante.! !

!AtajadaSeTiraDespues methodsFor: 'access' stamp: 'asd 18/Sep/2026, 3:47:31 am (UTC)'!
!methodProperties: {}!
sePateoAMatarConPlayera: unVar y: fuerzaArquero y: fuerzaDelantero y: coordenadaTiro y: coordenadaAtajada

	|coordenadaResultante fuerzaResultante resultado|
	
	coordenadaResultante := self interceptarAMatarConPlayera: coordenadaTiro y: coordenadaAtajada.
	fuerzaResultante := self fuerzaDeJugadaAMatarConPlayera: fuerzaArquero.
	resultado := self atajarCon: fuerzaResultante y: fuerzaDelantero. 
	
	unVar resultadoPenalFue: resultado conCoordenadaArquero: coordenadaResultante yFuerzaResultanteArquero: fuerzaResultante.! !


!AtajadaSeTiraDespues methodsFor: 'initialize' stamp: 'asd 17/Sep/2026, 12:56:57 am (UTC)'!
!methodProperties: {}!
initialize

	multiplicadorDeFuerza :=1.! !


!classDefinition: #Tiro category: #Penales!
TipoDeJugada subclass: #Tiro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Tiro methodsFor: 'access' stamp: 'asd 18/Sep/2026, 1:37:18 am (UTC)'!
!methodProperties: {}!
fuerzaDeJugada: unaPelota y: unaFuerza y: coordenadaTiro

	self subclassResponsibility! !

!Tiro methodsFor: 'access' stamp: 'asd 18/Sep/2026, 1:36:11 am (UTC)'!
!methodProperties: {}!
patearCon: unVar y:unaFuerza y: unaPelota

	^self subclassResponsibility.! !


!classDefinition: #TiroAColocar category: #Penales!
Tiro subclass: #TiroAColocar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!TiroAColocar methodsFor: 'access' stamp: 'asd 17/Sep/2026, 6:50:14 am (UTC)'!
!methodProperties: {}!
coordenadaJugada: coordenadaTiro

	^coordenadaTiro.! !

!TiroAColocar methodsFor: 'access' stamp: 'asd 17/Sep/2026, 9:55:31 pm (UTC)'!
!methodProperties: {}!
fuerzaDeJugada: unaPelota y: unaFuerza 

	|fuerzaJugada|
	
	fuerzaJugada := unaFuerza * multiplicadorDeFuerza.
	
	^fuerzaJugada - (fuerzaJugada * unaPelota penalizacionDelantero).! !

!TiroAColocar methodsFor: 'access' stamp: 'asd 17/Sep/2026, 11:34:01 pm (UTC)'!
!methodProperties: {}!
penalizacionArquero

	^0.! !


!TiroAColocar methodsFor: 'initialize' stamp: 'asd 17/Sep/2026, 6:50:25 am (UTC)'!
!methodProperties: {}!
initialize

	multiplicadorDeFuerza := 0.5.! !


!classDefinition: #TiroAMatar category: #Penales!
Tiro subclass: #TiroAMatar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!TiroAMatar methodsFor: 'access' stamp: 'asd 17/Sep/2026, 10:31:56 pm (UTC)'!
!methodProperties: {}!
coordenadaJugada: coordenadaTiro

	|coordenadaResultante coordenadasAngulos|
	
	coordenadasAngulos := {0@0. 0@2. 2@0. 2@2}.	
	coordenadaResultante := (coordenadaTiro x @1).
	
	(coordenadasAngulos includes: coordenadaTiro) ifTrue: [^coordenadaResultante.] ifFalse: [^coordenadaTiro.].! !

!TiroAMatar methodsFor: 'access' stamp: 'asd 17/Sep/2026, 9:32:12 pm (UTC)'!
!methodProperties: {}!
fuerzaDeJugada: unaPelota y: unaFuerza 

	^(unaFuerza * multiplicadorDeFuerza) + (unaFuerza * unaPelota fuerzaDelantero).! !

!TiroAMatar methodsFor: 'access' stamp: 'asd 18/Sep/2026, 2:59:14 am (UTC)'!
!methodProperties: {}!
patearCon: unVar y: unaFuerza y: unaPelota y: coordenadaTiro

	|coordenadaResultante fuerzaResultante| 
	
	coordenadaResultante := self coordenadaJugada: coordenadaTiro.
	fuerzaResultante  := self fuerzaDeJugada: unaFuerza y: unaPelota.

	unaPelota seTiroAMatar: unVar conFuerza: fuerzaResultante yCoordenadaResultante: coordenadaResultante.! !

!TiroAMatar methodsFor: 'access' stamp: 'asd 17/Sep/2026, 11:33:55 pm (UTC)'!
!methodProperties: {}!
penalizacionArquero

	^0.5.! !


!TiroAMatar methodsFor: 'initialize' stamp: 'asd 17/Sep/2026, 6:45:10 am (UTC)'!
!methodProperties: {}!
initialize

	multiplicadorDeFuerza := 1.! !


!classDefinition: #Var category: #Penales!
Object subclass: #Var
	instanceVariableNames: 'delantero arquero pelota atajo fuerzaResultanteDeAtajada fuerzaResultanteDeTiro'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!Var methodsFor: 'access' stamp: 'asd 18/Sep/2026, 2:43:38 am (UTC)'!
!methodProperties: {}!
arqueroAtajo

	^atajo.! !

!Var methodsFor: 'access' stamp: 'asd 17/Sep/2026, 9:21:02 pm (UTC)'!
!methodProperties: {}!
direccionAtajadaResultante

	^arquero direccionUltimaJugada.! !

!Var methodsFor: 'access' stamp: 'asd 17/Sep/2026, 10:22:00 pm (UTC)'!
!methodProperties: {}!
direccionRemateResultante

	^delantero direccionResultante.! !

!Var methodsFor: 'access' stamp: 'asd 18/Sep/2026, 2:44:14 am (UTC)'!
!methodProperties: {}!
fuerzaResultanteDeAtajada

	^fuerzaResultanteDeAtajada.! !

!Var methodsFor: 'access' stamp: 'asd 18/Sep/2026, 2:35:48 am (UTC)'!
!methodProperties: {}!
fuerzaResultanteDeAtajada: unaFuerza

	fuerzaResultanteDeAtajada := unaFuerza.! !

!Var methodsFor: 'access' stamp: 'asd 18/Sep/2026, 2:44:23 am (UTC)'!
!methodProperties: {}!
fuerzaResultanteDeTiro

	^fuerzaResultanteDeTiro.! !

!Var methodsFor: 'access' stamp: 'asd 18/Sep/2026, 2:36:18 am (UTC)'!
!methodProperties: {}!
fuerzaResultanteDeTiro: unaFuerza

	fuerzaResultanteDeTiro := unaFuerza.! !


!Var methodsFor: 'play' stamp: 'asd 18/Sep/2026, 2:52:52 am (UTC)'!
!methodProperties: {}!
actualizarDelanteroConFuerza: fuerzaResultante yCoordenada: coordenadaResultante

	delantero direccionUltimaJugada: coordenadaResultante.
	self fuerzaResultanteDeTiro: fuerzaResultante.! !

!Var methodsFor: 'play' stamp: 'asd 18/Sep/2026, 1:52:17 am (UTC)'!
!methodProperties: {}!
observarPenalConCoordenadas: coordenadaTiro y: coordenadaAtajada

	delantero direccionUltimaJugada: coordenadaTiro.
	arquero direccionUltimaJugada: coordenadaAtajada.
	
	delantero patearCon: self y: pelota.! !

!Var methodsFor: 'play' stamp: 'asd 18/Sep/2026, 2:43:16 am (UTC)'!
!methodProperties: {}!
resultadoPenalFue: seAtajo conCoordenadaArquero: coordenadaArquero yFuerzaResultanteArquero: fuerzaResultanteArquero

	arquero direccionUltimaJugada: coordenadaArquero.
	fuerzaResultanteDeAtajada := fuerzaResultanteArquero.
	atajo := seAtajo.
	! !

!Var methodsFor: 'play' stamp: 'asd 18/Sep/2026, 3:06:55 am (UTC)'!
!methodProperties: {}!
sePateoAMatarConJabulaniyFuerza: fuerzaResultante yCoordenada: coordenadaResultante

	self actualizarDelanteroConFuerza: fuerzaResultante yCoordenada: coordenadaResultante.
	
	arquero tePatearonAMatarConJabulani: self y: fuerzaResultanteDeTiro y: delantero direccionUltimaJugada.! !

!Var methodsFor: 'play' stamp: 'asd 18/Sep/2026, 3:11:23 am (UTC)'!
!methodProperties: {}!
sePateoAMatarConPlayerayFuerza: fuerzaResultante yCoordenada: coordenadaResultante

	self actualizarDelanteroConFuerza: fuerzaResultante yCoordenada: coordenadaResultante.
	
	arquero tePatearonAMatarConPlayera: self y: fuerzaResultanteDeTiro y: delantero direccionUltimaJugada.! !


!Var methodsFor: 'initialize' stamp: 'asd 17/Sep/2026, 6:00:22 am (UTC)'!
!methodProperties: {}!
initializeWith: unDelantero and: unArquero and: unaPelota

	delantero := unDelantero .
	arquero := unArquero .
	pelota := unaPelota .! !


!classDefinition: #PenalesTest category: #Penales!
TestCase subclass: #PenalesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Penales'!

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:05 am (UTC)'!
!methodProperties: {}!
test01DelanteroNoPuedeApuntarHaciaAfueraDelPaloIzquierdo
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: -1@0 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:05 am (UTC)'!
!methodProperties: {}!
test02DelanteroNoPuedeApuntarHaciaAfueraDelPaloDerecho
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 3@0 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:06 am (UTC)'!
!methodProperties: {}!
test03DelanteroNoPuedeApuntarHaciaAbajoDelArco
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@-1 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:05 am (UTC)'!
!methodProperties: {}!
test04DelanteroNoPuedeApuntarHaciaArribaDelTravesaño
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@3 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionTiroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:05 am (UTC)'!
!methodProperties: {}!
test05ArqueroNoPuedePasarseDelPaloIzquierdo
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: -1@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:05 am (UTC)'!
!methodProperties: {}!
test06ArqueroNoPuedePasarseDelPaloDerecho
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 3@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:06 am (UTC)'!
!methodProperties: {}!
test07ArqueroNoPuedeMeterseAbajoDeLaTierra
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@-1.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:05 am (UTC)'!
!methodProperties: {}!
test08ArqueroNoPuedeSaltarPorEncimaDelTravesaño
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@3.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penales direccionArqueroFueraDeRango equals: error messageText.
			self assert: 0 equals: juegoPenales puntajeDeDelantero.
			self assert: 0 equals: juegoPenales puntajeDeArquero.]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:05 am (UTC)'!
!methodProperties: {}!
test09DireccionesDiferentesGolDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"Caso general del juego..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 0@1.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante
	"varXXXX es por VAR, de 'Video Assistant Referee'"! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:05 am (UTC)'!
!methodProperties: {}!
test10MismasDireccionesInsuficienteFuerzaGolDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"Caso general del juego..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 10.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:05 am (UTC)'!
!methodProperties: {}!
test11MismasDireccionesSuficienteFuerzaAtajaArquero
	
	| arquero delantero juegoPenales pelota |
	
	"Caso general del juego..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:42:08 am (UTC)'!
!methodProperties: {}!
test12DelanteroQueTiraAColocarPierde50PorcFuerza
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"(delantero sacrificia potencia para ganar mayor precisión)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 50.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 50 equals: juegoPenales varFuerzaResultanteDeTiro.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:42:34 am (UTC)'!
!methodProperties: {}!
test13ArqueroQueEligeAntesDeTiroVsJabulaniAColocarSuma50PorcFuerzaExtra
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"El Arquero que elige donde tirarse antes de un tiro a colocar de jabulani gana 50% de su fuerza extra..."
	"(el arquero llega más cómodo y aprovecha mejor su fuerza)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 34.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 50 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 51 equals: juegoPenales varFuerzaResultanteDeAtajada.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:42:34 am (UTC)'!
!methodProperties: {}!
test14FuerzaInsuficienteDeArqueroQueEligeAntesDeTiroVsJabulaniAColocar
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"El Arquero que elige adonde tirarse antes de un tiro a colocar de jabulani gana 50% de su fuerza extra..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 32.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 0@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 50 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 48 equals: juegoPenales varFuerzaResultanteDeAtajada.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:05 am (UTC)'!
!methodProperties: {}!
test15ArqueroQueEsperaPorTiroYSeAdelantaVsJabulaniAColocarIgnoraAlturaTiro
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"El Arquero que espera y se adelanta ante un tiro de jabulani a colocar ignora la 2da coordenada (altura) al atajar..."	
	"(al adelanterse encara la pelota antes de que su elevación se transforme en un problema)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero  esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 50.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:42:08 am (UTC)'!
!methodProperties: {}!
test16PelotaPlayeraUsadaAColocarLeHacePerder20PorcFuerzaExtraAlDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"La humilde pelota playera le hace perder un 20% de fuerza adicional al delantero que la use para colocar... (no importa el arquero)"
	"(no debería ser reglamentaria... al menos no es de trapo, nos responden)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 1.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@2 arqueroSeLanzaEnDirección: 1@2.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeTiro! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:42:34 am (UTC)'!
!methodProperties: {}!
test17ArqueroQueEligeAntesDeTiroVsPlayeraAColocarSuma100PorcFuerzaExtra
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"La humilde pelota playera le hace perder un 20% adicional de fuerza al delantero que la use para colocar... (no importa el arquero)"
	"Arquero que elige donde lanzarse antes de un remate de una pelota playera lenta a colocar, gana un 100% de su fuerza extra..."
	"(a quien madruga...)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 20.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@0 equals: juegoPenales varDireccionRemateResultante.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeAtajada! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:42:34 am (UTC)'!
!methodProperties: {}!
test18FuerzaInsuficienteDeArqueroQueEligeAntesDeTiroVsPlayeraAColocar
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"La humilde pelota playera le hace perder un 20% adicional de fuerza al delantero que la use para colocar... (no importa el arquero)"
	"Arquero que elige donde lanzarse antes de un remate de una pelota playera lenta a colocar, gana un 100% de su fuerza extra..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 19.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 0@0 equals: juegoPenales varDireccionRemateResultante.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 38 equals: juegoPenales varFuerzaResultanteDeAtajada! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:05 am (UTC)'!
!methodProperties: {}!
test19ArqueroQueEsperaPorTiroYSeAdelantaVsPlayeraAColocarEsDescubiertoYPuntoParaDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"Arquero que espera y se adelanta ante tiro con la lenta pelota playera, siempre es descubierto por el Árbitro, y el punto se le otorga al Delantero..."
	"(lo que servía de ventaja ante la Jabulani rápida, acá es tan obvio por lo que tarda en llegar la pelota al arco, que marchás preso...)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero  esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 0@0 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:34:52 am (UTC)'!
!methodProperties: {}!
test20DelanteroTiraAMatarAlAnguloInferiorIzquierdoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	.
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:34:47 am (UTC)'!
!methodProperties: {}!
test21DelanteroTiraAMatarAlAnguloSuperiorIzquierdoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:34:41 am (UTC)'!
!methodProperties: {}!
test22DelanteroTiraAMatarAlAnguloInferiorDerechoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@0 arqueroSeLanzaEnDirección: 2@0.
	
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:34:36 am (UTC)'!
!methodProperties: {}!
test23DelanteroTiraAMatarAlAnguloSuperiorDerechoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:34:29 am (UTC)'!
!methodProperties: {}!
test24DelanteroTiraAMatarNoAlAnguloMantieneDireccionTiro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@2 arqueroSeLanzaEnDirección: 1@1.

	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:42:08 am (UTC)'!
!methodProperties: {}!
test25DelanteroTiraAMatarUsa100PorcFuerzaBase
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:150.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@0 arqueroSeLanzaEnDirección: 2@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante.
	self assert: 150 equals: juegoPenales varFuerzaResultanteDeTiro! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:42:08 am (UTC)'!
!methodProperties: {}!
test26DelanteroTiraAMatarConJabulaniGana20PorcFuerzaExtra
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando la jabulani rápida, el Delantero gana un 20% de fuerza extra... (no importa arquero)"
	"(Jabulani a matar es la elección de los guerreros Z)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 120.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@1.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante.
	self assert: 120 equals: juegoPenales varFuerzaResultanteDeTiro.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:42:08 am (UTC)'!
!methodProperties: {}!
test27FuerzaInsuficienteDeArqueroQueEligeAntesDeTiroVsJabulaniAMatar
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando la jabulani rápida, el Delantero gana un 20% de fuerza extra... (no importa arquero)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 119.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@1.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante.
	self assert: 120 equals: juegoPenales varFuerzaResultanteDeTiro.! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:06 am (UTC)'!
!methodProperties: {}!
test28ArqueroQueEligeAntesDeTiroVsJabulaniAMatarIgnoraAlturaTiro
	
	| arquero delantero juegoPenales pelota |
	
	"El Arquero que elige donde tirarse antes de un tiro de jabulani a matar, ignora la 2da coordenada (altura) al atajar..."		
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:05 am (UTC)'!
!methodProperties: {}!
test29ArqueroQueEsperaPorTiroYSeAdelantaVsJabulaniAMatarNuncaAtaja
	
	| arquero delantero juegoPenales pelota |
	
	"El Arquero que espera a ver la dirección del remate de una pelota jabulani rápida a matar antes de lanzarse, nunca la ataja sin importar nada, siquiera que se adelantó..."	
	"(su poder era de más de 9000!! era impresionante, no podía moverme, sólo la ví pasar... f )"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@1 arqueroSeLanzaEnDirección: 1@1.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 1@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:05 am (UTC)'!
!methodProperties: {}!
test30DelanteroQueNoPateaAlAnguloConPlayeraAMatarSuma2AAlturaDeDireccionPelotaAdentro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando una pelota playera a una dirección que no es un ángulo, la 2da coordenada del remate (altura) suma 2, es decir sale volando producto de su liviandez (y que quiere retornar al mar). Si la pelota se va fuera del arco, el puntaje va al arquero... (no importa arquero)"
	"(y voló.. y me hizo volar... y yo volé de él...  pero acá por la arbolada... y el voló.. y se estrelló por acá por la pared...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@0 arqueroSeLanzaEnDirección: 1@0.
	
	self assert: 1 equals: juegoPenales puntajeDeDelantero.
	self assert: 0 equals: juegoPenales puntajeDeArquero.
	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:05 am (UTC)'!
!methodProperties: {}!
test31DelanteroQueNoPateaAlAnguloConPlayeraAMatarSuma2AAlturaDeDireccionPelotaAfuera
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando una pelota playera a una dirección que no es un ángulo, la 2da coordenada del remate (altura) suma 2, es decir sale volando producto de su liviandez (y que quiere retornar al mar). Si la pelota se va fuera del arco, el puntaje va al arquero... (no importa arquero)"
	"(El caso auspiciado por el Pipita...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@1 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@3 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:05 am (UTC)'!
!methodProperties: {}!
test32ArqueroQueEligeAntesDeTiroVsPlayeraAMatarAlAnguloIgnoraAnchoTiro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si el arquero elige donde tirarse antes del tiro a matar de la pelota playera, ignora la 1ra coordenada del remate (ancho) al atajar..."
	"(con agacharse, quedarse parado, o saltar le alcanza...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 2@1.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:39:22 pm (UTC)'!
!methodProperties: {}!
test33ArqueroQueEligeAntesDeTiroVsPlayeraAMatarNoAlAnguloIgnoraAnchoTiro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' usando una pelota playera a una dirección que no es un ángulo, la 2da coordenada del remate (altura) suma 2, es decir sale volando producto de su liviandez (y que quiere retornar al mar). Si la pelota se va fuera del arco, el puntaje va al arquero... (no importa arquero)"
	"Si el arquero elige donde tirarse antes del tiro a matar de la pelota playera, ignora la 1ra coordenada del remate (ancho) al atajar..."
	"(con agacharse, quedarse parado, o saltar le alcanza...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 100.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@0 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'NR 24/Sep/2023, 9:41:05 am (UTC)'!
!methodProperties: {}!
test34ArqueroQueEsperaPorTiroYSeAdelantaVsPlayeraAMatarSiempreAtaja
	
	| arquero delantero juegoPenales pelota |
	
	"El Arquero que espera y se adelanta ante una pelota playera lenta a matar, siempre la ataja sin importar nada..."	
	"(como la pelota es taaaan lentaaa, el arquero se puede ir a tomar un cafe, verse una serie, volver y aún atajar la pelota habiendose tirado a cualquier lado. Pero igual es más rapida que cuando se la tira a colocar, donde indefectiblemente el arbitro lo detecta...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 1.
	
	juegoPenales := Penales conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0 equals: juegoPenales puntajeDeDelantero.
	self assert: 1 equals: juegoPenales puntajeDeArquero.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante! !
