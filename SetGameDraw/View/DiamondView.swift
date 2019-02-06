//
//  DiamondView.swift
//  SetGameDraw
//
//  Created by Sara Elsayed Salem on 2/1/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

@IBDesignable
class DiamondView: UIView , DrawShapeProtocol {
    
    var shapeColor: UIColor?
    var shadingType: ViewShading?
        
    override func draw(_ rect: CGRect) {
        let defaultColor =  ViewColor.green
        let defaultshading = ViewShading.striped
        drawShape(shapeColor: shapeColor ?? defaultColor.getColorValue() ,shadingType:shadingType ?? defaultshading)
    }
    
    func drawShape(shapeColor:UIColor,shadingType:ViewShading) {
        
        let path = UIBezierPath()
        path.lineWidth = 4
  
        path.move(to: CGPoint(x: bounds.midX, y: bounds.origin.y))
        path.addLine(to: CGPoint(x: bounds.size.width, y: bounds.midY))
        path.addLine(to: CGPoint(x: bounds.midX , y: bounds.size.height))
        path.addLine(to: CGPoint(x: bounds.origin.x  , y: bounds.midY))
        path.addLine(to: CGPoint(x: bounds.midX, y:  bounds.origin.y))
        path.addClip()
        
        shapeColor.setStroke()
        Shading.drawShading(shading: shadingType, color:  shapeColor, path: path)
        path.stroke()
    }
 
}
