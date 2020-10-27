//
//  UITableView+EXT.swift
//  MainProject
//
//  Created by 尚软科技 on 2019/12/23.
//  Copyright © 2019 cnsunrun. All rights reserved.
//

import UIKit

extension UITableView{
    
    ///无闪烁刷新单个Item
    func xmg_reloadSingleItem(indexPath:IndexPath){
        
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0) {
                self.beginUpdates()
                self.reloadRows(at: [indexPath], with: .none)
                self.endUpdates()
            }
        }
        
        
    }
    
    
    
}
