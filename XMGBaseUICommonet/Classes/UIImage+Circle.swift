

import UIKit
public extension UIImage{
    
    func circleImage(callBack: @escaping (_ image: UIImage) ->())  {
        DispatchQueue.global().async {
            let rect = CGRect(x: 0, y: 0, width: 414, height: 300)
            UIGraphicsBeginImageContext(CGSize(width: 414, height: 300))
            let path = UIBezierPath(roundedRect: rect, cornerRadius: 10)
            path.addClip()
            path.lineWidth = 2.0
            UIColor.red.setStroke()
            UIColor.red.setFill()
            path.stroke()
            path.fill()
            self.draw(in: rect)
            
            let image = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
            UIGraphicsEndImageContext()
            
            
            DispatchQueue.main.async {
                
                callBack(image)
            }
        }
    }
}
