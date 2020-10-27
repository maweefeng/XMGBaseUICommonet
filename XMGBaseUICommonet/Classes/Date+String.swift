//
//  Date_String.swift
//  MainProject
//
//  Created by 尚软科技 on 2019/4/17.
//  Copyright © 2019 cnsunrun. All rights reserved.
//

import UIKit

extension Date {
    func xmg_dateToString(_ dateFormat:String = "yyyy-MM-dd HH:mm:ss") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale(identifier: "zh_CN")
        let date = formatter.string(from: self)
        return date
    }
    
    
    func xmg_tommorrow()->Date{
        
        return Date.init(timeInterval: 24 * 60 * 60, since: self)
        
    }
    
    func xmg_stringToDate(_ dateString:String, dateFormat:String = "yyyy-MM-dd HH:mm:ss") -> Date? {
        let formatter = DateFormatter()
               formatter.dateFormat = dateFormat
               formatter.locale = Locale(identifier: "zh_CN")
        let date = formatter.date(from: dateString)
        return date
    }
    
   
    func xmg_dealMsgtime() -> String{
        let delta = NSDate().timeIntervalSince(self)
        if (delta <= 0) {
            return "刚刚"
        }
        else if (delta < 60) {
            return "\(Int(delta))秒前"
        }
        else if (delta < 3600) {
            return "\(Int(delta / 60))分钟前"
        }
        else {
            let calendar = NSCalendar.current
            let unitFlags = Set<Calendar.Component>([.year,.month,.day,.hour,.minute])
            let comp = calendar.dateComponents(unitFlags, from: Date())
            
            let currentYear = String(comp.year!)
            let currentDay = String(comp.day!)
            
            let comp2 = calendar.dateComponents(unitFlags, from: self)
            let year = String(comp2.year!)
            let month = String(comp2.month!)
            let day = String(comp2.day!)
            var hour = String(comp2.hour!)
            var minute = String(comp2.minute!)
            
            if comp2.hour! < 10 {
                hour = "0" + hour
            }
            if comp2.minute! < 10 {
                minute = "0" + minute
            }
            
            if currentYear == year {
                if currentDay == day {
                    return "\(hour):\(minute)"
                } else {
                    return "\(month)月\(day)日 \(hour):\(minute)"
                }
            } else {
                return "\(year)年\(month)月\(day)日 \(hour):\(minute)"
            }
        }
        
    }
}
