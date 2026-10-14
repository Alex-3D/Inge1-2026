!classDefinition: #AccountTransaction category: #'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'asd 10/Oct/2026, 12:53:36 am (UTC)'!
!methodProperties: {}!
value

	^ value! !

!AccountTransaction methodsFor: 'value' stamp: 'asd 10/Oct/2026, 12:55:45 am (UTC)'!
!methodProperties: {}!
valueForBalance

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 17/Oct/2019, 6:22:00 am (UTC)'!
!methodProperties: {}!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 13/Jul/2011, 9:45:00 pm (UTC)'!
!methodProperties: {}!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'asd 10/Oct/2026, 12:54:19 am (UTC)'!
!methodProperties: {}!
valueForBalance

	^ value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 13/Jul/2011, 9:38:00 pm (UTC)'!
!methodProperties: {}!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 13/Jul/2011, 9:46:00 pm (UTC)'!
!methodProperties: {}!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'asd 10/Oct/2026, 12:55:31 am (UTC)'!
!methodProperties: {}!
valueForBalance

	^ value*(-1).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 13/Jul/2011, 9:33:00 pm (UTC)'!
!methodProperties: {}!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: #'Portfolio-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accountSet'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'balance' stamp: 'asd 14/Oct/2026, 12:21:22 am (UTC)'!
!methodProperties: {}!
balance
	(accountSet isEmptyOrNil) ifFalse: [
		^accountSet sum: [
			:anAccount|
			anAccount balance.
		].
	] ifTrue:[^0].! !


!Portfolio methodsFor: 'initialization' stamp: 'asd 14/Oct/2026, 12:18:50 am (UTC)'!
!methodProperties: {}!
initialize

	accountSet := Set new.! !

!Portfolio methodsFor: 'initialization' stamp: 'asd 14/Oct/2026, 12:20:16 am (UTC)'!
!methodProperties: {}!
initializeWith: accounts
	
	accounts do: [:anAccount|
		accountSet add: anAccount.	
	]! !


!Portfolio methodsFor: 'test' stamp: 'asd 14/Oct/2026, 12:37:50 am (UTC)'!
!methodProperties: {}!
hasRegistered: aTransaction 
	|result|
	
	result := false.
	accountSet do: [
		:anAccount| 
		result := result or: [anAccount hasRegistered: aTransaction]. 
	].
	^result .! !


!Portfolio methodsFor: 'cambiame' stamp: 'asd 14/Oct/2026, 12:56:20 am (UTC)'!
!methodProperties: {}!
transactionsOf: anAccount
	
	(accountSet select: [:ortherAccount | ortherAccount = anAccount ])  ifNotEmpty: [^anAccount transactions.] ifEmpty: [^ self error: self notAccountError.].
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error' stamp: 'asd 14/Oct/2026, 1:02:17 am (UTC)'!
!methodProperties: {}!
notAccountError

	^'El account solicitado no pertenece a este portfolio.'! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 17/Oct/2019, 6:06:56 pm (UTC)'!
!methodProperties: {}!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 13/Jul/2011, 9:37:00 pm (UTC)'!
!methodProperties: {}!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 13/Jul/2011, 9:37:00 pm (UTC)'!
!methodProperties: {}!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'asd 10/Oct/2026, 12:56:15 am (UTC)'!
!methodProperties: {}!
balance

	^transactions sum: [ :aTransaction | aTransaction valueForBalance ] ifEmpty: [ 0 ]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 17/Oct/2019, 6:28:43 am (UTC)'!
!methodProperties: {}!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 2/Nov/2020, 8:13:44 pm (UTC)'!
!methodProperties: {}!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 2/Nov/2020, 8:13:48 pm (UTC)'!
!methodProperties: {}!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 2/Nov/2020, 8:13:52 pm (UTC)'!
!methodProperties: {}!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 23/May/2019, 6:20:32 pm (UTC)'!
!methodProperties: {}!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 23/May/2019, 6:20:46 pm (UTC)'!
!methodProperties: {}!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 17/May/2021, 8:29:53 pm (UTC)'!
!methodProperties: {}!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 200.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 2/Nov/2020, 8:14:01 pm (UTC)'!
!methodProperties: {}!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'asd 13/Oct/2026, 11:25:39 pm (UTC)'!
!methodProperties: {}!
test08PortfolioHaveZeroAsBalanceWhenCreated 

	| portfolio |
	
	portfolio := Portfolio new.
	
		
	self assert: 0 equals: portfolio balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'asd 14/Oct/2026, 12:17:53 am (UTC)'!
!methodProperties: {}!
test09PortfolioWithOneAccountWithDepositHaveBalanceEqualToAcountBalance

	| portfolio account|
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := Portfolio new initializeWith: {account}.
	
	self assert: account balance equals: portfolio balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'asd 14/Oct/2026, 12:23:27 am (UTC)'!
!methodProperties: {}!
test10PortfolioHaveNoRepetitiveAccounts

	| portfolio account account2 accountsBalance |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	account2 := ReceptiveAccount new.
	Deposit register: 100 on: account2.
	Withdraw register: 50 on: account2.
	portfolio := Portfolio new initializeWith: {account. account2. account }.
	
	accountsBalance := (account balance + account2 balance).
	
	self assert: accountsBalance equals: portfolio balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'asd 14/Oct/2026, 12:24:54 am (UTC)'!
!methodProperties: {}!
test11PortfolioWithTwoAccountsWithDepositHaveBalanceEqualToSumAcountsBalance

	| portfolio account account2 accountsBalance |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	account2 := ReceptiveAccount new.
	Deposit register: 100 on: account2.
	Withdraw register: 50 on: account2.
	portfolio := Portfolio new initializeWith: {account. account2 }.
	
	accountsBalance := (account balance + account2 balance).
	
	self assert: accountsBalance equals: portfolio balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'asd 14/Oct/2026, 12:31:16 am (UTC)'!
!methodProperties: {}!
test12PortfolioWithTwoAccountsHaveRegisteredATransaction

	| portfolio account account2 deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	account2 := ReceptiveAccount new.
	Deposit register: 100 on: account2.
	Withdraw register: 50 on: account2.
	portfolio := Portfolio new initializeWith: {account. account2 }.
	
	self assert: (account hasRegistered: deposit).
	self assert: (portfolio hasRegistered: deposit).

! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'asd 14/Oct/2026, 1:02:56 am (UTC)'!
!methodProperties: {}!
test13PortfolioWithTwoAccountsReturnTheSecondOneTransactions

	| portfolio account account2 deposit withdraw |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	account2 := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account2.
	withdraw := Withdraw register: 50 on: account2.
	portfolio := Portfolio new initializeWith: {account. account2 }.
	
	self assert: account2 transactions equals: (portfolio transactionsOf: account2).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'asd 14/Oct/2026, 1:00:56 am (UTC)'!
!methodProperties: {}!
test14PortfolioReturnTransactionsOfItsOwnAccounts

	| portfolio account account2 deposit withdraw |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	account2 := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account2.
	withdraw := Withdraw register: 50 on: account2.
	portfolio := Portfolio new initializeWith: {account}.
	
	self should: [portfolio transactionsOf: account2]
	raise: Error 
	withExceptionDo: [ :error | error messageText = Portfolio notAccountError.].

! !
