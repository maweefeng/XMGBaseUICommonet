//
//  UIButton+URL.swift
//  MainProject
//
//  Created by 尚软科技 on 2018/10/16.
//  Copyright © 2018 cnsunrun. All rights reserved.
//

import UIKit
enum XButtonEdgeInsetsStyle {
    case ImageTop //图片在上，文字在下
    case ImageLeft //图片在上，文字在下
    case ImageBottom //图片在上，文字在下
    case ImageRight //图片在上，文字在下
}
extension UIButton {
    
    
    // 改进写法【推荐】
    private struct xmg_RuntimeKey {
        static let clickEdgeInsets = UnsafeRawPointer.init(bitPattern: "clickEdgeInsets".hashValue)
        /// ...其他Key声明
    }
    /// 需要扩充的点击边距
    public var xmg_hw_clickEdgeInsets: UIEdgeInsets? {
        set {
            objc_setAssociatedObject(self, UIButton.xmg_RuntimeKey.clickEdgeInsets!, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY)
        }
        get {
            return objc_getAssociatedObject(self, UIButton.xmg_RuntimeKey.clickEdgeInsets!) as? UIEdgeInsets ?? UIEdgeInsets.zero
        }
    }
    // 重写系统方法修改点击区域
//    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
//        super.point(inside: point, with: event)
//        var bounds = self.bounds
//        if (hw_clickEdgeInsets != nil) {
//            let x: CGFloat = -(hw_clickEdgeInsets?.left ?? 0)
//            let y: CGFloat = -(hw_clickEdgeInsets?.top ?? 0)
//            let width: CGFloat = bounds.width + (hw_clickEdgeInsets?.left ?? 0) + (hw_clickEdgeInsets?.right ?? 0)
//            let height: CGFloat = bounds.height + (hw_clickEdgeInsets?.top ?? 0) + (hw_clickEdgeInsets?.bottom ?? 0)
//            bounds = CGRect(x: x, y: y, width: width, height: height) //负值是方法响应范围
//        }
//        return bounds.contains(point)
//    }
    
    func xmg_changeState(controlState:UIControl.State = .normal){
        if controlState == .disabled {
            self.isUserInteractionEnabled = false
            self.titleLabel?.alpha = 0.4
        }else{
            self.isUserInteractionEnabled = true
            self.titleLabel?.alpha = 1
        }
        
    }
    func xmg_setImageUrl(_ url:String?, controlState:UIControl.State = .normal, placeholderImage:UIImage? = UIImage(named: "tupian")){
        guard let urlString = url else {
            self.setImage(placeholderImage, for: controlState)
            return
        }
        
        self.sd_setImage(with: URL(string: urlString), for: controlState, placeholderImage: placeholderImage)
    }
    
    
    /**
     ># Important:按钮图文位置设置
     知识点：titleEdgeInsets是title相对于其上下左右的inset，跟tableView的contentInset是类似的，
     *  如果只有title，那它上下左右都是相对于button的，image也是一样；
     *  如果同时有image和label，那这时候image的上左下是相对于button，右边是相对于label的；title的上右下是相对于button，左边是相对于image的。
     */
    func xmg_layoutButtonWithEdgInsetStyle(_ style: XButtonEdgeInsetsStyle,_ space:CGFloat){
        //获取image宽高
        let imageW = self.imageView?.frame.size.width
        let imageH = self.imageView?.frame.size.height
        //获取label宽高
        var lableW = self.titleLabel?.intrinsicContentSize.width
        let lableH = self.titleLabel?.intrinsicContentSize.height
        
        var imageEdgeInsets:UIEdgeInsets = .zero
        var lableEdgeInsets:UIEdgeInsets = .zero
        if self.frame.size.width <= lableW! { //如果按钮文字超出按钮大小，文字宽为按钮大小
            lableW = self.frame.size.width
        }
        //根据传入的 style 及 space 确定 imageEdgeInsets和labelEdgeInsets的值
        switch style {
        case .ImageTop:
            imageEdgeInsets = UIEdgeInsets(top: 0.0 - lableH! - space/2.0, left: 0, bottom: 0, right: 0.0 - lableW!)
            lableEdgeInsets = UIEdgeInsets(top: 0, left: 0.0 - imageW!, bottom: 0.0 - imageH! - space/2.0, right: 0)
        case .ImageLeft:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0.0 - space/2.0, bottom: 0, right: space/2.0)
            lableEdgeInsets = UIEdgeInsets(top: 0, left: space/2.0, bottom: 0, right: 0.0 - space/2.0)
        case .ImageBottom:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0.0 - lableH! - space/2.0, right: 0.0 - lableW!)
            lableEdgeInsets = UIEdgeInsets(top: 0.0 - imageH! - space/2.0, left: 0.0 - imageW!, bottom: 0, right: 0)
        case .ImageRight:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: lableW! + space/2.0, bottom: 0, right: 0.0 - lableW! - space/2.0)
            lableEdgeInsets = UIEdgeInsets(top: 0, left: 0.0 - imageW! - space/2.0, bottom: 0, right: imageW! + space/2.0)
        }
        //赋值
        self.titleEdgeInsets = lableEdgeInsets
        self.imageEdgeInsets = imageEdgeInsets
        self.layoutIfNeeded()
        
    }
    
    func xmg_setDoubleLineButton(text:String,placeHolder:String){
        let secondstr = "\(text)\n\(placeHolder)"
        //        let paragraphStyle = NSMutableParagraphStyle()
        //        paragraphStyle.lineSpacing = 5; // 字体的行间距
        let secondattrstr = secondstr.xmg_changePartOfStringStyle(placeHolder, color: XMGColorWithHex(0x666666),font: .systemFont(ofSize: 10))
        //        secondattrstr.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: secondstr.count))
        self.setAttributedTitle(secondattrstr, for: .normal)
        self.titleLabel?.textAlignment = .center
        self.titleLabel!.numberOfLines = 3
        
    }
    
    func xmg_setWhiteDoubleLineButton(text:String,placeHolder:String){
        let secondstr = "\(text)\n\(placeHolder)"
        let secondattrstr = secondstr.xmg_changePartOfStringStyle(placeHolder, color: XMGColorWithHex(0xffffff),font: .systemFont(ofSize: 10))
        self.setAttributedTitle(secondattrstr, for: .normal)
        self.titleLabel?.textAlignment = .center
        self.titleLabel!.numberOfLines = 3
        
    }
    
    func xmg_newsetWhiteDoubleLineButton(text:String,placeHolder:String){
        let secondstr = "\(text)\n\(placeHolder)"
        let secondattrstr = secondstr.xmg_changePartOfStringStyle(placeHolder, color: XMGColorWithHex(0x999999),font: .systemFont(ofSize: 12, weight: .medium))
        self.setAttributedTitle(secondattrstr, for: .normal)
        self.titleLabel?.textAlignment = .center
        self.titleLabel!.numberOfLines = 3
        
    }
}
