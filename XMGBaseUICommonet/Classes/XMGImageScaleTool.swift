

import UIKit
import ImageIO

open class XMGImageScaleTool: NSObject {
    
    // 技巧 #3
   class func resizedImage(at url: URL, for size: CGSize) -> UIImage? {
        let options: [CFString: Any] = [
            kCGImageSourceCreateThumbnailFromImageIfAbsent: true,
            kCGImageSourceCreateThumbnailWithTransform: true,
            kCGImageSourceShouldCacheImmediately: true,
            kCGImageSourceThumbnailMaxPixelSize: max(size.width, size.height)
        ]

        guard let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            let image = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, options as CFDictionary)
        else {
            return nil
        }

        return UIImage(cgImage: image)
    }
    
    
    /// 对特定的 UIImage 在特定 size 上缩放
    /// - Parameters:
    ///   - image: 被缩放的原始图片URL地址
    ///   - size: 缩放之后的尺寸
    /// - Returns: 缩放之后的图片
    class func xmg_resizedImage(at url: URL, for size: CGSize) -> UIImage? {
        guard let image = UIImage(contentsOfFile: url.path) else {
            return nil
        }
        
        if #available(iOS 10.0, *) {
            let renderer = UIGraphicsImageRenderer(size: size)
            return renderer.image { (context) in
                image.draw(in: CGRect(origin: .zero, size: size))
            }
        } else {
            return image
        }
        
    }
    
    
    
    /// 对特定的 UIImage 在特定 size 上缩放
    /// - Parameters:
    ///   - image: 被缩放的原始图片
    ///   - size: 缩放之后的尺寸
    /// - Returns: 缩放之后的图片
    class func xmg_resizedImage(at image: UIImage, for size: CGSize) -> UIImage? {
        if #available(iOS 10.0, *) {
            let renderer = UIGraphicsImageRenderer(size: size)
            return renderer.image { (context) in
                image.draw(in: CGRect(origin: .zero, size: size))
            }
        }else{
            return image
        }
    }
    
}
