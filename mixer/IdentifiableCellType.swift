//
//  IdentifiableCellType.swift
//  mixer
//
//  Created by Namai Satoshi on 2016/02/07.
//  Copyright © 2016年 ainame. All rights reserved.
//

import Foundation

protocol IdentifiableCellType {
    static func identifier() -> String
}

extension IdentifiableCellType {
    static func identifier() -> String {
        return String(self)
    }
}