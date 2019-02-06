//
//  Card.swift
//  SetGameDraw
//
//  Created by Sara Elsayed Salem on 2/1/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

struct Card : Hashable{
    
    var isMatched : Bool = false
    var isSelected : Bool = false
    var shape:Shape
    var shading:Shading
    var color:Color
    var number:Number
    
    enum Shape:String,CustomStringConvertible {
        
        var description: String{
            return rawValue
        }
        case squiggle = "squiggle"
        case oval = "oval"
        case diamond = "diamond"
        
        static var allShapes = [Shape.squiggle,.oval,.diamond]
    }
    enum Shading :String,CustomStringConvertible{
        
        var description: String{
            return rawValue
        }
        case solid = "solid"
        case striped = "striped"
        case open = "open"
   
        static var allShading = [Shading.solid,.striped,.open]
        
    }
    
    enum Color:String ,CustomStringConvertible{
        var description: String{
            return rawValue
        }
        
        case green = "green"
        case red = "red"
        case purple = "purple"
        
        static var allColors = [Color.green,.red,.purple]
    }
    enum Number:String , CustomStringConvertible {
        var description: String{
            return rawValue
        }
        case one = "1"
        case two = "2"
        case three = "3"
        
        var numberVal: Int {
            switch self {
            case .one : return 1
            case .two : return 2
            case .three :  return 3
            }
        }
        
        static var allNumbers = [Number.one,.two,.three]
    }
    
}
