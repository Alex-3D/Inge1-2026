!classDefinition: #Vehicle category: #'3.Replace-if-Type+State'!
Object subclass: #Vehicle
	instanceVariableNames: 'vehicleType'
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!Vehicle methodsFor: 'initialization' stamp: 'asd 1/Sep/2026, 9:30:40 pm (UTC)'!
!methodProperties: {}!
inicializeWith: aVeicle

	vehicleType := aVeicle .! !


!Vehicle methodsFor: 'move' stamp: 'asd 1/Sep/2026, 9:02:05 pm (UTC)'!
!methodProperties: {}!
accelerate

	vehicleType accelerate.! !


!Vehicle methodsFor: 'on/off' stamp: 'asd 1/Sep/2026, 9:00:27 pm (UTC)'!
!methodProperties: {}!
turnOff
	vehicleType := vehicleType turnOff .! !

!Vehicle methodsFor: 'on/off' stamp: 'asd 1/Sep/2026, 9:00:15 pm (UTC)'!
!methodProperties: {}!
turnOn
	vehicleType := vehicleType turnOn .! !


!Vehicle methodsFor: 'error messages' stamp: 'asd 1/Sep/2026, 7:45:52 pm (UTC)'!
!methodProperties: {}!
canNotAccelerateErrorMessage

	self subclassResponsibility! !


!Vehicle methodsFor: 'as yet unclassified' stamp: 'asd 1/Sep/2026, 9:37:20 pm (UTC)'!
!methodProperties: {}!
speed

	^vehicleType speed .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Vehicle class' category: #'3.Replace-if-Type+State'!
Vehicle class
	instanceVariableNames: ''!

!Vehicle class methodsFor: 'instance creation' stamp: 'asd 1/Sep/2026, 9:28:28 pm (UTC)'!
!methodProperties: {}!
helicopter

	^self new inicializeWith: HelicopterOff new.! !

!Vehicle class methodsFor: 'instance creation' stamp: 'asd 1/Sep/2026, 9:26:03 pm (UTC)'!
!methodProperties: {}!
motorcycle

	^self new inicializeWith: MotorcycleOff new.! !


!classDefinition: #HelicopterOff category: #'3.Replace-if-Type+State'!
Vehicle subclass: #HelicopterOff
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!HelicopterOff methodsFor: 'move' stamp: 'asd 1/Sep/2026, 7:56:04 pm (UTC)'!
!methodProperties: {}!
accelerate

	self error: self canNotAccelerateErrorMessage.
! !


!HelicopterOff methodsFor: 'error messages' stamp: 'asd 1/Sep/2026, 7:54:12 pm (UTC)'!
!methodProperties: {}!
canNotAccelerateErrorMessage

	type = #Helicopter ifTrue:[^'Can not fly when turned off'].
	type = #Motorcycle ifTrue:[^'Can not run when turned off'].! !



!HelicopterOff methodsFor: 'as yet unclassified' stamp: 'asd 1/Sep/2026, 9:36:04 pm (UTC)'!
!methodProperties: {}!
speed

	self error: self canNotAccelerateErrorMessage.! !

!HelicopterOff methodsFor: 'as yet unclassified' stamp: 'asd 1/Sep/2026, 8:41:06 pm (UTC)'!
!methodProperties: {}!
turnOn

	^HelicopterOn new.! !


!classDefinition: #HelicopterOn category: #'3.Replace-if-Type+State'!
Vehicle subclass: #HelicopterOn
	instanceVariableNames: 'speed altitude'
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!HelicopterOn methodsFor: 'move' stamp: 'asd 1/Sep/2026, 7:55:48 pm (UTC)'!
!methodProperties: {}!
accelerate

	speed := speed + (10 * kilometer / hour).
			altitude := altitude + (5 * meter).! !


!HelicopterOn methodsFor: 'error messages' stamp: 'asd 1/Sep/2026, 7:45:52 pm (UTC)'!
!methodProperties: {}!
canNotAccelerateErrorMessage

	type = #Helicopter ifTrue:[^'Can not fly when turned off'].
	type = #Motorcycle ifTrue:[^'Can not run when turned off'].! !


!HelicopterOn methodsFor: 'initialization' stamp: 'asd 1/Sep/2026, 8:42:47 pm (UTC)'!
!methodProperties: {}!
initialize

	speed := 0 * kilometer / hour.
	altitude := 0 * meter! !


!HelicopterOn methodsFor: 'as yet unclassified' stamp: 'asd 1/Sep/2026, 9:36:33 pm (UTC)'!
!methodProperties: {}!
speed

	^speed .! !

!HelicopterOn methodsFor: 'as yet unclassified' stamp: 'asd 1/Sep/2026, 8:42:19 pm (UTC)'!
!methodProperties: {}!
turnOff
	
	^HelicopterOff new.! !


!classDefinition: #MotorcycleOff category: #'3.Replace-if-Type+State'!
Vehicle subclass: #MotorcycleOff
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!MotorcycleOff methodsFor: 'move' stamp: 'asd 1/Sep/2026, 7:55:02 pm (UTC)'!
!methodProperties: {}!
accelerate

	self error: self canNotAccelerateErrorMessage.! !


!MotorcycleOff methodsFor: 'error messages' stamp: 'asd 1/Sep/2026, 7:53:59 pm (UTC)'!
!methodProperties: {}!
canNotAccelerateErrorMessage

	type = #Helicopter ifTrue:[^'Can not fly when turned off'].
	type = #Motorcycle ifTrue:[^'Can not run when turned off'].! !



!MotorcycleOff methodsFor: 'on/off' stamp: 'asd 1/Sep/2026, 7:58:41 pm (UTC)'!
!methodProperties: {}!
turnOn

	^MotorcycleOn new.! !


!MotorcycleOff methodsFor: 'as yet unclassified' stamp: 'asd 1/Sep/2026, 9:36:44 pm (UTC)'!
!methodProperties: {}!
speed

	self error: self canNotAccelerateErrorMessage.! !


!classDefinition: #MotorcycleOn category: #'3.Replace-if-Type+State'!
Vehicle subclass: #MotorcycleOn
	instanceVariableNames: 'speed'
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!MotorcycleOn methodsFor: 'move' stamp: 'asd 1/Sep/2026, 7:54:39 pm (UTC)'!
!methodProperties: {}!
accelerate

	speed := speed + (20 * kilometer / hour).! !


!MotorcycleOn methodsFor: 'error messages' stamp: 'asd 1/Sep/2026, 7:45:52 pm (UTC)'!
!methodProperties: {}!
canNotAccelerateErrorMessage

	type = #Helicopter ifTrue:[^'Can not fly when turned off'].
	type = #Motorcycle ifTrue:[^'Can not run when turned off'].! !


!MotorcycleOn methodsFor: 'initialization' stamp: 'asd 1/Sep/2026, 8:31:11 pm (UTC)'!
!methodProperties: {}!
initialize

	speed := 0 * kilometer / hour.! !


!MotorcycleOn methodsFor: 'as yet unclassified' stamp: 'asd 1/Sep/2026, 9:36:51 pm (UTC)'!
!methodProperties: {}!
speed

	^speed .! !

!MotorcycleOn methodsFor: 'as yet unclassified' stamp: 'asd 1/Sep/2026, 8:00:08 pm (UTC)'!
!methodProperties: {}!
turnOff

	^MotorcycleOff new.! !
