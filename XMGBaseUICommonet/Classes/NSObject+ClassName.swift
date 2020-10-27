//
//  NSObjectExtension.swift
//  TableViewText
//
//  Created by thinkjoy on 2017/7/11.
//  Copyright © 2017年 杜瑞胜. All rights reserved.
//
import UIKit

public func XMGGetClassFromString(_ stringName: String) -> AnyClass? {
    //根据字符串获取对应的class，在Swift中不能直接使用
    //Swift中命名空间的概念
    guard let nameSpage = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
        print("没有命名空间")
        return nil
    }
    guard let childVcClass = NSClassFromString(nameSpage + "." + stringName) else {
        print("没有获取到对应的class")
        return nil
    }
    return childVcClass
}

extension NSObject {
    var xmg_className: String {
        return String(describing: type(of: self)).components(separatedBy: ".").last!
    }
    
    class var xmg_className: String {
        return String(describing: self).components(separatedBy: ".").last!
    }
}
