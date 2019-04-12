"
A simple class to represent facts.

Here are some examples: 

Fact new
	description: 'What is the number of edges of the polygon';
	name: #EdgeNumber
 Fact new
	description: 'What is the number of edges of the polygon';
	name: #EdgeNumber

By default a value is true to ease simple boolean fact creation. 

 Fact new
	description: 'Are the edges of same length';
	name: #SameSideLength.
	

"
Class {
	#name : #SFact,
	#superclass : #Object,
	#instVars : [
		'name',
		'description',
		'value'
	],
	#category : #SimpleEngine
}

{ #category : #facts }
SFact class >> allEdgesSameLength [
	<sampleInstance>
	^ SFact new
		name: #allEdgesSameLength;
		description: 'The shape all the edges of the same length'
]

{ #category : #facts }
SFact class >> fourEdges [
	<sampleInstance>
	^ SFact new
		name: #fourEdges;
		description: 'The shape has 4 edges'
]

{ #category : #facts }
SFact class >> has90degreeAngle [
	<sampleInstance>
	^ SFact new
		name: #has90degreeAngle;
		description: 'The shape has one 90 degree angle'
]

{ #category : #facts }
SFact class >> parallelTwoByTwo [
	<sampleInstance>
	^ SFact new
		name: #parallelTwoByTwo;
		description: 'The shape has two by two parallel edges'
]

{ #category : #'potentially deduceable facts' }
SFact class >> parallelogram [
		<sampleInstance>
	^ SFact new
		name: #parallelogram;
		description: 'The shape is a parallelogram.'
]

{ #category : #facts }
SFact class >> quadrilateral [
	<sampleInstance>
	^ SFact new
		name: #quadrilateral;
		description: 'The shape is a quadrilateral.'
]

{ #category : #'potentially deduceable facts' }
SFact class >> rectangle [
	<sampleInstance>
	^ SFact new
		name: #rectangle;
		description: 'The shape is a rectangle'
]

{ #category : #'potentially deduceable facts' }
SFact class >> rhombus [
		<sampleInstance>
	^ SFact new
		name: #rhombus;
		description: 'The shape is a rhombus.'
]

{ #category : #facts }
SFact class >> threeEdges [
	<sampleInstance>
	^ SFact new
		name: #fourEdges;
		description: 'The shape has 3 edges'
]

{ #category : #'potentially deduceable facts' }
SFact class >> triangle [
	<sampleInstance>
	^ SFact new
		name: #triangle;
		description: 'The shape is a triangle'
]

{ #category : #accessing }
SFact >> description [
	^ description
]

{ #category : #accessing }
SFact >> description: aString [ 
	description := aString
]

{ #category : #initialization }
SFact >> initialize [ 
	super initialize.
	value := true
]

{ #category : #accessing }
SFact >> name [ 
	^ name 
]

{ #category : #accessing }
SFact >> name: aString [ 
	name := aString
]

{ #category : #printing }
SFact >> printOn: aStream [

	aStream nextPutAll: 'F(' , name asString , ')'
]
