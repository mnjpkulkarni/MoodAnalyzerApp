import Foundation
import CreateML


//Import Data Set
let dataSet = try MLDataTable(contentsOf: URL(fileURLWithPath: "/Users/manojkulkarni/Desktop/moodAnalyzer.json"))
let (trainingData, testingData) = dataSet.randomSplit(by: 0.8, seed: 5)


//Create Text Classifier
let textClassifier = try MLTextClassifier(trainingData: trainingData, textColumn: "text", labelColumn: "label")


//Create parameter to measure training accuracy
let trainingAccuracy = 1.0 - textClassifier.trainingMetrics.classificationError

//Evaluate Accuracy
let evaluationMetrics = textClassifier.evaluation(on: testingData)
let evaluationAccuracy = 1.0 - evaluationMetrics.classificationError

//Save the MLModel to disk
let metadata = MLModelMetadata(author: "Manoj Kulkarni", shortDescription: "ML Model to analyze mood.", version: "1.0")
try textClassifier.write(to: URL(fileURLWithPath: "/Users/manojkulkarni/Desktop/MoodAnalyzer.mlmodel"), metadata: metadata)
