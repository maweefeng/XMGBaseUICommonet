//
//  String+Size.swift
//  MainProject
//
//  Created by cnsunrun on 2018/2/25.
//  Copyright © 2018年 Knight. All rights reserved.
//

import UIKit
import CommonCrypto

extension String {
    
    func xmg_stringToDate(_ dateFormat:String = "yyyy-MM-dd HH:mm:ss") -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale(identifier: "zh_CN")
        let date = formatter.date(from: self)
        return date
    }
    ///获得当前是星期几
    func xmg_getWeekDay()->Int{
        let dateFmt = DateFormatter()
        dateFmt.dateFormat = "yyyy-MM-dd"
        let date = dateFmt.date(from: self)
        let interval = Int(date!.timeIntervalSince1970) + NSTimeZone.local.secondsFromGMT()
        let days = Int(interval/86400) // 24*60*60
        let weekday = ((days + 4)%7+7)%7
        return weekday == 0 ? 7 : weekday
    }
    func xmg_getStringWeekDay()->String{
        if self.count == 0{
            return ""
        }
        let dateFmt = DateFormatter()
        dateFmt.dateFormat = "yyyy-MM-dd"
        let date = dateFmt.date(from: self)
        let interval = Int(date!.timeIntervalSince1970) + NSTimeZone.local.secondsFromGMT()
        let days = Int(interval/86400) // 24*60*60
        let weekday = ((days + 4)%7+7)%7
        if weekday == 0{
            return "周日"
        }else if weekday == 1{
            return "周一"
        }else if weekday == 2{
            return "周二"
        }else if weekday == 3{
            return "周三"
        }else if weekday == 4{
            return "周四"
        }else if weekday == 5{
            return "周五"
        }else{
            return "周六"
            
        }
    }
    
    func xmg_md5() -> String {
        let cStrl = cString(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue));
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 16);
        CC_MD5(cStrl, CC_LONG(strlen(cStrl!)), buffer);
        var md5String = "";
        for idx in 0...15 {
            let obcStrl = String.init(format: "%02x", buffer[idx]);
            md5String.append(obcStrl);
        }
        free(buffer);
        return md5String;
    }
    func xmg_isIncludeChinese() -> Bool {
        for ch in self.unicodeScalars {
            // 中文字符范围：0x4e00 ~ 0x9fff
            if (0x4e00 < ch.value  && ch.value < 0x9fff) {
                return true
            }
        }
        return false
    }
    
    func xmg_transformToPinyin() -> String {
        let stringRef = NSMutableString(string: self) as CFMutableString
        // 转换为带音标的拼音
        CFStringTransform(stringRef,nil, kCFStringTransformToLatin, false);
        // 去掉音标
        CFStringTransform(stringRef, nil, kCFStringTransformStripCombiningMarks, false);
        let pinyin = stringRef as String;
        
        return pinyin
    }
    
    func xmg_transformToPinyinWithoutBlank() -> String {
        var pinyin = self.xmg_transformToPinyin()
        // 去掉空格
        pinyin = pinyin.replacingOccurrences(of: " ", with: "")
        return pinyin
    }
    
    func xmg_getPinyinHead() -> String {
        // 字符串转换为首字母大写
        let pinyin = self.xmg_transformToPinyin().capitalized
        
        var headPinyinStr = ""
        
        // 获取所有大写字母
        for ch in pinyin {
            if ch <= "Z" && ch >= "A" {
                headPinyinStr.append(ch)
            }
        }
        return headPinyinStr
    }
    
    func xmg_validateEmail() -> Bool {
        let emailRegex: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    }
    
    func xmg_validateMobile() -> Bool {
        let phoneRegex: String = "^((13[0-9])|(15[^4,\\D])|(18[0,0-9])|(17[0,0-9]))\\d{8}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: self)
    }
    
    func xmg_trimmedMobile() -> String {
        let toremove = CharacterSet(charactersIn: "+*#0123456789").inverted
        return components(separatedBy: toremove).joined()
    }
    
    func cn_widthForComment(fontSize: CGFloat, height: CGFloat = 15) -> CGFloat {
        let font = UIFont.systemFont(ofSize: fontSize)
        let rect = NSString(string: self).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: height), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(rect.width)
    }
    
    func cn_heightForComment(fontSize: CGFloat, width: CGFloat) -> CGFloat {
        let font = UIFont.systemFont(ofSize: fontSize)
        let rect = NSString(string: self).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(rect.height)
    }
    
    func cn_heightForComment(fontSize: CGFloat, width: CGFloat, maxHeight: CGFloat) -> CGFloat {
        let font = UIFont.systemFont(ofSize: fontSize)
        let rect = NSString(string: self).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(rect.height)>maxHeight ? maxHeight : ceil(rect.height)
    }
    
    static func xmg_generateRandomString() -> String {
        let knumber = 32
        let source_string = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        var resultStr = ""
        
        for _ in 1 ..< knumber{
            let index =   arc4random()%UInt32(source_string.count)
            
            let onestr = source_string[Int(index),1]
            resultStr += onestr
        }
        return resultStr
    }
    
    static func xmg_generateRandomJPEGString(header: String,type:String) -> String {
        let knumber = 32
        let source_string = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        var resultStr = ""
        
        for _ in 1 ..< knumber{
            let index =   arc4random()%UInt32(source_string.count)
            let onestr = source_string[Int(index),1]
            resultStr += onestr
        }
        
        let dateStr = Date().xmg_dateToString("yyyy-MM-dd")
        let cosPath = "\(header)/" +  dateStr + "/" +  resultStr + ".\(type)"
        return cosPath
        
    }
    
    static func xmg_generateRandomWavString(header: String,interval:String) -> String {
        let knumber = 32
        let source_string = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        var resultStr = ""
        
        for _ in 1 ..< knumber{
            let index =   arc4random()%UInt32(source_string.count)
            let onestr = source_string[Int(index),1]
            resultStr += onestr
        }
        
        let dateStr = Date().xmg_dateToString("yyyy-MM-dd")
        let cosPath = "\(header)/" +  dateStr + "/" +  resultStr + "-\(interval)" + ".wav"
        return cosPath
    }
    
    static func xmg_getSeconds(_ header: String) -> Int{
        let suffix = header.components(separatedBy: "-").last
        let seconds = suffix?.components(separatedBy: ".").first
        let intSeconds = Int(seconds ?? "0")
        return intSeconds ?? 0
    }
    static func xmg_changeSecondToString(_ seconds: Int) -> String{
        let time = seconds
        if seconds < 60{
            let second = String(format: "%.2d", time)
            return "00:00:\(second)"
        }else if time < (60 * 60){
            let minute = time / 60
            let minuteStr = String(format: "%.2d", minute)
            let second = time % 60
            let secondStr = String(format: "%.2d", second)
            return "00:\(minuteStr):\(secondStr)"
        }else {
            let hour = time / 60 / 60
            let hourStr = String(format: "%.2d", hour)
            let seconds =  time % (60 * 60)//剩余的秒数
            let minute = seconds / 60
            let minuteStr = String(format: "%.2d", minute)
            let second = seconds % 60
            let secondStr = String(format: "%.2d", second)
            return "\(hourStr):\(minuteStr):\(secondStr)"
        }
    }
    
    static func xmg_changeSecondToChineseString(_ seconds: Int) -> String{
        let time = seconds
        if seconds < 60{
            let second = String(format: "%d", seconds)
            return "\(second)秒"
        }else if time < (60 * 60){
            let minute = time / 60
            let minuteStr = String(format: "%d", minute)
            let second = time % 60
            let secondStr = String(format: "%d", second)
            return "\(minuteStr)分\(secondStr)秒"
        }else if time < (24 * 60 * 60){
            let hour = time / 60 / 60
            let hourStr = String(format: "%d", hour)
            let seconds =  time % (60 * 60)//剩余的秒数
            let minute = seconds / 60
            let minuteStr = String(format: "%d", minute)
            let second = seconds % 60
            let secondStr = String(format: "%.2d", second)
            return "\(hourStr)小时\(minuteStr)分\(secondStr)秒"
        }else {
            let day = time / 60 / 60 / 24
            let dayStr = String(format: "%d", day)
            var seconds =  time % (60 * 60 * 24)//剩余的秒数
            let hour = seconds / 60 / 60
            let hourStr = String(format: "%d", hour)
            seconds =  seconds % (60 * 60 )//剩余的秒数
            let minute = seconds / 60
            let minuteStr = String(format: "%d", minute)
            let second = seconds % 60
            let secondStr = String(format: "%d", second)
            return "\(dayStr)天\(hourStr)小时\(minuteStr)分\(secondStr)秒"
        }
    }
    
    static func xmg_getDurationString(_ header: String) -> String{
        let suffix = header.components(separatedBy: "-").last
        let seconds = suffix?.components(separatedBy: ".").first
        let intSeconds = Int(seconds ?? "0")
        if let time = intSeconds{
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
        }else{
            return "00:00"
        }
    }
    
    static func xmg_getWavTimevalString(_ header: String) -> String{
        
        let suffix = header.components(separatedBy: "-").last
        let seconds = suffix?.components(separatedBy: ".").first
        let intSeconds = Int(seconds ?? "0")
        if let time = intSeconds{
            if time < 60{
                return "\(time)秒"
            }else if time < (60 * 60){
                return "\(Int(time/60))分钟"
            }else{
                return "\(Int(time/3600))小时"
            }
        }else{
            return "0分钟"
        }
        
    }
    
    
    
    /// String使用下标截取字符串
    /// string[index] 例如："abcdefg"[3] // c
    subscript (i:Int)->String{
        let startIndex = self.index(self.startIndex, offsetBy: i)
        let endIndex = self.index(startIndex, offsetBy: 1)
        return String(self[startIndex..<endIndex])
    }
    /// String使用下标截取字符串
    /// string[index..<index] 例如："abcdefg"[3..<4] // d
    subscript (r: Range<Int>) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: r.upperBound)
            return String(self[startIndex..<endIndex])
        }
    }
    /// String使用下标截取字符串
    /// string[index,length] 例如："abcdefg"[3,2] // de
    subscript (index:Int , length:Int) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: index)
            let endIndex = self.index(startIndex, offsetBy: length)
            return String(self[startIndex..<endIndex])
        }
    }
    // 截取 从头到i位置
    func xmg_substring(to:Int) -> String{
        return self[0..<to]
    }
    // 截取 从i到尾部
    func xmg_substring(from:Int) -> String{
        return self[from..<self.count]
    }
    
    /// 改变字体部分颜色和大小
    ///
    /// - Parameters:
    ///   - rangeString: 需要改变得字符串
    ///   - color: 颜色
    ///   - font: 字体
    /// - Returns: 富文本
    func xmg_changePartOfStringStyle(_ rangeString:String, color:UIColor, font:UIFont? = UIFont.systemFont(ofSize: 14))->NSMutableAttributedString
    {
        let attriStr:NSMutableAttributedString = NSMutableAttributedString(string:self)
        let range = NSMakeRange(NSString(string: self).range(of: rangeString).location, NSString(string: self).range(of: rangeString).length)
        attriStr.addAttribute(.foregroundColor, value: color, range: (range))
        if let tempFont = font {
            attriStr.addAttribute(.font, value: tempFont, range: range)
        }
        
        return attriStr
    }
    
    func xmg_insertImageGerenateAttributeString(imageName:String,color:UIColor, font:UIFont? = UIFont.systemFont(ofSize: 14)) ->NSMutableAttributedString{
        
        
        //定义富文本即有格式的字符串
        let attributedStrM : NSMutableAttributedString = NSMutableAttributedString()
        
        let dashuaige : NSAttributedString = NSAttributedString(string: self, attributes: [NSAttributedString.Key.foregroundColor : color, NSAttributedString.Key.font : font])
        //默认图片
        let smileImage : UIImage = UIImage(named: imageName)!
        let textAttachment : NSTextAttachment = NSTextAttachment()
        textAttachment.image = smileImage
        textAttachment.bounds = CGRect(x: 0, y: 0, width: 34.5, height: 15)
        attributedStrM.append(NSAttributedString(attachment: textAttachment))
        attributedStrM.append(dashuaige)
        
        return attributedStrM
    }
    
    func xmg_changePartOfStringStyleWithLine(_ rangeString:String, color:UIColor, font:UIFont)->NSMutableAttributedString
    {
        let attriStr:NSMutableAttributedString = NSMutableAttributedString(string:self)
        let range = NSMakeRange(NSString(string: self).range(of: rangeString).location, NSString(string: self).range(of: rangeString).length)
        
        attriStr.addAttributes([.foregroundColor:color,
                                .font:font,
                                .underlineStyle: 1,
                                .underlineColor: color], range: range)
        return attriStr
    }
    
    func xmg_changePartOfStringStyleWithDeleteLine(_ rangeString:String, color:UIColor, font:UIFont)->NSMutableAttributedString
    {
        let attriStr:NSMutableAttributedString = NSMutableAttributedString(string:self)
        let range = NSMakeRange(NSString(string: self).range(of: rangeString).location, NSString(string: self).range(of: rangeString).length)
        
        attriStr.addAttributes([.foregroundColor:color,
                                .font:font,
                                .strikethroughStyle: NSUnderlineStyle.single.rawValue,
                                .underlineColor: color,
                                .baselineOffset: 0], range: range)
        return attriStr
    }
    
    
    func xmg_substring(location index:Int, length:Int) -> String {
        if self.count > index {
            let startIndex = self.index(self.startIndex, offsetBy: index)
            let endIndex = self.index(self.startIndex, offsetBy: index + length)
            let subString = self[startIndex..<endIndex]
            return String(subString)
        } else {
            return self
        }
    }
    
    func xmg_substring(range:NSRange) -> String {
        if self.count > range.location {
            let startIndex = self.index(self.startIndex, offsetBy: range.location)
            let endIndex = self.index(self.startIndex, offsetBy: range.location + range.length)
            let subString = self[startIndex..<endIndex]
            return String(subString)
        } else {
            return self
        }
    }
    
    
    func xmg_urlScheme(scheme:String) -> URL? {
        if let url = URL.init(string: self) {
            var components = URLComponents.init(url: url, resolvingAgainstBaseURL: false)
            components?.scheme = scheme
            return components?.url
        }
        return nil
    }
    
    static func xmg_readJson2DicWithFileName(fileName:String) -> [String:Any] {
        let path = Bundle.main.path(forResource: fileName, ofType: "json") ?? ""
        var dict = [String:Any]()
        do{
            let data = try Data.init(contentsOf: URL.init(fileURLWithPath: path))
            dict = try JSONSerialization.jsonObject(with: data, options:[]) as! [String : Any]
        }catch {
            print(error.localizedDescription)
        }
        return dict
    }
    
    static func xmg_format(decimal:Float, _ maximumDigits:Int = 1, _ minimumDigits:Int = 1) ->String? {
        let number = NSNumber(value: decimal)
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = maximumDigits //设置小数点后最多2位
        numberFormatter.minimumFractionDigits = minimumDigits //设置小数点后最少2位（不足补0）
        return numberFormatter.string(from: number)
    }
    
    static func xmg_formatCount(count:NSInteger) -> String {
        if count < 10000  {
            return String.init(count)
        } else {
            return (String.xmg_format(decimal: Float(count)/Float(10000)) ?? "0") + "w"
        }
    }
    
    
    
    func xmg_singleLineSizeWithText(font:UIFont) -> CGSize {
        return self.size(withAttributes: [NSAttributedString.Key.font : font])
    }
    
    func xmg_singleLineSizeWithAttributeText(font:UIFont) -> CGSize {
        let attributes = [NSAttributedString.Key.font:font]
        let attString = NSAttributedString(string: self,attributes: attributes)
        let framesetter = CTFramesetterCreateWithAttributedString(attString)
        return CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRange(location: 0,length: 0), nil, CGSize(width: Double.greatestFiniteMagnitude, height: Double.greatestFiniteMagnitude), nil)
    }
    
    
    
    /// Hex String to Data
    
    func xmg_hexadecimal() -> Data? {
           var data = Data(capacity: self.count / 2)

           let regex = try! NSRegularExpression(pattern: "[0-9a-f]{1,2}", options: .caseInsensitive)
           regex.enumerateMatches(in: self, range: NSMakeRange(0, utf16.count)) { match, flags, stop in
               let byteString = (self as NSString).substring(with: match!.range)
               var num = UInt8(byteString, radix: 16)!
               data.append(&num, count: 1)
           }

           guard data.count > 0 else { return nil }

           return data
       }
}
