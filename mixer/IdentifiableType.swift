//
//  IdentifiableType.swift
//  mixer
//
//  Created by Namai Satoshi on 2016/02/07.
//  Copyright © 2016年 ainame. All rights reserved.
//

import Foundation

protocol IdentifiableType {
    static func identifier() -> String
}

extension IdentifiableType {
    static func identifier() -> String {
        return String(self)
    }
}