//
//  UIImageView+URL.swift
//  MainProject
//
//  Created by 尚软科技 on 2018/10/16.
//  Copyright © 2018 cnsunrun. All rights reserved.
//

import Foundation
import SDWebImage
import FaceAware
import AVFoundation

extension UIImageView {
    func xmg_setImageUrl(_ url:String?, placeholderImage:UIImage? = UIImage(named: "tupian")){
        guard let urlString = url else {
            self.image = placeholderImage
            return
        }
        if urlString.components(separatedBy: ".").last == "mp4"{
            SDWebImageManager.shared.imageCache.containsImage(forKey: url, cacheType: .all) { (cacheType) in
                if cacheType == .none{
                    //没有缓存
                    self.xmg_setVideoUrl(url!)

                }else{
                    self.sd_setImage(with: URL(string: urlString), placeholderImage: placeholderImage)

                }
                
            }
        }else{
            self.sd_setImage(with: URL(string: urlString), placeholderImage: placeholderImage)
            
        }
    }
    
    
    func xmg_setVideoUrl(_ url:String,placeholderImage:UIImage? = UIImage(named: "tupian")){
        
        DispatchQueue.global().async {
            let asset = AVURLAsset.init(url: URL.init(string: url)!, options: nil)
            let gen = AVAssetImageGenerator.init(asset: asset)
            gen.appliesPreferredTrackTransform = true
            let time = CMTimeMakeWithSeconds(0.0, preferredTimescale: 1)
            var actualTime : CMTime = CMTimeMakeWithSeconds(0, preferredTimescale: 0)
            do {
                let image = try gen.copyCGImage(at: time, actualTime: &actualTime)
                DispatchQueue.main.async {
                    self.image = UIImage.init(cgImage: image)
                }
                
                SDWebImageManager.shared.imageCache.store(UIImage.init(cgImage: image), imageData: UIImage.init(cgImage: image).pngData(), forKey: url, cacheType: .all) {
                    print("save image to disk")
                }
            } catch  {
                DispatchQueue.main.async {
                    self.image = placeholderImage
                }
                
            }
            
        }
        
        
        
        
    }
    
    
    //专为人脸打造
    func xmg_setImageURLWithFaceFocus(_ url:String?) {
        guard let urlString = url else {
            self.image = UIImage(named: "tupian")
            self.focusOnFaces = true
            return
        }
        
        self.sd_setImage(with: URL(string: urlString), placeholderImage: UIImage(named: "tupian")) {[weak self] (image, error, type, url) in
            self?.focusOnFaces = true
        }
    }
    
    
    
    //url中含中文
    func xmg_sd_setImageWithChinese(urlStr:String,placeImg:UIImage?=UIImage(named: "tupian")){
        let encodeStr =  urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        if let tUrl = URL(string: encodeStr ?? ""){
            if let tPlaceImg = placeImg{
                if encodeStr!.components(separatedBy: ".").last == "mp4"{
                    SDWebImageManager.shared.imageCache.containsImage(forKey: encodeStr, cacheType: .all) { (cacheType) in
                        if cacheType == .none{
                            //没有缓存
                            self.xmg_setVideoUrl(encodeStr!)
                            
                        }else{
                            self.sd_setImage(with: tUrl, placeholderImage: tPlaceImg)
                            
                        }
                        
                    }
                    
                }else{
                    self.sd_setImage(with: tUrl, placeholderImage:tPlaceImg)
                    
                }
            }else{
                if encodeStr!.components(separatedBy: ".").last == "mp4"{
                    self.xmg_setVideoUrl(encodeStr!)
                }else{
                    self.sd_setImage(with: tUrl)
                    
                }
            }
        }
        
    }
}
