//
//  CardModel.swift
//  HW - 6 Memory game
//
//  Created by Iryna Mishyna on 20.10.2021.
//

import Foundation

class CardModel {
    
   
    lazy var cardsArray: [Card] = getCards()

    func getCards() -> [Card] {
        
        var generatedNumbers = [Int]()
        
        var generatedCards = [Card]()
        
        while generatedNumbers.count < 10 {
            
            // Generate random number
            let randomNumber = Int.random(in: 1...10)
            
            if !generatedNumbers.contains(randomNumber) {
                
                // Create two new card objects
                let cardOne = Card()
                let cardTwo = Card()
                
                cardOne.imageName = "card\(randomNumber)"
                cardTwo.imageName = "card\(randomNumber)"
                
                generatedCards += [cardOne, cardTwo]
                generatedNumbers.append(randomNumber)
                
                print(randomNumber)
            }
        }
        
        generatedCards.shuffle()
        
        return generatedCards
    }
}

