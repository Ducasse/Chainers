"
Note that we can and a rule implying other rules. 

For example 

Rule: rectangle
IF Parallelogram AND 90 degree angles 
THEN Rectangle

Parallelogram can be either a fact or again a rule.





"
Class {
	#name : #SInferenceEngine,
	#superclass : #Object,
	#instVars : [
		'currentRules',
		'rules',
		'factBase'
	],
	#category : #SimpleEngine
}

{ #category : #adding }
SInferenceEngine >> addRules: aCollection [
	rules addAll: aCollection.
	self resetCurrentRules
]

{ #category : #firing }
SInferenceEngine >> fire [
	self traceCr: 'Starting facts:'.
	factBase facts do: [ :f | self traceCr: f ].
	[ self traceCr: currentRules size printString , ' rules left to be tested.'.
	currentRules do: [ :r | self traceCr: r ].
	currentRules isNotEmpty ] whileTrue: [ self handleCurrentRules ].
	self traceCr: 'Results facts:'.
	factBase facts do: [ :f | self traceCr: f ]
]

{ #category : #firing }
SInferenceEngine >> fireFromFacts: aCollectionOfFacts [
	factBase addAll: aCollectionOfFacts.
	self fire
]

{ #category : #firing }
SInferenceEngine >> handleCurrentRules [
	currentRules copy
		do: [ :aRule | 
			self traceCr: 'Checking ' , aRule printString.
			(aRule canFireWith: factBase)
				ifFalse: [ 	self traceCr: 'It cannot fire.'. currentRules remove: aRule ]
				ifTrue: [ | conclusion |
					self traceCr: 'It can fire.'.
					conclusion := aRule conclusion.
					(factBase isFactNamedDefined: conclusion name)
						ifTrue: [ self traceCr: 'Rule conclusion: ' , conclusion name , ' already defined so drop the rule.'.
							currentRules remove: aRule ]
						ifFalse: [ self traceCr: 'Add new fact: ' , conclusion name , ' and reset rules.'.
							factBase add: aRule conclusion.
							"we can remove the rule that produced this fact"
							rules remove: aRule.
							self resetCurrentRules.
							^ self ].
					self traceCr: 'Next rule.' ] ]
]

{ #category : #initialization }
SInferenceEngine >> initialize [
	super initialize.
	rules := OrderedCollection new.
	self resetCurrentRules. 
	factBase := SFactBase new
]

{ #category : #initialization }
SInferenceEngine >> resetCurrentRules [
	currentRules := rules copy
]

{ #category : #firing }
SInferenceEngine >> results [

	^ factBase facts
]

{ #category : #accessing }
SInferenceEngine >> rules [ 

	^ rules
]

{ #category : #testing }
SInferenceEngine >> rulesAreInSync [

	^ rules size == currentRules size
]
