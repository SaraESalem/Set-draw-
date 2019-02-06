//
//  SquiggleView.swift
//  SetGameDraw
//
//  Created by Sara Elsayed Salem on 2/1/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

@IBDesignable
class SquiggleView: UIView , DrawShapeProtocol {
    
    var shapeColor: UIColor?
    var shadingType: ViewShading?
    override func draw(_ rect: CGRect) {
        
        let defaultColor =  ViewColor.green
        let defaultshading = ViewShading.striped        
        drawShape(shapeColor: shapeColor ?? defaultColor.getColorValue() ,shadingType:shadingType ?? defaultshading)
    }
    
    func drawShape(shapeColor:UIColor,shadingType:ViewShading) {
        
        let path = UIBezierPath()
        path.lineWidth = 2;
        path.move(to: CGPoint(x: bounds.origin.x + bounds.size.width*0.05, y: bounds.origin.y + bounds.size.height*0.40))
        path.addCurve(to: CGPoint(x: bounds.origin.x + bounds.size.width*0.35, y:  bounds.origin.y + bounds.size.height*0.25), controlPoint1: CGPoint(x: bounds.origin.x + bounds.size.width*0.09, y: bounds.origin.y + bounds.size.height*0.15), controlPoint2: CGPoint(x: bounds.origin.x + bounds.size.width*0.18, y: bounds.origin.y + bounds.size.height*0.10))
        path.addCurve(to: CGPoint(x:bounds.origin.x + bounds.size.width*0.75, y: bounds.origin.y + bounds.size.height*0.30), controlPoint1: CGPoint(x:bounds.origin.x + bounds.size.width*0.40,y: bounds.origin.y + bounds.size.height*0.30), controlPoint2: CGPoint(x:bounds.origin.x + bounds.size.width*0.60, y:bounds.origin.y + bounds.size.height*0.45))
        path.addCurve(to: CGPoint(x:bounds.origin.x + bounds.size.width*0.97,y: bounds.origin.y + bounds.size.height*0.35), controlPoint1: CGPoint(x:bounds.origin.x + bounds.size.width*0.87,y: bounds.origin.y + bounds.size.height*0.15), controlPoint2: CGPoint(x:bounds.origin.x + bounds.size.width*0.98,y: bounds.origin.y + bounds.size.height*0.00))
        path.addCurve(to: CGPoint(x:bounds.origin.x + bounds.size.width*0.45,y: bounds.origin.y + bounds.size.height*0.85), controlPoint1: CGPoint(x:bounds.origin.x + bounds.size.width*0.95, y:bounds.origin.y + bounds.size.height*1.10), controlPoint2: CGPoint(x:bounds.origin.x + bounds.size.width*0.50,y: bounds.origin.y + bounds.size.height*0.95))
        path.addCurve(to: CGPoint(x:bounds.origin.x + bounds.size.width*0.25,y: bounds.origin.y + bounds.size.height*0.85), controlPoint1: CGPoint(x:bounds.origin.x + bounds.size.width*0.40,y: bounds.origin.y + bounds.size.height*0.80), controlPoint2: CGPoint(x:bounds.origin.x + bounds.size.width*0.35,y: bounds.origin.y + bounds.size.height*0.75))
        path.addCurve(to: CGPoint(x:bounds.origin.x + bounds.size.width*0.05, y:bounds.origin.y + bounds.size.height*0.40), controlPoint1: CGPoint(x:bounds.origin.x + bounds.size.width*0.00,y: bounds.origin.y + bounds.size.height*1.10), controlPoint2: CGPoint(x:bounds.origin.x + bounds.size.width*0.005,y: bounds.origin.y + bounds.size.height*0.60))
        path.addClip()
        
        shapeColor.setStroke()
        Shading.drawShading(shading: shadingType, color:  shapeColor, path: path)
        path.stroke()
    }

}


