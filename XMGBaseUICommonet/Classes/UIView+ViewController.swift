//
//  UIView+ViewController.swift
//  MainProject
//
//  Created by cnsunrun on 2018/5/10.
//  Copyright © 2018年 Knight. All rights reserved.
//

import UIKit

extension UIView {
    
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
}
