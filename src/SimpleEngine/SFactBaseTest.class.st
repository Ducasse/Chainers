Class {
	#name : #SFactBaseTest,
	#superclass : #TestCase,
	#category : #SimpleEngine
}

{ #category : #tests }
SFactBaseTest >> testAddingAFact [
	| fb |
	fb := SFactBase new.
	fb
		add:
			(SFact new
		name: #allEdgesSameLength;
		description: 'The shape all the edges of the same length').
	self assert: fb factNumber equals: 1
]

{ #category : #tests }
SFactBaseTest >> testAddingTwoFacts [
	| fb |
	fb := SFactBase new.
	fb
		add:
			(SFact new
				name: #allEdgesSameLength;
				description: 'The shape all the edges of the same length').
	fb
		add:
			(SFact new
		name: #'90DegreeAngle';
		description: 'The shape has one 90 degree angle').
	self assert: fb factNumber equals: 2
]

{ #category : #tests }
SFactBaseTest >> testAddingTwoFactsWithTheSameName [
	| fb |
	fb := SFactBase new.
	fb
		add:
			(SFact new
				name: #allEdgesSameLength;
				description: 'The shape all the edges of the same length').
	fb
		add:
			(SFact new
					name: #'allEdgesSameLength';
					description: 'Second version').
	self assert: fb factNumber equals: 1
]

{ #category : #tests }
SFactBaseTest >> testClearingBaseEmptyIt [
	| fb |
	fb := SFactBase new.
	fb
		add:
			(SFact new
				name: #allEdgesSameLength;
				description: 'The shape all the edges of the same length').
	fb
		add:
			(SFact new
				name: #'90DegreeAngle';
				description: 'The shape has one 90 degree angle').
	self assert: fb factNumber equals: 2.
	fb clear.
	self assert: fb factNumber equals: 0
]

{ #category : #tests }
SFactBaseTest >> testCreatingAFactBaseIsEmpty [

	self assert: SFactBase new factNumber equals: 0. 
]

{ #category : #tests }
SFactBaseTest >> testLookingForAKnownFact [
	| fb |
	fb := SFactBase new.
	fb add: SFact allEdgesSameLength.
	fb add: SFact has90degreeAngle.
	self assert: (fb isFactNamedDefined: #allEdgesSameLength).
	self assert: (fb isFactNamedDefined: #has90degreeAngle).
]

{ #category : #tests }
SFactBaseTest >> testLookingForUnknownFact [
	| fb |
	fb := SFactBase new.
	fb
		add:
			(SFact new
				name: #allEdgesSameLength;
				description: 'The shape all the edges of the same length').
	fb
		add:
			(SFact new
				name: #'90DegreeAngle';
				description: 'The shape has one 90 degree angle').
	self
		deny: (fb isFactNamedDefined: #EdgeNumber)
]
