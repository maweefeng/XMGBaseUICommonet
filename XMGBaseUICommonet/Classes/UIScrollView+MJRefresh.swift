//
//  UIScrollView+ReFresh.swift
//  SwiftLearn
//
//  Created by panhongliu on 2017/7/6.
//  Copyright © 2017年 wangsen. All rights reserved.
//

import UIKit
import MJRefresh


extension UIScrollView
{
    func xmg_headerRefresh(block: @escaping () -> ()) -> (){
        self.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            block()
        })
    }
    
    func xmg_footerRefresh(block: @escaping () -> ()) -> (){
        self.mj_footer = MJRefreshBackNormalFooter(refreshingBlock: {
            block()
        })
    }
    
    func xmg_endRefresh(){
        if self.mj_header != nil {
            self.mj_header?.endRefreshing()
        }
        if self.mj_footer != nil {
            self.mj_footer?.endRefreshing()
        }
    }
    

}

