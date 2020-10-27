//
//  UIColor+Theme.swift
//  MVVMSwiftExample
//
//  Created by Dino Bartosak on 27/09/16.
//  Copyright © 2016 Toptal. All rights reserved.
//

import UIKit

extension UIColor {
    
    //返回随机颜色
    public class var xmg_randomColor: UIColor {
        get {
            let red = CGFloat(arc4random()%256)/255.0
            let green = CGFloat(arc4random()%256)/255.0
            let blue = CGFloat(arc4random()%256)/255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
    
    
    
    // MARK: Private
    fileprivate static func xmg_rgba(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
    
    fileprivate static func xmg_rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor {
        return xmg_rgba(r, g, b, 1.0)
    }
    
    // MARK: Public
    public static let themeColor = XMGColorWithHex(0xEE6B00)
    public static let borderColor = XMGColorWithHex(0xE5E5EA)
    public static let backgroundColor = XMGColorWithHex(0xF5F5F5)
    public static let scoreColor = xmg_rgb(255, 193, 45)
    public static let textColor = XMGColorWithHex(0x1A1A1A)
    public static let playerBackgroundColor = xmg_rgb(84, 77, 126)
    public static let brightPlayerBackgroundColor = xmg_rgba(101, 88, 156, 0.5)
    
    public static let textColor333 = XMGColorWithHex(0x333333)
    public static let textColor666 = XMGColorWithHex(0x666666)
    public static let textColor999 = XMGColorWithHex(0x999999)
    
    public static let lineColor = XMGColorWithHex(0xe6e6e6)
}
