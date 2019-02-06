//
//  ViewController.swift
//  SetGameDraw
//
//  Created by Sara Elsayed Salem on 1/24/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var boardView: BoardView!
    @IBOutlet weak var scoreUiLabel: UILabel!
    @IBOutlet weak var deal3MoreCard: UIButton!{
        didSet{
            deal3MoreCard.addGestureRecognizer(UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeDeal3MoreCard(_:))))
        }
    }
    @IBAction func deal3MoreCardsButtonHandle(_ sender: UIButton) {
        dealThreeMoreCard()
    }
    
    @IBAction func handleRotation(_ sender: UIRotationGestureRecognizer) {
        if sender.state == .began {
            game.shuffleCards()
            for index in 0..<boardView.cardViews.count {
                drawCards(on: index)
            }
        }
    }
    @IBAction func newGameButtonHandle(_ sender: UIButton) {
        game.startNewGame(with : game.numberOfCardsToShowOnGameStart)
        boardView.resetBoard()
        startGame()
        scoreValue = 0
        deal3MoreCard.isEnabled = true
    }
    private lazy var game = Set()
    private(set) var scoreValue = 0 {
        didSet {
            updateScoreLabel()
        }
    }
    @objc func handleCardSelect(_ recognizer:UITapGestureRecognizer){
        switch recognizer.state {
        case .ended:
            if let card = recognizer.view as? CardView {
                game.selectCard(at: boardView.cardViews.index(of: card)!){ [weak self] (result,type,matchedIndexes) in
                    self?.scoreValue += result
                    if type == Set.Result.match {
                        self?.boardView.removeCardView(at : matchedIndexes)
                        self?.dealThreeMoreCard()
                    }
                }
                updateViewFromModel()
            }
            break
        default:
            break
        }
    }
    @objc func handleSwipeDeal3MoreCard(_ recognizer:UITapGestureRecognizer){
        switch recognizer.state {
        case .ended:
             dealThreeMoreCard()
            break
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         startGame()
    }
    
   private func dealThreeMoreCard(){
        if game.cards.count > 0 {
            game.dealThreeMoreCard()
            boardView.addCardsOnBoard(with: game.numberOfCardsToDeal)
            for index in 0..<boardView.cardViews.count{
                drawCards(on: index)
            }
        }else{
            deal3MoreCard.isEnabled = false
        }
    }
    private func updateViewFromModel (){
        for index in 0..<boardView.cardViews.count{
            let cardView = boardView.cardViews[index]
            let card = game.cardsOnBoard[index]
            if !card.isMatched {
                //for selected
                if game.arrOfSelectedCards.count > 0 && game.arrOfSelectedCards.contains(card) && card.isSelected {
                    cardView.layer.borderWidth = 3.0
                    cardView.layer.borderColor = UIColor.blue.cgColor
                }else{
                    cardView.layer.borderColor = UIColor.white.cgColor
                    cardView.layer.borderWidth = 0.0
                }
            }
        }
    }
    
   private func startGame(){
        boardView.addCardsOnBoard(with: game.numberOfCardsToShowOnGameStart)
        game.startNewGame(with: game.numberOfCardsToShowOnGameStart)
        for index in 0..<boardView.cardViews.count{
            drawCards(on: index)
        }
    }
    func drawCards(on index :Int ) {
        
        let cardView = boardView.cardViews[index]
        let card = game.cardsOnBoard[index]
        cardView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleCardSelect(_:))))
        switch card.shading {
            
        case .solid:
            cardView.cardShade = ViewShading.solid
        case .striped:
            cardView.cardShade = ViewShading.striped
        case .open:
            cardView.cardShade = ViewShading.open
        }
    
        switch card.shape {
            
        case .diamond:
            cardView.cardShape = ViewShape.diamond
        case .oval:
            cardView.cardShape = ViewShape.oval
        case .squiggle:
            cardView.cardShape = ViewShape.squiggle
            
        }
        switch card.color {
            
        case .red:
            cardView.cardColor = UIColor.red
        case .green:
            cardView.cardColor = UIColor.green
        case .purple:
            cardView.cardColor = UIColor.purple
            
        }
        switch card.number {
            
        case .one:
            cardView.cardNumberOfShapes = 1
        case .two:
            cardView.cardNumberOfShapes = 2
        case .three:
            cardView.cardNumberOfShapes = 3
            
        }
    }
    private func updateScoreLabel(){
        let attributes: [NSAttributedString.Key:Any] = [
            .strokeWidth: 5.0,
            .strokeColor : UIColor.blue
        ]
        let attribText = NSAttributedString(string: "Score: \(scoreValue)", attributes: attributes)
        scoreUiLabel.attributedText = attribText
    }
}

