//
//  UIViewController+DdkTool.swift
//  MainProject
//
//  Created by 尚软科技 on 2019/7/30.
//  Copyright © 2019 顿德奎. All rights reserved.
//

import UIKit

extension UIViewController{
    //弹框:UIAlertController 提示信息
    func xmg_showAlert(_ title:String,_ tip:String?="",_ sure:(()->())?){
        let alertController = UIAlertController(title: title,
                                                message: tip, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "确定", style: .default, handler: {
            action in
            sure?()
        })
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

       
    
    
}
