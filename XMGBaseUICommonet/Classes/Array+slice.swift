

import Foundation
public extension Sequence {
    
    /// 将一个数组当中的元素进行等间距分隔成很多数组
    /// - Parameter clumpsize: 每个数组分开的元素个数
    /// - Returns: 分隔之后的[数组]
    func xmg_clump(by clumpsize:Int) -> [[Element]] {
        let slices : [[Element]] = self.reduce(into:[]) {
            memo, cur in
            if memo.count == 0 {
                return memo.append([cur])
            }
            if memo.last!.count < clumpsize {
                memo.append(memo.removeLast() + [cur])
            } else {
                memo.append([cur])
            }
        }
        return slices
    }
}
