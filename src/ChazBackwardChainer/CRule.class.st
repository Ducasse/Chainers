Class {
	#name : #CRule,
	#superclass : #CFact,
	#instVars : [
		'premisses'
	],
	#category : #ChazBackwardChainer
}

{ #category : #'instance creation' }
CRule class >> name: aString 
	ifFacts: aCollection 
	then: aFact [
	^ self new
		name: aString; 
		premisses: aCollection;
		conclusion: aFact
]

{ #category : #quadrilaterals }
CRule class >> quadrilateralRules [
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
CRule >> canFireWith: aFactBase [
	^ premisses allSatisfy: [ :p |
			(aFactBase findFactsNamed: p name) isNotEmpty ]
]

{ #category : #accessing }
CRule >> hypotheses [
	^ premisses
]

{ #category : #accessing }
CRule >> hypotheses: aCollection [
	premisses := aCollection
]

{ #category : #accessing }
CRule >> premisses [
	^ premisses
]

{ #category : #accessing }
CRule >> premisses: aCollection [ 
	premisses := aCollection
]

{ #category : #testing }
CRule >> printOn: aStream [
	aStream nextPutAll: 'Rule: '.
	premisses
		do: [ :p | p printOn: aStream ]
		separatedBy: [ aStream nextPutAll: ' AND ' ].
	aStream nextPutAll: '=>'.
	super printOn: aStream
]
