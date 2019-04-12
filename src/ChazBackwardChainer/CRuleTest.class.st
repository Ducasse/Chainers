Class {
	#name : #CRuleTest,
	#superclass : #TestCase,
	#category : #ChazBackwardChainer
}

{ #category : #tests }
CRuleTest >> testRuleCanFire [
	| r |
	r := SRule
			name: 'Rectangle (parallelo + 90 degree)'
			ifFacts: SFactBase rectangleFacts
			then: (SFact new name: #Rectangle). 
	self assert: (r canFireWith: SFactBase rectangle)
]

{ #category : #tests }
CRuleTest >> testRuleShouldNotFire [
	| r |
	r := SRule
		name: 'Rectangle (parallelo + 90 degree)'
		ifFacts: SFactBase rectangleFacts
		then: (SFact new name: #Rectangle).
	self deny: (r canFireWith: SFactBase rhombus)
]
