//
//  UILable+DeleteLine.swift
//  MainProject
//
//  Created by 尚软科技 on 2020/4/8.
//  Copyright © 2020 cnsunrun. All rights reserved.
//


import UIKit

extension UILabel{

    func xmg_setDeleteText(_ text:String,_ color:UIColor = UIColor.textColor999, _ font:UIFont = UIFont.systemFont(ofSize: 10, weight: .medium)){
        self.attributedText = text.xmg_changePartOfStringStyleWithDeleteLine(text, color: color, font: font)
        
    }
    
}
