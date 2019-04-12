Class {
	#name : #SInferenceEngineTest,
	#superclass : #TestCase,
	#category : #SimpleEngine
}

{ #category : #tests }
SInferenceEngineTest >> testCurrentRulesIsTheSameAsRulesWhenStarting [
	| eng |
	eng := SInferenceEngine new.
		self assert: eng rulesAreInSync.
	eng addRules: #(1 2 3).
	self assert: eng rulesAreInSync
]

{ #category : #tests }
SInferenceEngineTest >> testEngineFindOneFact [
	| engine |
	engine := SInferenceEngine new.
	engine addRules: SRule quadrilateralRules.
	engine
		fireFromFacts:
			{SFact fourEdges.
			SFact parallelTwoByTwo}.
	self assert: engine results size equals: 3.
	self assert: (engine results contains: [ :each | each name = #parallelogram])
]

{ #category : #tests }
SInferenceEngineTest >> testEngineFindTwoStepsFact [
	| engine |
	engine := SInferenceEngine new.
	engine addRules: SRule quadrilateralRules.
	engine
		fireFromFacts:
			{SFact fourEdges.
			SFact parallelTwoByTwo.
			SFact has90degreeAngle}.
	self assert: engine results size equals: 5.
	self assert: (engine results contains: [ :each | each name = #rhombus ])
]

{ #category : #tests }
SInferenceEngineTest >> testEngineMakeSureThatnotMatchingFirstRuleIsEvaluatedAfterNewFactIsAdded [
	| engine rules |
	rules := SRule quadrilateralRules asOrderedCollection.
	rules := rules allButFirst addLast: rules first; yourself.
	self deny: rules first name = #parallelogram. 
	engine := SInferenceEngine new.
	engine addRules: rules.
	engine
		fireFromFacts:
			{SFact fourEdges.
			SFact parallelTwoByTwo.
			SFact has90degreeAngle}.
	self assert: engine results size equals: 5.
	self assert: (engine results contains: [ :each | each name = #rhombus ])
]

{ #category : #tests }
SInferenceEngineTest >> testNewlyCreatedEngine [
	| eng |
	eng := SInferenceEngine new.
	self assert: eng rulesAreInSync
]
