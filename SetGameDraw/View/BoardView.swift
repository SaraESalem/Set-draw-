//
//  BoardView.swift
//  SetGameDraw
//
//  Created by Sara Elsayed Salem on 2/1/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class BoardView: UIView {

    private(set) var gridSystem = Grid(layout: .aspectRatio(2/3))
    private(set) var cardViews = [CardView]()
    
    override func layoutSubviews() {
        super.layoutSubviews()

        gridSystem.frame = CGRect(x: bounds.origin.x,y: bounds.origin.y,width: bounds.size.width,height: bounds.size.height)
        
        for index in 0..<cardViews.count {
            if let cell = gridSystem[index]  { //get frame for each cell
                let cardView = cardViews[index]
                    let cellWithMargin5 = cell.insetBy(dx: 3, dy: 3)
                    cardView.frame = cellWithMargin5 //set frame call layoutsubviews of cardview
                    cardView.backgroundColor = UIColor.white
                    cardView.layer.cornerRadius = 0.05 * cardView.frame.height
            }
        }
    }

    func addCardsOnBoard(with number:Int){
        for _ in 0..<number {
            let card = CardView()
            cardViews.append(card)
            addSubview(card)
        }
        gridSystem.cellCount = cardViews.count
        setNeedsLayout()
    }
    
    func resetBoard(){
        cardViews = []
        gridSystem.cellCount = 0
        removeAllSubViews()
        setNeedsLayout()
    }
    func removeAllSubViews(){
        self.subviews.forEach({ $0.removeFromSuperview() })
    }
    
    func removeCardView(at indexes : [Int]){
        for index in indexes{
            cardViews[index].removeFromSuperview()
        }
            cardViews.remove(at: indexes)
            gridSystem.cellCount = cardViews.count
            setNeedsLayout()
        }
}

