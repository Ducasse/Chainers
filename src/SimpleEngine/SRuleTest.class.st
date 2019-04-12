Class {
	#name : #SRuleTest,
	#superclass : #TestCase,
	#category : #SimpleEngine
}

{ #category : #tests }
SRuleTest >> testRuleCanFire [
	| r |
	r := SRule
			name: 'Rectangle (parallelo + 90 degree)'
			ifFacts: SFactBase rectangleFacts
			then: (SFact new name: #Rectangle). 
	self assert: (r canFireWith: SFactBase rectangle)
]

{ #category : #tests }
SRuleTest >> testRuleShouldNotFire [
	| r |
	r := SRule
		name: 'Rectangle (parallelo + 90 degree)'
		ifFacts: SFactBase rectangleFacts
		then: (SFact new name: #Rectangle).
	self deny: (r canFireWith: SFactBase rhombus)
]
