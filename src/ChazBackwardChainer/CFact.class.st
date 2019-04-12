Class {
	#name : #CFact,
	#superclass : #Object,
	#instVars : [
		'name',
		'conclusion'
	],
	#category : #ChazBackwardChainer
}

{ #category : #accessing }
CFact >> conclusion [
	^ conclusion
]

{ #category : #accessing }
CFact >> conclusion: aFact [ 
	conclusion := aFact
]

{ #category : #accessing }
CFact >> name [ 

	^ name
]

{ #category : #accessing }
CFact >> name: aString [ 
	name := aString
]
