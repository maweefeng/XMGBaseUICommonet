

import UIKit

public extension UITableView{
    
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
