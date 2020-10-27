//
//  UIView+PlayView.swift
//  MainProject
//
//  Created by 尚软科技 on 2019/12/3.
//  Copyright © 2019 cnsunrun. All rights reserved.
//

import UIKit


extension UIView{
    
    func xmg_addGradientLayer(colors:[CGColor]){
        self.layer.sublayers?.removeAll(where: {$0.xmg_className == "CAGradientLayer"})
        
        let gradient = CAGradientLayer()
        gradient.colors = colors
        gradient.locations = [0, 1]
        gradient.frame = self.bounds
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        self.layer.insertSublayer(gradient, at: 0)
        
    }
    
    func xmg_addShadowLayer(shadowColor:UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.08),radius:CGFloat = 5){
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = radius
    }
    
    func xmg_drawDottedLine(color:UIColor)->CAShapeLayer{
        self.layer.sublayers?.removeAll(where: {$0.xmg_className == "CAShapeLayer"})

        let shapeLayer:CAShapeLayer = CAShapeLayer()
        shapeLayer.bounds = self.bounds
        
        shapeLayer.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPhase = 0
        shapeLayer.lineDashPattern = [NSNumber(value: 3), NSNumber(value: 3)]
        
        let path:CGMutablePath = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: self.bounds.height/2))
        path.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height/2))
        shapeLayer.path = path
        self.layer.insertSublayer(shapeLayer, at: 0)
        return shapeLayer
    }
}
