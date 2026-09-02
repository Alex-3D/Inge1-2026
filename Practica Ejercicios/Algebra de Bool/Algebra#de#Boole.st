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

!AlgebraDeBooleTest class methodsFor: 'test' stamp: 'ARM 3/26/2018 20:00:38'!
test03VerdaderoYFalsoEsFalso

	Assert that: (Verdadero y: Falso) isEqualTo: Falso! !

!AlgebraDeBooleTest class methodsFor: 'test' stamp: 'ARM 3/26/2018 20:03:54'!
test04VerdaderoYVerdaderoEsVerdadero

	Assert that: (Verdadero y: Verdadero) isEqualTo: Verdadero! !

!AlgebraDeBooleTest class methodsFor: 'test' stamp: 'ARM 3/26/2018 20:06:19'!
test05FalsoYVerdaderoEsFalso

	Assert that: (Falso y: Verdadero) isEqualTo: Falso! !

!AlgebraDeBooleTest class methodsFor: 'test' stamp: 'ARM 3/26/2018 20:15:58'!
test06FalsoOVerdaderoEsVerdadero

	Assert that: (Falso o: Verdadero) isEqualTo: Verdadero! !

!AlgebraDeBooleTest class methodsFor: 'test' stamp: 'ARM 3/26/2018 20:21:45'!
test07VerdaderoOFalsoEsVerdadero

	Assert that: (Verdadero o: Falso) isEqualTo: Verdadero! !

!AlgebraDeBooleTest class methodsFor: 'test' stamp: 'ARM 9/5/2025 20:56:47'!
test08VerdaderoSiVerdaderoEvaluaClosure
	
	Verdadero siVerdadero: [^self].
	
	Assert fail
	! !

!AlgebraDeBooleTest class methodsFor: 'test' stamp: 'ARM 9/5/2025 21:01:06'!
test09VerdaderoSiFalsoNoEvaluaClosure

	Verdadero siFalso: [Assert fail]! !

!AlgebraDeBooleTest class methodsFor: 'test' stamp: 'ARM 9/5/2025 18:22:36'!
test10FalsoSiFalsoEvaluaClosure

	| evaluación |

	evaluación := #NoRealizada.
	
	Falso siFalso: [evaluación := #Realizada].

	Assert that: evaluación isEqualTo: #Realizada! !

!AlgebraDeBooleTest class methodsFor: 'test' stamp: 'ARM 9/5/2025 18:22:57'!
test11FalsoSiVerdaderoNoEvaluaClosure

	| evaluación |

	evaluación := #NoRealizada.
	
	Falso siVerdadero: [evaluación := #Realizada].

	Assert that: evaluación isEqualTo: #NoRealizada! !



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
