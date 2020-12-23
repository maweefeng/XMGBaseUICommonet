

import UIKit
public extension UILabel {
 
    
    /// 为UILabel显示的文本加下划线
     func xmg_underline() {
 
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length))
            attributedText = attributedString
        }
    }
 
}

