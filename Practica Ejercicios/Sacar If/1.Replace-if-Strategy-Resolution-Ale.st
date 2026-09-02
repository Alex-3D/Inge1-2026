!classDefinition: #Automobile category: #'1.Replace-if-Strategy'!
Object subclass: #Automobile
	instanceVariableNames: 'speed engineType'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Strategy'!

!Automobile methodsFor: 'initialization' stamp: 'asd 1/Sep/2026, 1:16:18 am (UTC)'!
!methodProperties: {}!
initializeWithEngineType: anEngine
	
	engineType := anEngine.
	speed := 0 * kilometer / hour! !


!Automobile methodsFor: 'move' stamp: 'asd 1/Sep/2026, 2:15:54 am (UTC)'!
!methodProperties: {}!
accelerate

	speed := engineType accelerate: speed.! !


!Automobile methodsFor: 'as yet unclassified' stamp: 'asd 1/Sep/2026, 2:18:17 am (UTC)'!
!methodProperties: {}!
speed

	^speed.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Automobile class' category: #'1.Replace-if-Strategy'!
Automobile class
	instanceVariableNames: 'engineType amount'!

!Automobile class methodsFor: 'instance creation' stamp: 'asd 1/Sep/2026, 1:32:00 am (UTC)'!
!methodProperties: {}!
electric

	^ self new initializeWithEngineType: ElectricEngine new.

! !

!Automobile class methodsFor: 'instance creation' stamp: 'asd 1/Sep/2026, 1:32:06 am (UTC)'!
!methodProperties: {}!
gasoline

	^ self new initializeWithEngineType: GasolineEngine new.! !

!Automobile class methodsFor: 'instance creation' stamp: 'asd 1/Sep/2026, 1:32:10 am (UTC)'!
!methodProperties: {}!
jetFueled

	^ self new initializeWithEngineType:  JetFueledEngine new.! !


!classDefinition: #ElectricEngine category: #'1.Replace-if-Strategy'!
Automobile subclass: #ElectricEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Strategy'!

!ElectricEngine methodsFor: 'move' stamp: 'asd 1/Sep/2026, 2:13:36 am (UTC)'!
!methodProperties: {}!
accelerate: currentSpeed
	
	^currentSpeed + ((currentSpeed + (5 * kilometer / hour))* 2).
! !


!classDefinition: #GasolineEngine category: #'1.Replace-if-Strategy'!
Automobile subclass: #GasolineEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Strategy'!

!GasolineEngine methodsFor: 'move' stamp: 'asd 1/Sep/2026, 2:14:31 am (UTC)'!
!methodProperties: {}!
accelerate: currentSpeed
	
	^currentSpeed + (10 * kilometer / hour).! !


!classDefinition: #JetFueledEngine category: #'1.Replace-if-Strategy'!
Automobile subclass: #JetFueledEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Strategy'!

!JetFueledEngine methodsFor: 'move' stamp: 'asd 1/Sep/2026, 2:15:18 am (UTC)'!
!methodProperties: {}!
accelerate: currentSpeed
	
	^currentSpeed + (((currentSpeed amount + 1) ^ 2) * kilometer / hour).! !
