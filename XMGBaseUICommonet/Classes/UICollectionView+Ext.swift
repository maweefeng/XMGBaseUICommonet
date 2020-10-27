//
//  UICollectionView+Ext.swift
//  MainProject
//
//  Created by 尚软科技 on 2019/12/18.
//  Copyright © 2019 cnsunrun. All rights reserved.
//

import UIKit


extension UICollectionView{
    ///无闪烁刷新单个Item
    func xmg_reloadSingleSection(index:Int){
        
        UIView.animate(withDuration: 0) {
            self.performBatchUpdates({
                self.reloadSections(IndexSet(integer: index))
            }, completion: nil)
        }
    }
    
    ///无闪烁刷新单个Item
    func xmg_reloadSingleItem(indexPath:IndexPath){
        
        UIView.animate(withDuration: 0) {
            self.performBatchUpdates({
                self.reloadItems(at: [indexPath])
            }, completion: nil)
        }
    }
}
