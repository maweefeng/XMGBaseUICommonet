//
//  MyLog.swift
//  Sport
//
//  Created by iband on 2020/4/11.
//  Copyright © 2020 iband. All rights reserved.
//

import UIKit

/*
 *自定义全局日志方法
 */
public func XMGLog<T>(_ message:T, file:String = #file, funcName:String = #function, lineNum:Int = #line) -> Void {
    #if DEBUG
    let fileName = (file as NSString).lastPathComponent
    print("日志: \(fileName) 第\(lineNum)行 内容:\(message)")
    #endif
}
