//
//  UINib+Loader.swift
//  MVVMSwiftExample
//
//  Created by Dino Bartosak on 26/09/16.
//  Copyright © 2016 Toptal. All rights reserved.
//

import UIKit

fileprivate extension UINib {
    
    static func xmg_nib(named nibName: String) -> UINib {
        return UINib(nibName: nibName, bundle: nil)
    }
    
    static func xmg_loadSingleView(_ nibName: String, owner: Any?) -> UIView {
        return xmg_nib(named: nibName).instantiate(withOwner: owner, options: nil)[0] as! UIView
    }
}

// MARK: App Views

extension UINib {
    class func xmg_loadPlayerScoreboardMoveEditorView(_ owner: AnyObject) -> UIView {
        return xmg_loadSingleView("PlayerScoreboardMoveEditorView", owner: owner)
    }
}
