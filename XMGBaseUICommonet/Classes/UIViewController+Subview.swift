//
//  UIViewController.swift
//  MVVMSwiftExample
//
//  Created by Dino Bartosak on 26/09/16.
//  Copyright © 2016 Toptal. All rights reserved.
//

import UIKit
import MMPopupView

extension UIViewController {
    

    
    func xmg_turnToViewController(_ targetVC : UIViewController?){
        if let tempVC = targetVC {
            tempVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(tempVC, animated: true)
        }
    }

    @objc func xmg_back () {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    /// 返回到指定的vc
    ///
    /// - Parameter targetVC: 元类型
    func xmg_backToTargetViewController (_ targetVC:AnyClass) {
        for VC in (self.navigationController?.viewControllers)! {
            if VC.isKind(of: targetVC)  {
                self.navigationController?.popToViewController(VC, animated: true)
                break
            }
        }
    }
    
    func xmg_backToFrontTargetViewController (_ index:Int) {
        if let allNum = self.navigationController?.viewControllers.count{
            var Newindex:Int = allNum - index - 1
            if Newindex < 0{
                Newindex = 0//防止越界
            }
            for (i,vc) in (self.navigationController?.viewControllers)!.enumerated() {
                
                if i == Newindex {
                    self.navigationController?.popToViewController(vc, animated: true)
                }
            }
        }
    }
    
    
    ///点击评论 自己或者对方
    func xmg_showSubSheetView(_ isMe:Bool,confirm:@escaping (_ index:Int)->()){
        let block:(Int)->Void = {(index) in
            
            confirm(index)
            
        }
        if isMe{
            let items = [MMItemMake("删除", .normal, block)!] as [Any]
            let sheetView = MMSheetView.init(title: "", items: items)
            sheetView?.show()
        }else{
            let items = [MMItemMake("投诉", .normal, block)!] as [Any]
            let sheetView = MMSheetView.init(title: "", items: items)
            sheetView?.show()
        }
        
        
    }
    
    
    
    ///点击评论 自己或者对方
    func xmg_showSheetView(_ isMe:Bool,confirm:@escaping (_ index:Int)->()){
        let block:(Int)->Void = {(index) in
            
            confirm(index)
            
        }
        if isMe{
            let items = [MMItemMake("回复", .normal, block),MMItemMake("删除", .normal, block)]
            let sheetView = MMSheetView.init(title: "", items: items as [Any])
            sheetView?.show()
        }else{
            let items = [MMItemMake("回复", .normal, block),MMItemMake("投诉", .normal, block)]
            let sheetView = MMSheetView.init(title: "", items: items as [Any])
            sheetView?.show()
        }
        
        
    }
    
    
    func xmg_showTipAlertView(_ tipString:String, confirm:@escaping ()->()){
        let block:(Int)->Void = {(index) in
            if index == 1 {
                confirm()
            }
        }
        
        
        let items = [MMItemMake("取消", .normal, block)!,
                     MMItemMake("确认", .highlight, block)!] as [Any]
        
        let alertView = MMAlertView.init(title: tipString, detail: nil, items: items)
        alertView?.show()
    }
    
    func xmg_showProblemAlertView(_ tipString:String, confirm:@escaping ()->()){
        let block:(Int)->Void = {(index) in
            if index == 1 {
                confirm()
            }
        }
        let items = [MMItemMake("在想想", .normal, block)!,
                     MMItemMake("是", .normal, block)!] as [Any]
        
        let alertView = MMAlertView.init(title: tipString, detail: nil, items: items)
        alertView?.show()
    }
    

}

