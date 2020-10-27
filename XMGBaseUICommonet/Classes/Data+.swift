//
//  Data+.swift
//  BaseUICommponet
//
//  Created by 尚软科技 on 2020/8/27.
//  Copyright © 2020 小马科技. All rights reserved.
//

import Foundation
extension Data {

    /// Create hexadecimal string representation of `Data` object.
    ///
    /// - returns: `String` representation of this `Data` object.
    ///Data to Hex String
    func xmg_hexadecimal() -> String {
        return map { String(format: "%02x", $0) }
            .joined(separator: "")
    }
}
