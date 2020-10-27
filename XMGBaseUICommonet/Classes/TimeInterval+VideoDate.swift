//
//  TimeInterval+VideoDate.swift
//  MainProject
//
//  Created by 尚软科技 on 2019/12/3.
//  Copyright © 2019 cnsunrun. All rights reserved.
//

import Foundation

extension TimeInterval{
    
    func xmg_getDurationString() -> String{
        
        if self.isNaN{
           return "00:00"
        }
        let time = Int(self)
        if time < 60{
            let second = String(format: "%.2d", time)
            return "00:\(second)"
        }else if time < (60 * 60){
            let minute = time / 60
            let minuteStr = String(format: "%.2d", minute)
            let second = time % 60
            let secondStr = String(format: "%.2d", second)
            return "\(minuteStr):\(secondStr)"
        }else if time < (24 * 60 * 60){
            let hour = time / 60 / 60
            let hourStr = String(format: "%.2d", hour)
            let seconds =  time % (60 * 60)//剩余的秒数
            let minute = seconds / 60
            let minuteStr = String(format: "%.2d", minute)
            let second = seconds % 60
            let secondStr = String(format: "%.2d", second)
            return "\(hourStr):\(minuteStr):\(secondStr)"
        }else{
            return "00:00"
        }
    }
      
    
}
