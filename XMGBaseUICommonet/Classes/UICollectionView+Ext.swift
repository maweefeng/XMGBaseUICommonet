

import UIKit
public extension UICollectionView{
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
