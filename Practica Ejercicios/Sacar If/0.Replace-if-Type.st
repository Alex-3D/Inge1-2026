!classDefinition: #Vehicle category: #'0.Replace-if-Type'!
Object subclass: #Vehicle
	instanceVariableNames: 'speed'
	classVariableNames: ''
	poolDictionaries: ''
	category: '0.Replace-if-Type'!

!Vehicle methodsFor: 'as yet unclassified' stamp: 'asd 29/Aug/2026, 12:52:06 am (UTC)'!
!methodProperties: {}!
speed
	
	^speed ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Vehicle class' category: #'0.Replace-if-Type'!
Vehicle class
	instanceVariableNames: ''!

!Vehicle class methodsFor: 'instance creation' stamp: 'ARM 29/Apr/2024, 2:00:51 pm (UTC)'!
!methodProperties: {}!
helicopter

	^self new initializeWithType: #Helicopter! !

!Vehicle class methodsFor: 'instance creation' stamp: 'ARM 29/Apr/2024, 2:00:51 pm (UTC)'!
!methodProperties: {}!
motorcycle

	^self new initializeWithType: #Motorcycle! !


!classDefinition: #Helicopter category: #'0.Replace-if-Type'!
Vehicle subclass: #Helicopter
	instanceVariableNames: 'altitude'
	classVariableNames: ''
	poolDictionaries: ''
	category: '0.Replace-if-Type'!

!Helicopter methodsFor: 'move' stamp: 'asd 29/Aug/2026, 12:59:19 am (UTC)'!
!methodProperties: {}!
accelerate

	speed := speed + (10 * kilometer / hour).
	altitude := altitude + (5 * meter).! !


!Helicopter methodsFor: 'initialization' stamp: 'asd 29/Aug/2026, 1:10:29 am (UTC)'!
!methodProperties: {}!
initializeWithType
	speed := 0 * kilometer / hour.
	altitude := 0 * meter! !


!classDefinition: #Motorcycle category: #'0.Replace-if-Type'!
Vehicle subclass: #Motorcycle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '0.Replace-if-Type'!

!Motorcycle methodsFor: 'move' stamp: 'asd 29/Aug/2026, 1:20:25 am (UTC)'!
!methodProperties: {}!
accelerate
	speed := speed + (20 * kilometer / hour).! !


!Motorcycle methodsFor: 'initialization' stamp: 'asd 29/Aug/2026, 1:05:54 am (UTC)'!
!methodProperties: {}!
initializeWithType

	speed := 0 * kilometer / hour.! !
