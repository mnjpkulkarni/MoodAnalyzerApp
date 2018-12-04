//
//  MoodModel.swift
//  MoodAnalyzer
//
//  Created by Manoj Kulkarni on 12/4/18.
//  Copyright © 2018 Manoj Kulkarni. All rights reserved.
//

import Foundation

struct MoodModel {
    public let mood: String!
}


class MoodAnalysis {
    
    public private (set) var textInput: String!
    
    public var mood: MoodModel!
    
    
    init(textInput: String) {
        self.textInput = textInput
        analyzeMood()
    }
    
    
    public func analyzeMood() {
        let prediction = try? MoodAnalyzer().prediction(text: self.textInput)
        guard let predictedText = prediction?.label else {
            self.mood = MoodModel(mood: "Could Analyze!!")
            return
        }
        let emoticonResponse = self.emoticon(label: predictedText)
        self.mood = MoodModel(mood: emoticonResponse)
    }
    
    
    func emoticon(label: String) -> String {
        switch label {
        case "kindness":
            return "Kind 🤗"
        case "encouragement":
            return "Encouraging 😃"
        case "mean":
            return "Mean 🤬"
        case "neutral":
            return "Neutral 😶"
        default:
            return "Unknown 😬"
        }
    }
    
}
