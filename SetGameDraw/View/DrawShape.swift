//
//  DrawShapeProtocol.swift
//  SetGameDraw
//
//  Created by Sara Elsayed Salem on 2/1/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

enum ViewShading:String,CustomStringConvertible
{
    var description: String{
        return rawValue
    }
    case solid = "solid"
    case striped = "striped"
    case open = "open"
}

enum ViewShape {
    case squiggle
    case diamond
    case oval
}

enum ViewColor {
    case red
    case green
    case purple
    
    /// Returns the associated color.
    func getColorValue() -> UIColor {
        switch self {
        case .red:
            return #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        case .green:
            return #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        case .purple:
            return #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        }
    }
    
}

protocol DrawShapeProtocol {
    var shapeColor :UIColor? {get set}
    var shadingType:ViewShading? {get set}
    func drawShape(shapeColor:UIColor,shadingType:ViewShading)
}

struct Shading {
    
    static func drawShading(shading:ViewShading , color:UIColor , path:UIBezierPath)  {
        switch (shading.rawValue)
        {
        case "solid":
            color.setFill()
            path.fill()
            break;
        case "striped":
            self.drawStripedShadingForPath(pathOfSymbol: path)
            break;
        default:
            break;
        }
    }
    
    static func drawStripedShadingForPath(pathOfSymbol:UIBezierPath){
        // Save the graphics context
        let context = UIGraphicsGetCurrentContext()
        context!.saveGState()
        
        let bounds = pathOfSymbol.bounds
        let path = UIBezierPath()
        let DISTANCE_BETWEEN_STRIPES = 4
        let i = 0
        for i in stride(from: i, to: Int(bounds.size.width), by: DISTANCE_BETWEEN_STRIPES)
        {
            path.move(to: CGPoint(x: bounds.origin.x + CGFloat(i),y: bounds.origin.y))
            path.addLine(to: CGPoint(x:bounds.origin.x +  CGFloat(i), y: bounds.origin.y + bounds.size.height))
            
        }
        
        pathOfSymbol.addClip()
        path.stroke()
        
        // Restore the previously saved context
        context!.restoreGState()
    }
}

