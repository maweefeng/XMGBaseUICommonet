//
//  UILable+Ext.swift
//  MainProject
//
//  Created by 尚软科技 on 2019/12/17.
//  Copyright © 2019 cnsunrun. All rights reserved.
//

import UIKit
extension UILabel {
 
    
    /// 为UILabel显示的文本加下划线
    func xmg_underline() {
 
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length))
            attributedText = attributedString
        }
    }
 
}

