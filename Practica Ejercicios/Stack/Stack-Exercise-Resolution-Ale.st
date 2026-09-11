!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'size lastStakedElement'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialize' stamp: 'asd 9/Sep/2026, 6:53:56 am (UTC)'!
!methodProperties: {}!
initialize

	lastStakedElement := EmptyStack new.
	size := 0.! !


!OOStack methodsFor: 'accessing' stamp: 'asd 9/Sep/2026, 6:53:56 am (UTC)'!
!methodProperties: {}!
pop

	|anObjectToReturn|
	
	anObjectToReturn := lastStakedElement element.
	lastStakedElement := lastStakedElement nextStakedElement.
	size := size -1.
	
	^anObjectToReturn .! !

!OOStack methodsFor: 'accessing' stamp: 'asd 9/Sep/2026, 6:53:56 am (UTC)'!
!methodProperties: {}!
push: anObject
	
	|stackedElementToAdd|
	
	stackedElementToAdd := StackedElement new.
	stackedElementToAdd  element: anObject.
	stackedElementToAdd nextStakedElement: lastStakedElement.
	lastStakedElement := stackedElementToAdd.
	size := size + 1.! !

!OOStack methodsFor: 'accessing' stamp: 'asd 9/Sep/2026, 6:53:56 am (UTC)'!
!methodProperties: {}!
top

	^lastStakedElement element.! !


!OOStack methodsFor: 'status' stamp: 'asd 9/Sep/2026, 6:53:56 am (UTC)'!
!methodProperties: {}!
isEmpty

	^lastStakedElement isEmpty.! !

!OOStack methodsFor: 'status' stamp: 'asd 4/Sep/2026, 6:10:13 pm (UTC)'!
!methodProperties: {}!
size

	^size .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 14/Sep/2023, 11:12:21 am (UTC)'!
!methodProperties: {}!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !


!classDefinition: #StackElement category: #'Stack-Exercise'!
OOStack subclass: #StackElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #EmptyStack category: #'Stack-Exercise'!
StackElement subclass: #EmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyStack methodsFor: 'status' stamp: 'asd 4/Sep/2026, 5:43:16 pm (UTC)'!
!methodProperties: {}!
isEmpty

	^true.! !


!EmptyStack methodsFor: 'accessing' stamp: 'asd 4/Sep/2026, 6:51:24 pm (UTC)'!
!methodProperties: {}!
element

	^self error: self class stackEmptyErrorDescription.! !

!EmptyStack methodsFor: 'accessing' stamp: 'asd 4/Sep/2026, 6:51:37 pm (UTC)'!
!methodProperties: {}!
nextStackedElement

	^self error: self class stackEmptyErrorDescription.! !


!EmptyStack methodsFor: 'initialize' stamp: 'asd 4/Sep/2026, 5:59:25 pm (UTC)'!
!methodProperties: {}!
initialize ! !


!classDefinition: #StackedElement category: #'Stack-Exercise'!
StackElement subclass: #StackedElement
	instanceVariableNames: 'anElement nextStackedElement'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackedElement methodsFor: 'status' stamp: 'asd 4/Sep/2026, 5:43:45 pm (UTC)'!
!methodProperties: {}!
isEmpty

	^false.! !


!StackedElement methodsFor: 'accessing' stamp: 'asd 4/Sep/2026, 5:46:44 pm (UTC)'!
!methodProperties: {}!
element

	^anElement.! !

!StackedElement methodsFor: 'accessing' stamp: 'asd 4/Sep/2026, 5:53:04 pm (UTC)'!
!methodProperties: {}!
element: newElement

	anElement := newElement.! !

!StackedElement methodsFor: 'accessing' stamp: 'asd 4/Sep/2026, 5:48:33 pm (UTC)'!
!methodProperties: {}!
nextStakedElement

	^nextStackedElement.! !

!StackedElement methodsFor: 'accessing' stamp: 'asd 4/Sep/2026, 5:48:00 pm (UTC)'!
!methodProperties: {}!
nextStakedElement: anStackedElement

	nextStackedElement := anStackedElement.! !

!StackedElement methodsFor: 'accessing' stamp: 'asd 9/Sep/2026, 6:53:56 am (UTC)'!
!methodProperties: {}!
top

	^lastStakedElement element.! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'prefix lista'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'asd 6/Sep/2026, 1:39:22 am (UTC)'!
!methodProperties: {}!
convert: anStack to: aList

	^[anStack isEmpty ] whileFalse: [aList add: anStack pop].! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'asd 6/Sep/2026, 1:47:21 am (UTC)'!
!methodProperties: {}!
extract: anStack From: aList

	[aList isEmpty ] whileFalse: [anStack push: aList removeLast ].! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'asd 6/Sep/2026, 1:43:49 am (UTC)'!
!methodProperties: {}!
extractListFrom: anStack

	|aList|
	
	aList := OrderedCollection new.
	[anStack isEmpty ] whileFalse: [aList add: anStack pop].
	
	^aList.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'asd 6/Sep/2026, 1:46:01 am (UTC)'!
!methodProperties: {}!
extractStackFrom: aList

	|anStack|
	
	anStack := OrderedCollection new.
	[aList isEmpty ] whileFalse: [anStack push: aList removeLast ].
	
	^aList.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'asd 7/Sep/2026, 7:16:53 am (UTC)'!
!methodProperties: {}!
find: aPrefix on: anStack
	
	|aList aListToReturn|
	
	aList := self extractListFrom: anStack.
	
	aListToReturn := self select: aPrefix from: aList.
	
	self extract: anStack From: aList.
	
	^aListToReturn.

	! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'asd 7/Sep/2026, 7:42:02 am (UTC)'!
!methodProperties: {}!
select: aPrefix from: aList
	
	^aList select: [
		:anStringElement |
		anStringElement is: aPrefix substringAt: 1
	]
	
	" '**Dejo mi viejo codigo con propositos de aprendizaje**'
	
	|resultedList index aBoolean|
	
	resultedList := OrderedCollection new.
	index := 1.
	
	[index <= aList size] whileTrue: [
		|aString|
		
		aString := aList at: index.
		aBoolean := (aString is: aPrefix substringAt: 1).
		aBoolean ifTrue: [
			resultedList add: (aList at: index) .
		].
		index := index +1.
	].
	
	^resultedList."
! !


!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 7/May/2012, 2:30:00 pm (UTC)'!
!methodProperties: {}!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 13/May/2020, 4:29:55 pm (UTC)'!
!methodProperties: {}!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 13/May/2020, 4:30:01 pm (UTC)'!
!methodProperties: {}!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 13/May/2020, 4:30:09 pm (UTC)'!
!methodProperties: {}!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 16/Sep/2021, 8:40:17 pm (UTC)'!
!methodProperties: {}!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'firstSomething'.
	secondPushedObject := 'secondSomething'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 13/May/2020, 4:30:20 pm (UTC)'!
!methodProperties: {}!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 13/May/2020, 4:30:24 pm (UTC)'!
!methodProperties: {}!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 15/Apr/2017, 1:48:26 am (UTC)'!
!methodProperties: {}!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 13/May/2020, 4:30:31 pm (UTC)'!
!methodProperties: {}!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 15/Apr/2017, 1:48:44 am (UTC)'!
!methodProperties: {}!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: #'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'asd 8/Sep/2026, 9:04:16 pm (UTC)'!
!methodProperties: {}!
test01ShouldReturnAnEmptyListWhenIsANewStack

	| stack selectorByPrefix|
	
	stack := OOStack new.
	selectorByPrefix := SentenceFinderByPrefix new.
	
	self assert: stack isEmpty.
	self assert: (selectorByPrefix find: 'whatever'  on: stack ) isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'asd 8/Sep/2026, 9:07:53 pm (UTC)'!
!methodProperties: {}!
test02ShouldReturnAnEmptyListWhenIsAnUnstakedWordWithPrefixMatch

	| stack selectorByPrefix|
	
	stack := OOStack new.
	stack push: 'anStakedWord'.
	selectorByPrefix := SentenceFinderByPrefix new.
	
	self deny: stack isEmpty.
	self assert: (selectorByPrefix find: 'whatever'  on: stack ) isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'asd 9/Sep/2026, 6:06:58 am (UTC)'!
!methodProperties: {}!
test03ShouldReturnAnNotEmptyListWhenIsAnStakedWordWithPrefixMatchAndTheElementIsRight

	| stack selectorByPrefix resultList testList|
	
	stack := OOStack new.
	stack push: 'anStakedWord'.
	selectorByPrefix := SentenceFinderByPrefix new.
	
	resultList := selectorByPrefix find: 'anSt'  on: stack.
	testList := OrderedCollection new. 
	testList add: 'anStakedWord'.
	
	self deny: stack isEmpty.
	self deny: resultList isEmpty.
	self assert: resultList equals: testList.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'asd 9/Sep/2026, 6:20:11 am (UTC)'!
!methodProperties: {}!
test04ShouldReturnAListWithTheElementsPrefixedsAndNothingMore

	| stack selectorByPrefix resultList testList|
	
	stack := OOStack new.
	stack push: 'anStakedWord'.
	selectorByPrefix := SentenceFinderByPrefix new.
	
	stack push: 'asd' .
	stack push: 'alejandro'  .
	stack push: 'alejo'  .
	stack push: 'sape'   .
	stack push: 'alex' .
	stack push: 'yeahh' .
	
	resultList := selectorByPrefix find: 'ale'  on: stack.
	testList := OrderedCollection new. 
	testList add: 'alex'.
	testList add: 'alejo'.
	testList add: 'alejandro'.
	
	self assert: resultList size equals: 3.
	self assert: resultList equals: testList.
	
	! !
