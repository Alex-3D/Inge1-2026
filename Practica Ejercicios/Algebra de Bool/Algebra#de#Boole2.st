!classDefinition: #AlgebraDeBooleTest category: 'Algebra de Boole'!
DenotativeObject subclass: #AlgebraDeBooleTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Algebra de Boole'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AlgebraDeBooleTest class' category: 'Algebra de Boole'!
AlgebraDeBooleTest class
	instanceVariableNames: ''!

!AlgebraDeBooleTest class methodsFor: 'as yet unclassified' stamp: 'asd 19/Aug/2026, 2:58:04 am (UTC)'!
!methodProperties: {}!
testVerdaderoNegadoEsFalso

	Assert that: Verdadero negado isEqualTo: Falso.! !

!AlgebraDeBooleTest class methodsFor: 'as yet unclassified' stamp: 'asd 19/Aug/2026, 5:17:43 am (UTC)'!
!methodProperties: {}!
testVerdaderoYVerdaderoEsVerdadero

	Assert that: (Verdadero y: Verdadero) isEqualTo: Verdadero.! !

!AlgebraDeBooleTest class methodsFor: 'test' stamp: 'ARM 3/26/2018 19:39:46'!
test01NegacionDeVerdaderoEsFalso

	Assert that: Verdadero no isEqualTo: Falso! !


!classDefinition: #Falso category: 'Algebra de Boole'!
DenotativeObject subclass: #Falso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Algebra de Boole'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Falso class' category: 'Algebra de Boole'!
Falso class
	instanceVariableNames: ''!

!Falso class methodsFor: 'as yet unclassified' stamp: 'asd 19/Aug/2026, 2:37:56 am (UTC)'!
!methodProperties: {}!
negado
	
	^Verdadero ! !

!Falso class methodsFor: 'as yet unclassified' stamp: 'asd 19/Aug/2026, 2:48:39 am (UTC)'!
!methodProperties: {}!
y: UnBooleano 
	
	^self.! !


!classDefinition: #Verdadero category: 'Algebra de Boole'!
DenotativeObject subclass: #Verdadero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Algebra de Boole'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Verdadero class' category: 'Algebra de Boole'!
Verdadero class
	instanceVariableNames: ''!

!Verdadero class methodsFor: 'as yet unclassified' stamp: 'asd 19/Aug/2026, 2:33:25 am (UTC)'!
!methodProperties: {}!
negado

	^Falso! !

!Verdadero class methodsFor: 'as yet unclassified' stamp: 'asd 19/Aug/2026, 2:49:58 am (UTC)'!
!methodProperties: {}!
o: UnBooleano

	^self ! !

!Verdadero class methodsFor: 'as yet unclassified' stamp: 'asd 19/Aug/2026, 2:47:11 am (UTC)'!
!methodProperties: {}!
y: UnBooleano 
	
	^UnBooleano ! !
