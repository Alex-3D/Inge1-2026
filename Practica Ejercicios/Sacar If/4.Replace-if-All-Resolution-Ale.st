!classDefinition: #Vehicle category: #'4.Replace-if-All'!
Object subclass: #Vehicle
	instanceVariableNames: 'state type speed altitude engineType where'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-All'!

!Vehicle methodsFor: 'initialization' stamp: 'asd 2/Sep/2026, 6:17:06 am (UTC)'!
!methodProperties: {}!
initialize

	speed := 0 * kilometer / hour.
	altitude := 0 * meter! !

!Vehicle methodsFor: 'initialization' stamp: 'NR 7/Sep/2024, 11:26:13 am (UTC)'!
!methodProperties: {}!
initializeWithType: typeToTake engineType: anEngineType andSurroundings: surroundings

	state := #Off.
	type := typeToTake.
	engineType := anEngineType.
	where := surroundings.
	speed := 0 * kilometer / hour.
	altitude := 0 * meter! !


!Vehicle methodsFor: 'move' stamp: 'asd 2/Sep/2026, 7:08:02 am (UTC)'!
!methodProperties: {}!
accelerate

	self subclassResponsibility.
	
	"| acceleration |
	
	state = #Off ifTrue: [ self error: self canNotAccelerateErrorMessage ].

	engineType = #ElectricEngine ifTrue: [ acceleration := (speed + (5 * kilometer / hour)) * 2 ].
	engineType = #GasolineEngine ifTrue: [ acceleration := 10 * kilometer / hour ].
	engineType = #JetFueledEngine ifTrue: [ acceleration := ((speed amount + 1) ^ 2) * kilometer / hour ].

	type = #Helicopter
		ifTrue:[ speed := speed + acceleration.
			altitude := altitude + (5 * meter) ].
		
	type = #Motorcycle
		ifTrue:[ speed := speed + acceleration ].
		
	where = #city ifTrue: [ speed > (70 * kilometer / hour) ifTrue: [ speed := 70 * kilometer / hour ] ].
	where = #openRoad ifTrue: [ speed > (130 * kilometer / hour) ifTrue: [ speed := 130 * kilometer / hour ] ].
	where = #skies ifTrue: [ speed > (500 * kilometer / hour) ifTrue: [ speed := 500 * kilometer / hour ] ]."! !

!Vehicle methodsFor: 'move' stamp: 'asd 2/Sep/2026, 5:31:16 am (UTC)'!
!methodProperties: {}!
altitude

	^ altitude.! !

!Vehicle methodsFor: 'move' stamp: 'asd 2/Sep/2026, 6:53:05 am (UTC)'!
!methodProperties: {}!
altitude: anAltitude

	altitude := anAltitude! !

!Vehicle methodsFor: 'move' stamp: 'NR 7/Sep/2024, 9:24:00 pm (UTC)'!
!methodProperties: {}!
altitudeAt: anAltitude

	^ altitude = anAltitude! !

!Vehicle methodsFor: 'move' stamp: 'asd 2/Sep/2026, 5:27:57 am (UTC)'!
!methodProperties: {}!
speed

	^ speed.! !

!Vehicle methodsFor: 'move' stamp: 'asd 2/Sep/2026, 6:27:14 am (UTC)'!
!methodProperties: {}!
speed: aSpeed

	speed := aSpeed! !

!Vehicle methodsFor: 'move' stamp: 'NR 7/Sep/2024, 9:23:27 pm (UTC)'!
!methodProperties: {}!
speedAt: aSpeed

	^ speed = aSpeed! !


!Vehicle methodsFor: 'on/off' stamp: 'asd 2/Sep/2026, 6:04:04 am (UTC)'!
!methodProperties: {}!
turnOff

	self subclassResponsibility! !

!Vehicle methodsFor: 'on/off' stamp: 'asd 2/Sep/2026, 6:03:58 am (UTC)'!
!methodProperties: {}!
turnOn

	self subclassResponsibility! !


!Vehicle methodsFor: 'error messages' stamp: 'ARM 29/Apr/2024, 2:08:20 pm (UTC)'!
!methodProperties: {}!
canNotAccelerateErrorMessage

	type = #Helicopter ifTrue:[^'Can not fly when turned off'].
	type = #Motorcycle ifTrue:[^'Can not run when turned off'].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Vehicle class' category: #'4.Replace-if-All'!
Vehicle class
	instanceVariableNames: ''!

!Vehicle class methodsFor: 'instance creation' stamp: 'asd 2/Sep/2026, 6:35:53 am (UTC)'!
!methodProperties: {}!
autoNaftero

	^Automovile new initializeWithEngine: GasolineEngine new andLimiter: CityLimiter new .! !

!Vehicle class methodsFor: 'instance creation' stamp: 'asd 2/Sep/2026, 6:55:47 am (UTC)'!
!methodProperties: {}!
electricMotorcycle

	^Motorcycle new initializeWithEngine: ElectricEngine new andLimiter: CityLimiter new .

! !

!Vehicle class methodsFor: 'instance creation' stamp: 'asd 2/Sep/2026, 6:56:12 am (UTC)'!
!methodProperties: {}!
gasolineMotorcycle

	^Motorcycle new initializeWithEngine: GasolineEngine new andLimiter: OpenRoadLimiter new .! !

!Vehicle class methodsFor: 'instance creation' stamp: 'asd 2/Sep/2026, 7:10:35 am (UTC)'!
!methodProperties: {}!
helicopter

	^ Helicopter new initializeWithEngine: JetFueledEngine new andLimiter: SkiesLimiter new .! !

!Vehicle class methodsFor: 'instance creation' stamp: 'asd 2/Sep/2026, 6:48:13 am (UTC)'!
!methodProperties: {}!
motoElectrica

	^Motorcycle new initializeWithEngine: ElectricEngine new andLimiter: OpenRoadLimiter new .! !


!classDefinition: #FlingVehicle category: #'4.Replace-if-All'!
Vehicle subclass: #FlingVehicle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-All'!

!FlingVehicle methodsFor: 'move' stamp: 'asd 2/Sep/2026, 6:41:11 am (UTC)'!
!methodProperties: {}!
accelerate

	self subclassResponsibility! !


!FlingVehicle methodsFor: 'on/off' stamp: 'asd 2/Sep/2026, 6:40:51 am (UTC)'!
!methodProperties: {}!
turnOff

	self subclassResponsibility! !

!FlingVehicle methodsFor: 'on/off' stamp: 'asd 2/Sep/2026, 6:40:56 am (UTC)'!
!methodProperties: {}!
turnOn

	self subclassResponsibility! !


!classDefinition: #Helicopter category: #'4.Replace-if-All'!
FlingVehicle subclass: #Helicopter
	instanceVariableNames: 'vehicleState vehicleEngine vehicleLimiter'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-All'!

!Helicopter methodsFor: 'on/off' stamp: 'asd 2/Sep/2026, 7:02:24 am (UTC)'!
!methodProperties: {}!
turnOff

	vehicleState := vehicleState turnOff.
	self initialize.! !

!Helicopter methodsFor: 'on/off' stamp: 'asd 2/Sep/2026, 7:02:55 am (UTC)'!
!methodProperties: {}!
turnOn

	vehicleState := vehicleState turnOn.! !


!Helicopter methodsFor: 'move' stamp: 'asd 2/Sep/2026, 7:07:52 am (UTC)'!
!methodProperties: {}!
accelerate
	
	vehicleState accelerate: self.! !

!Helicopter methodsFor: 'move' stamp: 'asd 2/Sep/2026, 7:07:05 am (UTC)'!
!methodProperties: {}!
proceedAccelerate

	|finalSpeed|
	
	finalSpeed := (vehicleEngine accelerate: speed).
	self speed: (vehicleLimiter accelerate: finalSpeed).
	self altitude: altitude + (5 * meter)! !


!Helicopter methodsFor: 'initialization' stamp: 'asd 2/Sep/2026, 7:04:42 am (UTC)'!
!methodProperties: {}!
initializeWithEngine: anEngine andLimiter: aLimiter

	vehicleEngine := anEngine.
	vehicleLimiter := aLimiter .
	vehicleState := PowerOff new.! !


!classDefinition: #LandVehicle category: #'4.Replace-if-All'!
Vehicle subclass: #LandVehicle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-All'!

!LandVehicle methodsFor: 'move' stamp: 'asd 2/Sep/2026, 1:05:41 am (UTC)'!
!methodProperties: {}!
accelerate

	| acceleration |
	
	state = #Off ifTrue: [ self error: self canNotAccelerateErrorMessage ].

	engineType = #ElectricEngine ifTrue: [ acceleration := (speed + (5 * kilometer / hour)) * 2 ].
	engineType = #GasolineEngine ifTrue: [ acceleration := 10 * kilometer / hour ].
	engineType = #JetFueledEngine ifTrue: [ acceleration := ((speed amount + 1) ^ 2) * kilometer / hour ].

	type = #Helicopter
		ifTrue:[ speed := speed + acceleration.
			altitude := altitude + (5 * meter) ].
		
	type = #Motorcycle
		ifTrue:[ speed := speed + acceleration ].
		
	where = #city ifTrue: [ speed > (70 * kilometer / hour) ifTrue: [ speed := 70 * kilometer / hour ] ].
	where = #openRoad ifTrue: [ speed > (130 * kilometer / hour) ifTrue: [ speed := 130 * kilometer / hour ] ].
	where = #skies ifTrue: [ speed > (500 * kilometer / hour) ifTrue: [ speed := 500 * kilometer / hour ] ]! !


!LandVehicle methodsFor: 'on/off' stamp: 'asd 2/Sep/2026, 6:05:00 am (UTC)'!
!methodProperties: {}!
turnOff

	self subclassResponsibility! !

!LandVehicle methodsFor: 'on/off' stamp: 'asd 2/Sep/2026, 6:05:08 am (UTC)'!
!methodProperties: {}!
turnOn

	self subclassResponsibility! !


!classDefinition: #Automovile category: #'4.Replace-if-All'!
LandVehicle subclass: #Automovile
	instanceVariableNames: 'vehicleState vehicleEngine vehicleLimiter'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-All'!

!Automovile methodsFor: 'move' stamp: 'asd 2/Sep/2026, 6:18:44 am (UTC)'!
!methodProperties: {}!
accelerate

	vehicleState accelerate: self.
! !

!Automovile methodsFor: 'move' stamp: 'asd 2/Sep/2026, 6:27:54 am (UTC)'!
!methodProperties: {}!
proceedAccelerate

	|finalSpeed|
	
	finalSpeed := (vehicleEngine accelerate: speed).
	self speed: (vehicleLimiter accelerate: finalSpeed).! !


!Automovile methodsFor: 'initialization' stamp: 'asd 2/Sep/2026, 6:00:51 am (UTC)'!
!methodProperties: {}!
initializeWithEngine: anEngine andLimiter: aLimiter

	vehicleEngine := anEngine.
	vehicleLimiter := aLimiter .
	vehicleState := PowerOff new.
	

	! !


!Automovile methodsFor: 'on/off' stamp: 'asd 2/Sep/2026, 6:28:59 am (UTC)'!
!methodProperties: {}!
turnOff

	vehicleState := vehicleState turnOff.
	self initialize.! !

!Automovile methodsFor: 'on/off' stamp: 'asd 2/Sep/2026, 6:10:05 am (UTC)'!
!methodProperties: {}!
turnOn

	vehicleState := vehicleState turnOn.! !


!classDefinition: #Motorcycle category: #'4.Replace-if-All'!
LandVehicle subclass: #Motorcycle
	instanceVariableNames: 'vehicleState vehicleEngine vehicleLimiter'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-All'!

!Motorcycle methodsFor: 'move' stamp: 'asd 2/Sep/2026, 6:43:53 am (UTC)'!
!methodProperties: {}!
accelerate

	vehicleState accelerate: self.! !

!Motorcycle methodsFor: 'move' stamp: 'asd 2/Sep/2026, 7:00:04 am (UTC)'!
!methodProperties: {}!
proceedAccelerate

	|finalSpeed|
	
	finalSpeed := (vehicleEngine accelerate: speed).
	self speed: (vehicleLimiter accelerate: finalSpeed).! !


!Motorcycle methodsFor: 'initialization' stamp: 'asd 2/Sep/2026, 6:42:48 am (UTC)'!
!methodProperties: {}!
initializeWithEngine: anEngine andLimiter: aLimiter

	vehicleEngine := anEngine.
	vehicleLimiter := aLimiter .
	vehicleState := PowerOff new.
	
! !


!Motorcycle methodsFor: 'on/off' stamp: 'asd 2/Sep/2026, 7:02:05 am (UTC)'!
!methodProperties: {}!
turnOff

	vehicleState := vehicleState turnOff.
	self initialize.! !

!Motorcycle methodsFor: 'on/off' stamp: 'asd 2/Sep/2026, 6:13:03 am (UTC)'!
!methodProperties: {}!
turnOn

	vehicleState := vehicleState turnOn.! !


!classDefinition: #VehicleEngine category: #'4.Replace-if-All'!
Vehicle subclass: #VehicleEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-All'!

!VehicleEngine methodsFor: 'on/off' stamp: 'asd 2/Sep/2026, 6:04:04 am (UTC)'!
!methodProperties: {}!
turnOff

	state := #Off.
	speed := 0 * kilometer / hour! !

!VehicleEngine methodsFor: 'on/off' stamp: 'asd 2/Sep/2026, 6:03:58 am (UTC)'!
!methodProperties: {}!
turnOn

	state := #On! !


!classDefinition: #ElectricEngine category: #'4.Replace-if-All'!
VehicleEngine subclass: #ElectricEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-All'!

!ElectricEngine methodsFor: 'move' stamp: 'asd 1/Sep/2026, 2:13:36 am (UTC)'!
!methodProperties: {}!
accelerate: currentSpeed
	
	^currentSpeed + ((currentSpeed + (5 * kilometer / hour))* 2).
! !


!classDefinition: #GasolineEngine category: #'4.Replace-if-All'!
VehicleEngine subclass: #GasolineEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-All'!

!GasolineEngine methodsFor: 'move' stamp: 'asd 2/Sep/2026, 6:34:29 am (UTC)'!
!methodProperties: {}!
accelerate: currentSpeed
	
	^currentSpeed + (10 * kilometer / hour).
! !


!classDefinition: #JetFueledEngine category: #'4.Replace-if-All'!
VehicleEngine subclass: #JetFueledEngine
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-All'!

!JetFueledEngine methodsFor: 'move' stamp: 'asd 2/Sep/2026, 6:35:24 am (UTC)'!
!methodProperties: {}!
accelerate: currentSpeed
	
	^currentSpeed + (((currentSpeed amount + 1) ^ 2) * kilometer / hour).
! !


!classDefinition: #VehiclePowerState category: #'4.Replace-if-All'!
Vehicle subclass: #VehiclePowerState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-All'!

!VehiclePowerState methodsFor: 'move' stamp: 'asd 2/Sep/2026, 1:01:52 am (UTC)'!
!methodProperties: {}!
accelerate

	| acceleration |
	
	state = #Off ifTrue: [ self error: self canNotAccelerateErrorMessage ].

	engineType = #ElectricEngine ifTrue: [ acceleration := (speed + (5 * kilometer / hour)) * 2 ].
	engineType = #GasolineEngine ifTrue: [ acceleration := 10 * kilometer / hour ].
	engineType = #JetFueledEngine ifTrue: [ acceleration := ((speed amount + 1) ^ 2) * kilometer / hour ].

	type = #Helicopter
		ifTrue:[ speed := speed + acceleration.
			altitude := altitude + (5 * meter) ].
		
	type = #Motorcycle
		ifTrue:[ speed := speed + acceleration ].
		
	where = #city ifTrue: [ speed > (70 * kilometer / hour) ifTrue: [ speed := 70 * kilometer / hour ] ].
	where = #openRoad ifTrue: [ speed > (130 * kilometer / hour) ifTrue: [ speed := 130 * kilometer / hour ] ].
	where = #skies ifTrue: [ speed > (500 * kilometer / hour) ifTrue: [ speed := 500 * kilometer / hour ] ]! !


!VehiclePowerState methodsFor: 'on/off' stamp: 'asd 2/Sep/2026, 6:05:47 am (UTC)'!
!methodProperties: {}!
turnOff

	self subclassResponsibility! !

!VehiclePowerState methodsFor: 'on/off' stamp: 'asd 2/Sep/2026, 6:05:53 am (UTC)'!
!methodProperties: {}!
turnOn

	self subclassResponsibility! !


!classDefinition: #PowerOff category: #'4.Replace-if-All'!
VehiclePowerState subclass: #PowerOff
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-All'!

!PowerOff methodsFor: 'as yet unclassified' stamp: 'asd 2/Sep/2026, 5:35:19 am (UTC)'!
!methodProperties: {}!
accelerate: aVehicle

	aVehicle error: aVehicle canNotAccelerateErrorMessage.! !


!PowerOff methodsFor: 'on/off' stamp: 'asd 2/Sep/2026, 6:06:27 am (UTC)'!
!methodProperties: {}!
turnOff

	^self.! !

!PowerOff methodsFor: 'on/off' stamp: 'asd 2/Sep/2026, 6:06:17 am (UTC)'!
!methodProperties: {}!
turnOn

	^PowerOn new.! !


!classDefinition: #PowerOn category: #'4.Replace-if-All'!
VehiclePowerState subclass: #PowerOn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-All'!

!PowerOn methodsFor: 'as yet unclassified' stamp: 'asd 2/Sep/2026, 5:32:56 am (UTC)'!
!methodProperties: {}!
accelerate: aVehicle

	aVehicle proceedAccelerate.! !


!PowerOn methodsFor: 'on/off' stamp: 'asd 2/Sep/2026, 6:06:51 am (UTC)'!
!methodProperties: {}!
turnOff

	^ PowerOff new.! !

!PowerOn methodsFor: 'on/off' stamp: 'asd 2/Sep/2026, 6:07:01 am (UTC)'!
!methodProperties: {}!
turnOn

	^self.! !


!classDefinition: #VehicleSpeedLimiter category: #'4.Replace-if-All'!
Vehicle subclass: #VehicleSpeedLimiter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-All'!

!VehicleSpeedLimiter methodsFor: 'move' stamp: 'asd 2/Sep/2026, 1:01:52 am (UTC)'!
!methodProperties: {}!
accelerate

	| acceleration |
	
	state = #Off ifTrue: [ self error: self canNotAccelerateErrorMessage ].

	engineType = #ElectricEngine ifTrue: [ acceleration := (speed + (5 * kilometer / hour)) * 2 ].
	engineType = #GasolineEngine ifTrue: [ acceleration := 10 * kilometer / hour ].
	engineType = #JetFueledEngine ifTrue: [ acceleration := ((speed amount + 1) ^ 2) * kilometer / hour ].

	type = #Helicopter
		ifTrue:[ speed := speed + acceleration.
			altitude := altitude + (5 * meter) ].
		
	type = #Motorcycle
		ifTrue:[ speed := speed + acceleration ].
		
	where = #city ifTrue: [ speed > (70 * kilometer / hour) ifTrue: [ speed := 70 * kilometer / hour ] ].
	where = #openRoad ifTrue: [ speed > (130 * kilometer / hour) ifTrue: [ speed := 130 * kilometer / hour ] ].
	where = #skies ifTrue: [ speed > (500 * kilometer / hour) ifTrue: [ speed := 500 * kilometer / hour ] ]! !


!VehicleSpeedLimiter methodsFor: 'on/off' stamp: 'asd 2/Sep/2026, 6:04:04 am (UTC)'!
!methodProperties: {}!
turnOff

	state := #Off.
	speed := 0 * kilometer / hour! !

!VehicleSpeedLimiter methodsFor: 'on/off' stamp: 'asd 2/Sep/2026, 6:03:58 am (UTC)'!
!methodProperties: {}!
turnOn

	state := #On! !


!classDefinition: #CityLimiter category: #'4.Replace-if-All'!
VehicleSpeedLimiter subclass: #CityLimiter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-All'!

!CityLimiter methodsFor: 'as yet unclassified' stamp: 'asd 2/Sep/2026, 5:52:43 am (UTC)'!
!methodProperties: {}!
accelerate: aSpeedToCheck

	aSpeedToCheck > (70 * kilometer / hour) ifTrue: [ ^(70 * kilometer / hour) ].
	
	^aSpeedToCheck.! !


!classDefinition: #OpenRoadLimiter category: #'4.Replace-if-All'!
VehicleSpeedLimiter subclass: #OpenRoadLimiter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-All'!

!OpenRoadLimiter methodsFor: 'as yet unclassified' stamp: 'asd 2/Sep/2026, 6:39:01 am (UTC)'!
!methodProperties: {}!
accelerate: aSpeedToCheck

	aSpeedToCheck > (130 * kilometer / hour) ifTrue: [ ^(130 * kilometer / hour) ].
	
	^aSpeedToCheck.! !


!classDefinition: #SkiesLimiter category: #'4.Replace-if-All'!
VehicleSpeedLimiter subclass: #SkiesLimiter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-All'!

!SkiesLimiter methodsFor: 'as yet unclassified' stamp: 'asd 2/Sep/2026, 6:39:10 am (UTC)'!
!methodProperties: {}!
accelerate: aSpeedToCheck

	aSpeedToCheck > (500 * kilometer / hour) ifTrue: [ ^(500 * kilometer / hour) ].
	
	^aSpeedToCheck.! !


!classDefinition: #VehicleTests category: #'4.Replace-if-All'!
TestCase subclass: #VehicleTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-All'!

!VehicleTests methodsFor: 'testing' stamp: 'asd 2/Sep/2026, 6:54:29 am (UTC)'!
!methodProperties: {}!
test01LandVehicleCannotAccelerateWhileTurnedOff

	| landVehicle |
	
	landVehicle := Vehicle motoElectrica.
	
	self should: [ landVehicle accelerate ] 
	raise: Error 
	withExceptionDo: [ :error | error messageText = 'Can not run when turned off'.
		self assert: (landVehicle speedAt: (0 * kilometer / hour)) ]
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 7/Sep/2024, 9:27:17 pm (UTC)'!
!methodProperties: {}!
test02AirVehicleCannotAccelerateWhileTurnedOff

	| airVehicle |
	
	airVehicle := Vehicle helicopter.
	
	self should: [ airVehicle accelerate ] 
	raise: Error 
	withExceptionDo: [ :error | error messageText = 'Can not fly when turned off'.
		self assert: (airVehicle speedAt: (0 * kilometer / hour)).
		self assert: (airVehicle altitudeAt: (0 * meter)) ]
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 7/Sep/2024, 9:52:20 pm (UTC)'!
!methodProperties: {}!
test03ElectricVehicleAccelerateAsIntended

	| electricVehicle |
	
	electricVehicle := Vehicle electricMotorcycle.
	
	electricVehicle turnOn.
	self assert: (electricVehicle speedAt: 0 * kilometer / hour).
	
	electricVehicle accelerate.
	self assert: (electricVehicle speedAt: 10 * kilometer / hour).
	
	electricVehicle accelerate.
	self assert: (electricVehicle speedAt: 40 * kilometer / hour)
	
	
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 7/Sep/2024, 9:52:16 pm (UTC)'!
!methodProperties: {}!
test04GasolineVehicleAccelerateAsIntended

	| gasolineVehicle |
	
	gasolineVehicle := Vehicle gasolineMotorcycle.
	
	gasolineVehicle turnOn.
	self assert: (gasolineVehicle speedAt: 0 * kilometer / hour).
	
	gasolineVehicle accelerate.
	self assert: (gasolineVehicle speedAt: 10 * kilometer / hour).
	
	gasolineVehicle accelerate.
	self assert: (gasolineVehicle speedAt: 20 * kilometer / hour)
	
	
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 7/Sep/2024, 9:52:11 pm (UTC)'!
!methodProperties: {}!
test05JetFueledVehicleAccelerateAsIntended

	| jetFueledVehicle |
	
	jetFueledVehicle := Vehicle helicopter.
	
	jetFueledVehicle turnOn.
	self assert: (jetFueledVehicle speedAt: 0 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 1 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 5 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 41 * kilometer / hour)
	
	
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 7/Sep/2024, 9:47:14 pm (UTC)'!
!methodProperties: {}!
test06AirVehicleGoesUpAsItAcceleratesAsExpected

	| airVehicle |
	
	airVehicle := Vehicle helicopter.
	
	airVehicle turnOn.
	self assert: (airVehicle altitudeAt: 0 * meter).
	
	airVehicle accelerate.
	self assert: (airVehicle altitudeAt: 5 * meter).
	
	airVehicle accelerate.
	self assert: (airVehicle altitudeAt: 10 * meter)
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 7/Sep/2024, 9:52:05 pm (UTC)'!
!methodProperties: {}!
test07SpeedLimiterForCityLimitsSpeedAt70Kmh

	| cityVehicle |
	
	cityVehicle := Vehicle electricMotorcycle.
	
	cityVehicle turnOn.
	self assert: (cityVehicle speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ cityVehicle accelerate ].
	
	self assert: (cityVehicle speedAt: 70 * kilometer / hour)
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 7/Sep/2024, 9:53:50 pm (UTC)'!
!methodProperties: {}!
test08SpeedLimiterForOpenRoadLimitsSpeedAt130Kmh

	| openRoadVehicle |
	
	openRoadVehicle := Vehicle gasolineMotorcycle.
	
	openRoadVehicle turnOn.
	self assert: (openRoadVehicle speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ openRoadVehicle accelerate ].
	
	self assert: (openRoadVehicle speedAt: 130 * kilometer / hour)
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'NR 7/Sep/2024, 9:55:32 pm (UTC)'!
!methodProperties: {}!
test09SpeedLimiterForAirTrafficLimitsSpeedAt500Kmh

	| vehicleInAir |
	
	vehicleInAir := Vehicle helicopter.
	
	vehicleInAir turnOn.
	self assert: (vehicleInAir speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ vehicleInAir accelerate ].
	
	self assert: (vehicleInAir speedAt: 500 * kilometer / hour)
	
	
	! !
