

import UIKit
import SnapKit
public extension UIView{
    
    
    /// 获取view属于哪个VC
    ///
    /// - Returns: VC
    func xmg_currentViewController () -> (UIViewController){
        
        //1.通过响应者链关系，取得此视图的下一个响应者
        var next:UIResponder?
        next = self.next!
        repeat {
            //2.判断响应者对象是否是视图控制器类型
            if ((next as?UIViewController) != nil) {
                return (next as! UIViewController)
            }else {
                next = next?.next
            }
        } while next != nil
        return UIViewController()
    }
    
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
    
    func removeGradientLayer(className:String){
        self.layer.sublayers?.removeAll(where: {$0.xmg_className == "CAGradientLayer"})
    }
    func xmg_addGradientLayer(colors:[CGColor]){
        removeGradientLayer(className: "CAGradientLayer")
        
        let gradient = CAGradientLayer()
        gradient.colors = colors
        gradient.locations = [0, 1]
        gradient.frame = self.bounds
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        self.layer.insertSublayer(gradient, at: 0)
        
    }
    func xmg_addGradientLayer(colors:[CGColor],startPoint:CGPoint = CGPoint(x: 0, y: 0.5),endPoint:CGPoint = CGPoint(x: 1, y: 0.5)){
        removeGradientLayer(className: "CAGradientLayer")
        
        let gradient = CAGradientLayer()
        gradient.colors = colors
        gradient.locations = [0, 1]
        gradient.frame = self.bounds
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        self.layer.insertSublayer(gradient, at: 0)
        
    }
    func xmg_addShadowLayer(shadowColor:UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.08),radius:CGFloat = 5){
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = radius
    }
    
    func xmg_drawDottedLine(color:UIColor)->CAShapeLayer{
        removeGradientLayer(className: "CAShapeLayer")

        let shapeLayer:CAShapeLayer = CAShapeLayer()
        shapeLayer.bounds = self.bounds
        
        shapeLayer.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPhase = 0
        shapeLayer.lineDashPattern = [NSNumber(value: 3), NSNumber(value: 3)]
        
        let path:CGMutablePath = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: self.bounds.height/2))
        path.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height/2))
        shapeLayer.path = path
        self.layer.insertSublayer(shapeLayer, at: 0)
        return shapeLayer
    }
    
    
    
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



