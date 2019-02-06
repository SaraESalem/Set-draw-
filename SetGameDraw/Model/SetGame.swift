//
//  SetGame.swift
//  SetGameDraw
//
//  Created by Sara Elsayed Salem on 2/1/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

class Set {
    
    private(set)  var cards  = [Card]()
    private(set) var arrOfSelectedCards = [Card]()
    private(set) var numberOfCardsOnTheGame = 81
    private(set) var numberOfCardsToShowOnGameStart = 12
    private(set) var numberOfCardsToDeal = 3
    private(set)  var cardsOnBoard  = [Card]()
    
    enum Result : Int{
        case match = 3
        case mismatch = -5
        case deselection = -1
    }
    
    func startNewGame(with numberOfCards : Int){
        cards = []
        cardsOnBoard = []
        createCardsList()
        for _ in 0..<numberOfCards { //12
            getCard()
        }
    }
    func getCard(){
        if cards.count > 0{
            let card = cards.removeLast()
            cardsOnBoard.append(card)
        }
    }
    func dealThreeMoreCard(){
            for _ in 0..<numberOfCardsToDeal {
                getCard()
            }
    }
    func shuffleCards() {
        cardsOnBoard.shuffle()
    }
    func createCardsList(){
        for number in Card.Number.allNumbers {
            for shape in  Card.Shape.allShapes{
                for shade in Card.Shading.allShading {
                    for color in Card.Color.allColors {
                        let card = Card(isMatched: false,isSelected:false,shape:shape,shading:shade,color:color,number:number)
                        cards.append(card)
                    }
                }
            }
        }
        cards.shuffle()
    }
    
    init() {
        createCardsList()
    }
    
    //matching algorithm // incase matching display another 3 cards
    func selectCard(at index : Int ,matching result : @escaping  (Int,Result,[Int])->Void) {
         var matchedIndexes = [Int]()
        //user want to deselect card//
        if arrOfSelectedCards.contains(cardsOnBoard[index]) && cardsOnBoard[index].isSelected {
            arrOfSelectedCards.remove(at:arrOfSelectedCards.index(of:cardsOnBoard[index])!)
            cardsOnBoard[index].isSelected = false
            result(Result.deselection.rawValue,.deselection,matchedIndexes)
        }else{
            //user want to select//
            cardsOnBoard[index].isSelected = true
            arrOfSelectedCards.append(cardsOnBoard[index])
        }
        //to put blue border for selected card
        if arrOfSelectedCards.count == 3 {
            
            if(isSetMatched(card1: arrOfSelectedCards[0], card2: arrOfSelectedCards[1], card3: arrOfSelectedCards[2])){

                let index1 = cardsOnBoard.index(of:arrOfSelectedCards[0])!
                let index2 = cardsOnBoard.index(of:arrOfSelectedCards[1])!
                let index3 = cardsOnBoard.index(of:arrOfSelectedCards[2])!
                cardsOnBoard[index1].isMatched = true
                cardsOnBoard[index2].isMatched = true
                cardsOnBoard[index3].isMatched = true
                
                matchedIndexes += [index1,index2,index3]
                cardsOnBoard.remove(at: matchedIndexes)
                arrOfSelectedCards = []
                result(Result.match.rawValue,.match,matchedIndexes)
            }else{
                arrOfSelectedCards = []
                result(Result.mismatch.rawValue,.mismatch,matchedIndexes)
            }
        }
    }
    private func isSetMatched( card1:Card,  card2:Card,  card3:Card)  -> Bool {
        if(!areAllEqual(card1.number.rawValue, card2.number.rawValue, card3.number.rawValue) && !areAllDifferent(card1.number.rawValue, card2.number.rawValue, card3.number.rawValue)){
            return false;
        }
        if(!areAllEqual(card1.shape.rawValue, card2.shape.rawValue, card3.shape.rawValue) && !areAllDifferent(card1.shape.rawValue, card2.shape.rawValue, card3.shape.rawValue)){
            return false;
        }
        if(!areAllEqual(card1.shading.rawValue, card2.shading.rawValue, card3.shading.rawValue) && !areAllDifferent(card1.shading.rawValue, card2.shading.rawValue, card3.shading.rawValue)){
            return false;
        }
        if(!areAllEqual(card1.color.rawValue, card2.color.rawValue, card3.color.rawValue) && !areAllDifferent(card1.color.rawValue, card2.color.rawValue, card3.color.rawValue)){
            return false;
        }
        return true;
    }
    private func areAllEqual(_ val1:String,_ val2:String, _ val3:String) -> Bool{
        return val1 == val2 && val2 == val3;
    }
    private func areAllDifferent(_ val1:String,_ val2:String, _ val3:String)-> Bool{
        return val1 != val2 && val2 != val3 && val1 != val3;
    }
    
}


