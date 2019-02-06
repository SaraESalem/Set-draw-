//
//  CardView.swift
//  SetGameDraw
//
//  Created by Sara Elsayed Salem on 2/1/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    var cardShape: ViewShape? {
        didSet {
            setNeedsDisplay()
            setNeedsLayout()
        }
    }
    
    var cardShade: ViewShading? {
        didSet {
            setNeedsDisplay()
            setNeedsLayout()
        }
    }
    
     var cardColor : UIColor? {
        didSet {
            setNeedsDisplay();
            setNeedsLayout()
        }
    }
    var cardNumberOfShapes : Int? {
        didSet {
            setNeedsDisplay();
            setNeedsLayout()
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.subviews.forEach({ $0.removeFromSuperview() })
        if cardShape == ViewShape.squiggle{
            drawSquiggle(cardNumberOfShapes: cardNumberOfShapes!)
        }else if cardShape == ViewShape.oval{
            drawOval(cardNumberOfShapes: cardNumberOfShapes!)
        }else if cardShape == ViewShape.diamond{
            drawDiamond(cardNumberOfShapes: cardNumberOfShapes!)
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        self.subviews.forEach({ $0.removeFromSuperview() })
        setNeedsDisplay()
        setNeedsLayout()
    }

    func drawDiamond(cardNumberOfShapes:Int){
        var shapes = [UIView]()
        for index  in 0..<cardNumberOfShapes{
            var diamond = DiamondView()
            diamond.backgroundColor = UIColor.clear
            diamond.shadingType = cardShade
            diamond.shapeColor = cardColor
            diamond.frame.size.width =  bounds.size.height/3   //bz card 2/3 ratio and h will be greater than w
            diamond.frame.size.height = bounds.size.height/3
            shapes.append(diamond)
            
            if cardNumberOfShapes == 1{
                shapes[index].frame.origin.x = bounds.midX - (shapes[index].frame.size.width)/2
                shapes[index].frame.origin.y = bounds.midY - (shapes[index].frame.size.height)/2
            }else if cardNumberOfShapes == 2{
                //1st card
                if index == 0 {
                    shapes[index].frame.origin.x = bounds.midX - (shapes[index].frame.size.width)/2
                    shapes[index].frame.origin.y = (bounds.size.height)/2 - (shapes[index].frame.size.height)
                }
                //2nd card
                if index  == 1{
                    shapes[index].frame.origin.x = bounds.midX - (shapes[index].frame.size.width)/2
                    shapes[index].frame.origin.y = (bounds.size.height)/2 + (shapes[index].frame.size.height)/4
                }
            }else if cardNumberOfShapes == 3{
                //1st card
                if index == 0 {
                    shapes[index].frame.origin.x = bounds.midX - (shapes[index].frame.size.width)/2
                    shapes[index].frame.origin.y = 0
                }
                //2nd card
                if index == 1{
                    shapes[index].frame.origin.x = bounds.midX - (shapes[index].frame.size.width)/2
                    shapes[index].frame.origin.y = shapes[index].frame.size.height
                    
                }
                //3rd card
                if index == 2{
                    shapes[index].frame.origin.x = bounds.midX - (shapes[index].frame.size.width)/2
                    shapes[index].frame.origin.y = 2*shapes[index].frame.size.height
                }
                shapes[index].frame = shapes[index].frame.insetBy(dx: 0, dy: (shapes[index].frame.size.height)*0.05)
            }
            addSubview(diamond)
        }
    }
    func drawOval(cardNumberOfShapes:Int){
        var shapes = [UIView]()
        for index  in 0..<cardNumberOfShapes{
            var oval = OvalView()
            oval.backgroundColor = UIColor.clear
            oval.shadingType = cardShade
            oval.shapeColor = cardColor
            oval.frame.size.width =  bounds.size.height * 0.4
            oval.frame.size.height = bounds.size.height/3
            shapes.append(oval)
            if cardNumberOfShapes == 1{
                shapes[index].frame.origin.x = bounds.midX - (shapes[index].frame.size.width)/2
                shapes[index].frame.origin.y = bounds.midY - (shapes[index].frame.size.height)/2
            }else if cardNumberOfShapes == 2{
                //1st card
                if index == 0 {
                    shapes[index].frame.origin.x = bounds.midX - (shapes[index].frame.size.width)/2
                    shapes[index].frame.origin.y = (bounds.size.height)/2 - (shapes[index].frame.size.height)
                }
                //2nd card
                if index  == 1{
                    shapes[index].frame.origin.x = bounds.midX - (shapes[index].frame.size.width)/2
                    shapes[index].frame.origin.y = (bounds.size.height)/2 + (shapes[index].frame.size.height)/4
                }
            }else if cardNumberOfShapes == 3{
                //1st card
                if index == 0 {
                    shapes[index].frame.origin.x = bounds.midX - (shapes[index].frame.size.width)/2
                    shapes[index].frame.origin.y = 0
                }
                //2nd card
                if index == 1{
                    shapes[index].frame.origin.x = bounds.midX - (shapes[index].frame.size.width)/2
                    shapes[index].frame.origin.y = shapes[index].frame.size.height
                    
                }
                //3rd card
                if index == 2{
                    shapes[index].frame.origin.x = bounds.midX - (shapes[index].frame.size.width)/2
                    shapes[index].frame.origin.y = 2*shapes[index].frame.size.height
                }
                shapes[index].frame = shapes[index].frame.insetBy(dx: 0, dy: (shapes[index].frame.size.height)*0.05)
            }
            
            addSubview(oval)
        }
    }
    func drawSquiggle(cardNumberOfShapes:Int){
        var shapes = [UIView]()
        for index  in 0..<cardNumberOfShapes{
            var squiggle = SquiggleView()
            squiggle.shadingType = cardShade
            squiggle.shapeColor = cardColor
            squiggle.backgroundColor = UIColor.clear
            
            squiggle.frame.size.width =  bounds.size.height/3
            squiggle.frame.size.height = bounds.size.height/3
            
            shapes.append(squiggle)
            
            if cardNumberOfShapes == 1{
                shapes[index].frame.origin.x = bounds.midX - (shapes[index].frame.size.width)/2
                shapes[index].frame.origin.y = bounds.midY - (shapes[index].frame.size.height)/2
            }else if cardNumberOfShapes == 2{

                if index == 0 {
                    shapes[index].frame.origin.x = bounds.midX - (shapes[index].frame.size.width)/2
                    shapes[index].frame.origin.y = (bounds.size.height)/2 - (shapes[index].frame.size.height)
                }
                if index  == 1{
                    shapes[index].frame.origin.x = bounds.midX - (shapes[index].frame.size.width)/2
                    shapes[index].frame.origin.y = (bounds.size.height)/2 + (shapes[index].frame.size.height)/4
                }
                
            }else if cardNumberOfShapes == 3{
                //1st card
                if index == 0 {
                    shapes[index].frame.origin.x = bounds.midX - (shapes[index].frame.size.width)/2
                    shapes[index].frame.origin.y = 0
                }
                //2nd card
                if index == 1{
                    shapes[index].frame.origin.x = bounds.midX - (shapes[index].frame.size.width)/2
                    shapes[index].frame.origin.y = shapes[index].frame.size.height
                    
                }
                //3rd card
                if index == 2{
                    shapes[index].frame.origin.x = bounds.midX - (shapes[index].frame.size.width)/2
                    shapes[index].frame.origin.y = 2*shapes[index].frame.size.height
                }
                shapes[index].frame = shapes[index].frame.insetBy(dx: 0, dy: (shapes[index].frame.size.height)*0.05)
            }
            addSubview(squiggle)
        }
    }
    

}


