//
//  OvalView.swift
//  SetGameDraw
//
//  Created by Sara Elsayed Salem on 2/1/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

@IBDesignable
class OvalView: UIView , DrawShapeProtocol {
    
    var shapeColor: UIColor?
    var shadingType: ViewShading?
 
    override func draw(_ rect: CGRect) {
        let defaultColor =  ViewColor.green
        let defaultshading = ViewShading.striped        
        drawShape(shapeColor: shapeColor ?? defaultColor.getColorValue() ,shadingType:shadingType ?? defaultshading)
    }
    
    func drawShape(shapeColor: UIColor, shadingType: ViewShading) {
        var path = UIBezierPath(ovalIn: CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width, height: bounds.size.height))
        path.addClip()
        
        shapeColor.setStroke()
        Shading.drawShading(shading: shadingType, color:  shapeColor, path: path)
        path.stroke()
    }

}
