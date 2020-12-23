//
//  UIColor+Theme.swift
//  MVVMSwiftExample
//
//  Created by Dino Bartosak on 27/09/16.
//  Copyright © 2016 Toptal. All rights reserved.
//

import UIKit

public extension UIColor {
    
    //返回随机颜色
    class var xmg_randomColor: UIColor {
        get {
            let red = CGFloat(arc4random()%256)/255.0
            let green = CGFloat(arc4random()%256)/255.0
            let blue = CGFloat(arc4random()%256)/255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
    
    
    
    static func xmg_rgba(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
    
    static func xmg_rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor {
        return xmg_rgba(r, g, b, 1.0)
    }
    
    
}
