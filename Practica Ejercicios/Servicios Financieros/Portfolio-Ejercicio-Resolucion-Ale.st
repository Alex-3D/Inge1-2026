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


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions owner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'Alejandro Pontalti 23/Oct/2026, 1:20:07 am (UTC)'!
!methodProperties: {}!
initialize

	transactions := OrderedCollection new.
	owner := ReceptiveTop new.! !


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


!ReceptiveAccount methodsFor: 'testing' stamp: 'Alejandro Pontalti 23/Oct/2026, 1:11:10 am (UTC)'!
!methodProperties: {}!
checkNoDuplicateAccountHierarchy: anAccountOrAPortfolio calledBy: aCallerAccountOrPortfolio

	owner checkNoDuplicateAccountHierarchy: anAccountOrAPortfolio calledBy: self.! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 17/Oct/2019, 6:28:43 am (UTC)'!
!methodProperties: {}!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'asd 15/Oct/2026, 12:44:41 am (UTC)'!
!methodProperties: {}!
knowThisAccount: anAccount 

	^(self = anAccount ).! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'asd 17/Oct/2026, 12:32:40 am (UTC)'!
!methodProperties: {}!
knowThisAccountOrPortfolio: anAccountOrPortfolio

	^anAccountOrPortfolio knowThisAccount: self.! !


!ReceptiveAccount methodsFor: 'actions' stamp: 'Alejandro Pontalti 23/Oct/2026, 1:30:41 am (UTC)'!
!methodProperties: {}!
setOwner: anOwner 
	
	owner := anOwner.! !


!classDefinition: #ReceptivePortfolio category: #'Portfolio-Ejercicio'!
Object subclass: #ReceptivePortfolio
	instanceVariableNames: 'accountAndPortfoliosSet owner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptivePortfolio methodsFor: 'balance' stamp: 'asd 16/Oct/2026, 5:28:11 pm (UTC)'!
!methodProperties: {}!
balance
	(accountAndPortfoliosSet isEmptyOrNil) ifFalse: [
		^accountAndPortfoliosSet sum: [
			:anAccount|
			anAccount balance.
		].
	] ifTrue:[^0].! !


!ReceptivePortfolio methodsFor: 'initialization' stamp: 'Alejandro Pontalti 23/Oct/2026, 1:19:50 am (UTC)'!
!methodProperties: {}!
initialize

	accountAndPortfoliosSet := Set new.
	owner := ReceptiveTop new.! !

!ReceptivePortfolio methodsFor: 'initialization' stamp: 'Alejandro Pontalti 23/Oct/2026, 1:18:42 am (UTC)'!
!methodProperties: {}!
initializeWith: accountsAndPortfolios
	
	accountsAndPortfolios do: [:anAccountOrAPortfolio|
		self addNewNoDuplicate: anAccountOrAPortfolio.	
	]! !


!ReceptivePortfolio methodsFor: 'testing' stamp: 'Alejandro Pontalti 23/Oct/2026, 1:31:34 am (UTC)'!
!methodProperties: {}!
checkNoDuplicateAccountHierarchy: anAccountOrAPortfolio calledBy: aCallerAccountOrPortfolio

	^owner checkNoDuplicateAccountHierarchy: anAccountOrAPortfolio calledBy: self.! !

!ReceptivePortfolio methodsFor: 'testing' stamp: 'asd 16/Oct/2026, 5:28:11 pm (UTC)'!
!methodProperties: {}!
hasRegistered: aTransaction 
	|result|
	
	result := false.
	accountAndPortfoliosSet do: [
		:anAccount| 
		result := result or: [anAccount hasRegistered: aTransaction]. 
	].
	^result .! !

!ReceptivePortfolio methodsFor: 'testing' stamp: 'asd 17/Oct/2026, 12:34:53 am (UTC)'!
!methodProperties: {}!
knowThisAccountOrPortfolio: anAccountOrPortfolio

	^self knowThisAccount: anAccountOrPortfolio.! !


!ReceptivePortfolio methodsFor: 'transactions' stamp: 'asd 16/Oct/2026, 5:28:11 pm (UTC)'!
!methodProperties: {}!
transactions

	|allTransactions|
	
	allTransactions := OrderedCollection new.
	accountAndPortfoliosSet do: [
		:anAccount | 
		anAccount transactions ifNotEmpty: [allTransactions addAllLast: anAccount transactions]. 
	].

	^allTransactions.
	! !

!ReceptivePortfolio methodsFor: 'transactions' stamp: 'Alejandro Pontalti 23/Oct/2026, 1:38:55 am (UTC)'!
!methodProperties: {}!
transactionsOf: anAccount
	
	(accountAndPortfoliosSet select: [:account| account knowThisAccount: anAccount ])  ifNotEmpty: [^anAccount transactions.] ifEmpty: [^ self error: ReceptivePortfolio notAccountError.].
	
	"(self transactions select: [:ortherAccount | ortherAccount = anAccount ])  ifNotEmpty: [^anAccount transactions.] ifEmpty: [^ self error: Portfolio notAccountError.]."
	! !


!ReceptivePortfolio methodsFor: 'accounts' stamp: 'asd 17/Oct/2026, 12:16:33 am (UTC)'!
!methodProperties: {}!
accounts

	|allAccounts|
	
	allAccounts := OrderedCollection new.
	accountAndPortfoliosSet do: [
		:anAccount | 
		anAccount ifNotEmpty: [allAccounts addAllLast: anAccount transactions]. 
	].

	^allAccounts.! !

!ReceptivePortfolio methodsFor: 'accounts' stamp: 'Alejandro Pontalti 23/Oct/2026, 1:01:52 am (UTC)'!
!methodProperties: {}!
knowThisAccount: anAccountOrPortfolio

	(self checkNoSelf: anAccountOrPortfolio) ifFalse: [^true].
	(accountAndPortfoliosSet select: [:myAccountOrPortfolio | myAccountOrPortfolio knowThisAccount: anAccountOrPortfolio ])  ifNotEmpty: [^true.] ifEmpty: [^false.].! !


!ReceptivePortfolio methodsFor: 'private' stamp: 'Alejandro Pontalti 23/Oct/2026, 1:24:34 am (UTC)'!
!methodProperties: {}!
addNewNoDuplicate: anAccountOrAPortfolio

	(self checkNoDuplicateAccountAndNotSelf: anAccountOrAPortfolio) ifTrue: [self setOwnerAndAddAccountOrAPortfolio: anAccountOrAPortfolio.].	
	! !

!ReceptivePortfolio methodsFor: 'private' stamp: 'Alejandro Pontalti 23/Oct/2026, 1:25:53 am (UTC)'!
!methodProperties: {}!
addNoDuplicate: anAccountOrAPortfolio

	(self checkNoDuplicateAccountHierarchy: anAccountOrAPortfolio calledBy: self) ifTrue: [self setOwnerAndAddAccountOrAPortfolio: anAccountOrAPortfolio.].	
	! !

!ReceptivePortfolio methodsFor: 'private' stamp: 'Alejandro Pontalti 22/Oct/2026, 11:53:45 pm (UTC)'!
!methodProperties: {}!
checkNoDuplicateAccount: anAccountOrAPortfolio

	^ (accountAndPortfoliosSet select: [:accountOrPortfolioInSet | anAccountOrAPortfolio knowThisAccountOrPortfolio: accountOrPortfolioInSet]) isEmpty! !

!ReceptivePortfolio methodsFor: 'private' stamp: 'asd 16/Oct/2026, 6:32:31 pm (UTC)'!
!methodProperties: {}!
checkNoDuplicateAccountAndNotSelf: anAccountOrAPortfolio

	^ (self checkNoDuplicateAccount: anAccountOrAPortfolio) and: (self checkNoSelf: anAccountOrAPortfolio )! !

!ReceptivePortfolio methodsFor: 'private' stamp: 'asd 16/Oct/2026, 6:27:17 pm (UTC)'!
!methodProperties: {}!
checkNoSelf: anAccountOrAPortfolio

	^ (self = anAccountOrAPortfolio ) not.! !

!ReceptivePortfolio methodsFor: 'private' stamp: 'Alejandro Pontalti 23/Oct/2026, 1:22:51 am (UTC)'!
!methodProperties: {}!
setOwnerAndAddAccountOrAPortfolio: anAccountOrAPortfolio

	anAccountOrAPortfolio setOwner: self.
	accountAndPortfoliosSet add: anAccountOrAPortfolio.
	
	! !


!ReceptivePortfolio methodsFor: 'actions' stamp: 'Alejandro Pontalti 23/Oct/2026, 12:27:44 am (UTC)'!
!methodProperties: {}!
addAccountOrPortfolio: anAccountOrPortfolio
	
	self addNoDuplicate: anAccountOrPortfolio.! !

!ReceptivePortfolio methodsFor: 'actions' stamp: 'Alejandro Pontalti 23/Oct/2026, 1:23:23 am (UTC)'!
!methodProperties: {}!
setOwner: anOwner

	owner := anOwner.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptivePortfolio class' category: #'Portfolio-Ejercicio'!
ReceptivePortfolio class
	instanceVariableNames: ''!

!ReceptivePortfolio class methodsFor: 'error' stamp: 'asd 14/Oct/2026, 1:02:17 am (UTC)'!
!methodProperties: {}!
notAccountError

	^'El account solicitado no pertenece a este portfolio.'! !


!classDefinition: #ReceptiveTop category: #'Portfolio-Ejercicio'!
Object subclass: #ReceptiveTop
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveTop methodsFor: 'testing' stamp: 'Alejandro Pontalti 23/Oct/2026, 1:32:23 am (UTC)'!
!methodProperties: {}!
checkNoDuplicateAccountHierarchy: anAccountOrAPortfolio calledBy: aCallerAccountOrPortfolio

	^aCallerAccountOrPortfolio checkNoDuplicateAccountAndNotSelf: anAccountOrAPortfolio.! !


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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'Alejandro Pontalti 23/Oct/2026, 1:38:55 am (UTC)'!
!methodProperties: {}!
test08PortfolioHaveZeroAsBalanceWhenCreated 

	| portfolio |
	
	portfolio := ReceptivePortfolio new.
	
		
	self assert: 0 equals: portfolio balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'Alejandro Pontalti 23/Oct/2026, 1:38:55 am (UTC)'!
!methodProperties: {}!
test09PortfolioWithOneAccountWithDepositHaveBalanceEqualToAcountBalance

	| portfolio account|
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := ReceptivePortfolio new initializeWith: {account}.
	
	self assert: account balance equals: portfolio balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'Alejandro Pontalti 23/Oct/2026, 1:38:54 am (UTC)'!
!methodProperties: {}!
test10PortfolioHaveNoDuplicateAccounts

	| portfolio account account2 accountsBalance |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	account2 := ReceptiveAccount new.
	Deposit register: 100 on: account2.
	Withdraw register: 50 on: account2.
	portfolio := ReceptivePortfolio new initializeWith: {account. account2. account }.
	
	accountsBalance := (account balance + account2 balance).
	
	self assert: accountsBalance equals: portfolio balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'Alejandro Pontalti 23/Oct/2026, 1:38:54 am (UTC)'!
!methodProperties: {}!
test11PortfolioWithTwoAccountsWithDepositHaveBalanceEqualToSumAcountsBalance

	| portfolio account account2 accountsBalance |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	account2 := ReceptiveAccount new.
	Deposit register: 100 on: account2.
	Withdraw register: 50 on: account2.
	portfolio := ReceptivePortfolio new initializeWith: {account. account2 }.
	
	accountsBalance := (account balance + account2 balance).
	
	self assert: accountsBalance equals: portfolio balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'Alejandro Pontalti 23/Oct/2026, 1:38:54 am (UTC)'!
!methodProperties: {}!
test12PortfolioWithTwoAccountsHaveRegisteredATransaction

	| portfolio account account2 deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	account2 := ReceptiveAccount new.
	Deposit register: 100 on: account2.
	Withdraw register: 50 on: account2.
	portfolio := ReceptivePortfolio new initializeWith: {account. account2 }.
	
	self assert: (account hasRegistered: deposit).
	self assert: (portfolio hasRegistered: deposit).

! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'Alejandro Pontalti 23/Oct/2026, 1:38:54 am (UTC)'!
!methodProperties: {}!
test13PortfolioWithTwoAccountsReturnTheSecondOneTransactions

	| portfolio account account2 deposit withdraw |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	account2 := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account2.
	withdraw := Withdraw register: 50 on: account2.
	portfolio := ReceptivePortfolio new initializeWith: {account. account2 }.
	
	self assert: account2 transactions equals: (portfolio transactionsOf: account2).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'Alejandro Pontalti 23/Oct/2026, 1:38:54 am (UTC)'!
!methodProperties: {}!
test14PortfolioReturnTransactionsOfItsOwnAccounts

	| portfolio account account2 deposit withdraw |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	account2 := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account2.
	withdraw := Withdraw register: 50 on: account2.
	portfolio := ReceptivePortfolio new initializeWith: {account}.
	
	self should: [portfolio transactionsOf: account2]
	raise: Error 
	withExceptionDo: [ :error | error messageText = ReceptivePortfolio notAccountError.].

! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'Alejandro Pontalti 23/Oct/2026, 1:38:55 am (UTC)'!
!methodProperties: {}!
test15PortfolioWithOnePortfolioWhitAccountWithDepositHaveBalanceEqualToPortfolioAcountBalance

	| portfolio account portfolio2 |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := ReceptivePortfolio new initializeWith: {account}.
	portfolio2 := ReceptivePortfolio new initializeWith: {portfolio}.
	
	self assert: portfolio2 balance equals: portfolio balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'Alejandro Pontalti 23/Oct/2026, 1:38:55 am (UTC)'!
!methodProperties: {}!
test16PortfolioWithOnePortfolioWhitAccountWithDepositAndAnAccountHaveBalanceEqualToAllAcountBalanceSum

	| portfolio account portfolio2 account2 resultBalance |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := ReceptivePortfolio new initializeWith: {account}.
	account2 := ReceptiveAccount new.
	Deposit register: 200 on: account2.
	Withdraw register: 150 on: account2.
	portfolio2 := ReceptivePortfolio new initializeWith: {portfolio. account2 }.
	resultBalance := portfolio balance + account2 balance.
	
	self assert: resultBalance equals: portfolio2 balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'Alejandro Pontalti 23/Oct/2026, 1:38:55 am (UTC)'!
!methodProperties: {}!
test17PortfolioWithPortfolioAndAccountsReturnTheSecondOneTransactions

	| portfolio account account2 deposit withdraw account3 portfolio2 |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	account2 := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account2.
	withdraw := Withdraw register: 50 on: account2.
	portfolio := ReceptivePortfolio new initializeWith: {account. account2 }.
	account3 := ReceptiveAccount new.
	Deposit register: 150 on: account3.
	portfolio2 := ReceptivePortfolio new initializeWith: {portfolio. account3}.
	
	self assert: account2 transactions equals: (portfolio2 transactionsOf: account2).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'Alejandro Pontalti 23/Oct/2026, 1:38:55 am (UTC)'!
!methodProperties: {}!
test18PortfolioHaveNotDuplicatePortfolio

	| portfolio account portfolio2 account2 resultBalance |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := ReceptivePortfolio new initializeWith: {account}.
	account2 := ReceptiveAccount new.
	Deposit register: 200 on: account2.
	Withdraw register: 150 on: account2.
	portfolio2 := ReceptivePortfolio new initializeWith: {portfolio. account2. portfolio }.
	resultBalance := portfolio balance + account2 balance.
	
	self assert: resultBalance equals: portfolio2 balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'Alejandro Pontalti 23/Oct/2026, 1:38:55 am (UTC)'!
!methodProperties: {}!
test19PortfolioHaveNotDuplicateAccountInDiferentPortfolios

	| portfolio account portfolio2 account2 resultBalance |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := ReceptivePortfolio new initializeWith: {account}.
	account2 := ReceptiveAccount new.
	Deposit register: 200 on: account2.
	Withdraw register: 150 on: account2.
	portfolio2 := ReceptivePortfolio new initializeWith: {portfolio. account2. account }.
	resultBalance := portfolio balance + account2 balance.
	
	self assert: resultBalance equals: portfolio2 balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'Alejandro Pontalti 23/Oct/2026, 1:38:55 am (UTC)'!
!methodProperties: {}!
test20PortfolioHaveNotDuplicateAccountInPortfolios

	| portfolio account portfolio2 account2 resultBalance portfolio3 |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := ReceptivePortfolio new initializeWith: {account}.
	account2 := ReceptiveAccount new.
	Deposit register: 200 on: account2.
	Withdraw register: 150 on: account2.
	portfolio2 := ReceptivePortfolio new initializeWith: {portfolio. account2. account }.
	portfolio3 := ReceptivePortfolio new initializeWith: {portfolio. account2. portfolio2 }.
	resultBalance := portfolio balance + account2 balance.
	
	self assert: resultBalance equals: portfolio3 balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'Alejandro Pontalti 23/Oct/2026, 1:38:55 am (UTC)'!
!methodProperties: {}!
test21PortfolioHaveNotPortfoliosWithADuplicateAccountIn

	| portfolio account portfolio2 account2 resultBalance |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := ReceptivePortfolio new initializeWith: {account}.
	account2 := ReceptiveAccount new.
	Deposit register: 200 on: account2.
	Withdraw register: 150 on: account2.
	portfolio2 := ReceptivePortfolio new initializeWith: {account. account2. portfolio }.
	resultBalance := account balance + account2 balance.
	
	self assert: resultBalance equals: portfolio2 balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'Alejandro Pontalti 23/Oct/2026, 1:38:55 am (UTC)'!
!methodProperties: {}!
test22PortfolioHavePortfoliosAndAccountsAddNewAccount

	| portfolio account portfolio2 account2 resultBalance account3 |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := ReceptivePortfolio new initializeWith: {account}.
	account2 := ReceptiveAccount new.
	Deposit register: 200 on: account2.
	Withdraw register: 150 on: account2.
	portfolio2 := ReceptivePortfolio new initializeWith: {account2. portfolio }.
	account3 := ReceptiveAccount new.
	Deposit register: 175 on: account3.
	portfolio addAccountOrPortfolio: account3.
	resultBalance := portfolio balance + account2 balance.
	
	self assert: resultBalance equals: portfolio2 balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'Alejandro Pontalti 23/Oct/2026, 1:38:55 am (UTC)'!
!methodProperties: {}!
test23PortfolioHavePortfoliosAndAccountsAddNewPortfolio

	| portfolio account portfolio2 account2 resultBalance account3 account4 portfolio3 |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := ReceptivePortfolio new initializeWith: {account}.
	account2 := ReceptiveAccount new.
	Deposit register: 200 on: account2.
	Withdraw register: 150 on: account2.
	portfolio2 := ReceptivePortfolio new initializeWith: {account2. portfolio }.
	account3 := ReceptiveAccount new.
	Deposit register: 175 on: account3.
	portfolio addAccountOrPortfolio: account3.
	portfolio3 := ReceptivePortfolio new.
	account4 := ReceptiveAccount new.
	Deposit register: 50 on: account4.
	portfolio3 addAccountOrPortfolio: account4.
	portfolio2 addAccountOrPortfolio: portfolio3.
	resultBalance := portfolio balance + account2 balance + portfolio3 balance.
	
	self assert: resultBalance equals: portfolio2 balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'Alejandro Pontalti 23/Oct/2026, 1:38:55 am (UTC)'!
!methodProperties: {}!
test24PortfolioCantAddItSelf

	| portfolio account portfolio2 account2 resultBalance |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := ReceptivePortfolio new initializeWith: {account}.
	account2 := ReceptiveAccount new.
	Deposit register: 200 on: account2.
	Withdraw register: 150 on: account2.
	portfolio2 := ReceptivePortfolio new initializeWith: {account2. portfolio }.
	portfolio2 addAccountOrPortfolio: portfolio2.
	resultBalance := portfolio balance + account2 balance.
	
	self assert: resultBalance equals: portfolio2 balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'Alejandro Pontalti 23/Oct/2026, 1:38:55 am (UTC)'!
!methodProperties: {}!
test25PortfolioHavePortfoliosAndAccountsCantAddDuplecateAccount

	| portfolio account portfolio2 account2 resultBalance account3 account4 portfolio3 |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := ReceptivePortfolio new initializeWith: {account}.
	account2 := ReceptiveAccount new.
	Deposit register: 200 on: account2.
	Withdraw register: 150 on: account2.
	portfolio2 := ReceptivePortfolio new initializeWith: {account2. portfolio }.
	account3 := ReceptiveAccount new.
	Deposit register: 175 on: account3.
	portfolio addAccountOrPortfolio: account3.
	portfolio3 := ReceptivePortfolio new.
	account4 := ReceptiveAccount new.
	Deposit register: 50 on: account4.
	portfolio3 addAccountOrPortfolio: account4.
	portfolio2 addAccountOrPortfolio: portfolio3.
	portfolio3 addAccountOrPortfolio: account.
	resultBalance := portfolio balance + account2 balance + account4 balance.
	
	self assert: resultBalance equals: portfolio2 balance.
! !
