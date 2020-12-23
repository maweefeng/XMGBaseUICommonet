
import UIKit
public class ColorTool{
     class func pureColorImageWithSize(size:CGSize,color:UIColor,cornerRadius:CGFloat)->UIImage{
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        view.backgroundColor = color
        view.layer.cornerRadius = cornerRadius;
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        return image!
        
    }

}
