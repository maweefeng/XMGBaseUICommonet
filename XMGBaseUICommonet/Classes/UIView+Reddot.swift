//
//  UIView+Reddot.swift
//  BaseUICommponet
//
//  Created by 尚软科技 on 2020/7/24.
//  Copyright © 2020 小马科技. All rights reserved.
//

import UIKit
import SnapKit
extension UIView{
    /// 添加红点
    /// - Parameter sideLength: 红点的边长
    func xmg_addRedDot(sideLength:CGFloat = 5){
        self.clipsToBounds = false
        let redSpot = UIView()
        redSpot.tag = 120000
        redSpot.backgroundColor = .red
        redSpot.layer.cornerRadius = sideLength
        self.addSubview(redSpot)
        redSpot.snp.makeConstraints { (m) in
            m.trailing.equalToSuperview().offset(2*sideLength)
            m.top.equalToSuperview().offset(-2*sideLength)
            m.width.height.equalTo(sideLength*2)
        }
    }
    
    ///移除消息红点
    func xmg_removeDot(){
        if let redDot = self.viewWithTag(120000){
            redDot.removeFromSuperview()
        }
    }
    
    /// 添加角标提示
    /// - Parameters:
    ///   - badgeNum: 角标数量，如果为0则不显示
    ///   - cornerRadius: 默认为7
    func xmg_addBadgeView(badgeNum:Int,cornerRadius:CGFloat = 7){
        if badgeNum == 0 {
            xmg_removeBadgeView()
            return
        }
        self.clipsToBounds = false
        let badgeL = UILabel()
        badgeL.tag = 120001
        badgeL.font = .systemFont(ofSize: 10, weight: .regular)
        badgeL.textAlignment = .center
        badgeL.textColor = .white
        badgeL.backgroundColor = .red
        badgeL.text = "\(badgeNum)"
        badgeL.layer.cornerRadius = cornerRadius
        badgeL.minimumScaleFactor = 0.5
        badgeL.clipsToBounds = true
        badgeL.adjustsFontSizeToFitWidth = true
        self.addSubview(badgeL)
        badgeL.snp.makeConstraints { (m) in
            m.trailing.equalToSuperview().offset(cornerRadius)
            m.top.equalToSuperview().offset(-cornerRadius)
            m.height.equalTo(cornerRadius*2)
            m.width.greaterThanOrEqualTo(cornerRadius*2)
        }
        
    }
    
    func xmg_removeBadgeView(){
        if let redDot = self.viewWithTag(120001){
            redDot.removeFromSuperview()
        }
    }
    
    
}



