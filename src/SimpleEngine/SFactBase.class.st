"
I maintain a fact database.

My current implementation is to store facts in a dictionary based on the unique name.
Even if we could just simply use a set with the fact names.
"
Class {
	#name : #SFactBase,
	#superclass : #Object,
	#instVars : [
		'facts'
	],
	#category : #SimpleEngine
}

{ #category : #constants }
SFactBase class >> rectangle [
	<sampleInstance>
	^ self new
		addAll: self rectangleFacts;
		yourself
]

{ #category : #constants }
SFactBase class >> rectangleFacts [
	^ {SFact quadrilateral . SFact parallelTwoByTwo . SFact has90degreeAngle}
]

{ #category : #constants }
SFactBase class >> rhombus [
	<sampleInstance>
	^ self new
		addAll: self rhombusFacts;
		yourself
]

{ #category : #constants }
SFactBase class >> rhombusFacts [
	^ {SFact quadrilateral.
	SFact allEdgesSameLength}
]

{ #category : #'adding/removing' }
SFactBase >> add: aFact [
	facts at: aFact name put: aFact
]

{ #category : #'adding/removing' }
SFactBase >> addAll: factColl [
	factColl do: [ :each | self add: each ]
]

{ #category : #action }
SFactBase >> clear [
	facts := OrderedCollection new
]

{ #category : #accessing }
SFactBase >> factNumber [ 

	^ facts size
]

{ #category : #accessing }
SFactBase >> facts [
	^ facts values
]

{ #category : #lookup }
SFactBase >> findFactsNamed: aString [ 
	"Return all the facts named aString"
	"This code is highly suspicious to me because normally I can only have one rule with a name in a fact base."
	

	^ facts select: [ :aFact | aFact name = aString ]
]

{ #category : #initialization }
SFactBase >> initialize [
	super initialize.
	facts := Dictionary new
]

{ #category : #lookup }
SFactBase >> isFactNamedDefined: aString [ 
	
	^ facts at: aString  ifPresent: [ true ] ifAbsent: [ false ]
]
