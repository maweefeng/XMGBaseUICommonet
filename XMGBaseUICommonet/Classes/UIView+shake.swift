//
//  UIView+shake.swift
//  BaseUICommponet
//
//  Created by 尚软科技 on 2020/8/5.
//  Copyright © 2020 小马科技. All rights reserved.
//

import UIKit
extension UIView{
    
    func xmg_shake() {
        let impact = UIImpactFeedbackGenerator(style: .light)
        impact.impactOccurred()
        let animation = CAKeyframeAnimation(keyPath: "position.x")
        animation.values = [0, 5, 10, -10, 10, 5, 0]
        animation.keyTimes = [0,NSNumber(value: (1.0 / 6.0)),NSNumber(value: (2.0 / 6.0)),NSNumber(value: (3.0 / 6.0)),NSNumber(value: (5.0 / 6.0)),NSNumber(value: (2.0 / 6.0)),1]
        animation.duration = 0.4;
        animation.isAdditive = true;
        self.layer.add(animation, forKey: "shake")
    }
}
