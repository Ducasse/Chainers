"
I'm a simple object that represents a modus ponens

Premisses => Conclusion
"
Class {
	#name : #SRule,
	#superclass : #Object,
	#instVars : [
		'premisses',
		'conclusion',
		'name'
	],
	#category : #SimpleEngine
}

{ #category : #'instance creation' }
SRule class >> name: aString 
	ifFacts: aCollection 
	then: aFact [
	^ self new
		name: aString; 
		premisses: aCollection;
		conclusion: aFact
]

{ #category : #quadrilaterals }
SRule class >> quadrilateralRules [
	^ {(SRule
		name: 'Parallelogramme'
		ifFacts:
			{(SFact new
				name: #fourEdges;
				description: 'The shape has 4 edges').
			(SFact new
				name: #parallelTwoByTwo;
				description: 'The shape has two by two parallel edges')}
		then:
			(SFact new
				name: #parallelogram;
				description: 'The shape is a parallelogram.')).
	(SRule
		name: 'Rhombus: quadri + same length'
		ifFacts:
			{(SFact new
				name: #quadrilateral;
				description: 'The shape has 4 edges').
			(SFact new
				name: #allEdgesSameLength;
				description: 'The shape all the edges of the same length')}
		then:
			(SFact new
				name: #rhombus;
				description: 'The shape is a rhombus.')).
	(SRule
		name: 'Rectangle: parallelo + angle'
		ifFacts:
			{(SFact new
				name: #parallelogram;
				description: 'The shape is a parallelogram.').
			(SFact new
				name: #has90degreeAngle;
				description: 'The shape has one 90 degree angle')}
		then:
			(SFact new
				name: #rhombus;
				description: 'The shape is a rhombus.'))}
]

{ #category : #testing }
SRule >> canFireWith: aFactBase [
	^ premisses allSatisfy: [ :p |
			(aFactBase findFactsNamed: p name) isNotEmpty ]
]

{ #category : #accessing }
SRule >> conclusion [
	^ conclusion
]

{ #category : #accessing }
SRule >> conclusion: aFact [ 
	conclusion := aFact
]

{ #category : #accessing }
SRule >> name [ 

	^ name
]

{ #category : #accessing }
SRule >> name: aString [ 
	name := aString
]

{ #category : #accessing }
SRule >> premisses [
	^ premisses
]

{ #category : #accessing }
SRule >> premisses: aCollection [ 
	premisses := aCollection
]

{ #category : #testing }
SRule >> printOn: aStream [
	aStream nextPutAll: 'Rule: '.
	premisses
		do: [ :p | p printOn: aStream ]
		separatedBy: [ aStream nextPutAll: ' AND ' ].
	aStream nextPutAll: '=>'.
	conclusion printOn: aStream
]
