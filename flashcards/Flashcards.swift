//
//  Flashcards.swift
//  flashcards
//
//  Created by iD Student on 8/1/17.
//  Copyright © 2017 iD Tech. All rights reserved.
//

import Foundation

class Flashcard {
    var question : String
    
    var options : [String]
    var correctAnswer : String
    
    init(question : String, options : [String]){
        self.question = question
        self.options = options
        
        self.correctAnswer = options[0]
    }
}

class CardCollection {
    
    public static var instance : CardCollection = CardCollection()
    
    public private(set) var cards : [Flashcard]
    public private(set) var currentIndex : Int

    public var currentCard : Flashcard {
        get { return cards[currentIndex] }
    }
    private init() {
        cards = [Flashcard(question : "How old is Colby?", options : ["15","16","14","17"]),
                 Flashcard(question : "What street does Colby live on?", options : ["Whistler Lane","Ledge Hill","Breakneck Road","Sears Road"]),
                 Flashcard(question : "What is Colby's sisters name?", options : ["Lexi","Hanna","Kelcie","Isana"])]
        currentIndex = 0
    }
    public func nextQuestion() {
        currentIndex += 1
        if(currentIndex >= cards.count){
            currentIndex = 0
        }
    }
    
    public func checkAnswer(_ selectedAnswer : Int) -> Bool {
        return currentCard.options[selectedAnswer] == currentCard.correctAnswer
    }
}
