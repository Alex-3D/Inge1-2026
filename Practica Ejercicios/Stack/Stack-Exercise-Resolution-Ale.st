!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'size stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialize' stamp: 'asd 4/Sep/2026, 6:08:12 pm (UTC)'!
!methodProperties: {}!
initialize

	stack := EmptyStack new.
	size := 0.! !


!OOStack methodsFor: 'accessing' stamp: 'asd 4/Sep/2026, 6:21:32 pm (UTC)'!
!methodProperties: {}!
pop

	|anObjectToReturn|
	
	anObjectToReturn := stack element.
	stack := stack nextStakedElement.
	size := size -1.
	
	^anObjectToReturn .! !

!OOStack methodsFor: 'accessing' stamp: 'asd 4/Sep/2026, 6:08:55 pm (UTC)'!
!methodProperties: {}!
push: anObject
	
	|stackedElementToAdd|
	
	stackedElementToAdd := StackedElement new.
	stackedElementToAdd  element: anObject.
	stackedElementToAdd nextStakedElement: stack.
	stack := stackedElementToAdd.
	size := size + 1.! !

!OOStack methodsFor: 'accessing' stamp: 'asd 4/Sep/2026, 6:05:44 pm (UTC)'!
!methodProperties: {}!
top

	^stack element.! !


!OOStack methodsFor: 'status' stamp: 'asd 4/Sep/2026, 5:22:14 pm (UTC)'!
!methodProperties: {}!
isEmpty

	^stack isEmpty.! !

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

!StackedElement methodsFor: 'accessing' stamp: 'asd 4/Sep/2026, 6:05:05 pm (UTC)'!
!methodProperties: {}!
top

	^stack element.! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'prefix lista'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'asd 5/Sep/2026, 1:32:48 am (UTC)'!
!methodProperties: {}!
find: aPrefix on: anStack
	
	|aList|
	
	aList := OrderedCollection new.
	
	[anStack isEmpty ] whileFalse: [aList add: anStack pop].
	[aList isEmpty ] whileFalse: [anStack push: aList removeLast ].
	
	^aPrefix.

	! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'asd 5/Sep/2026, 1:43:22 am (UTC)'!
!methodProperties: {}!
fiter: aPrefix on: aList
	
	|resultedList index|
	
	resultedList := OrderedCollection new.
	index := 0.
	
	[index < aList size] whileFalse: [
		resultedList add: (aList at: index) .
		index := index +1.
	].
	
	^aPrefix.
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
