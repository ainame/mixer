//
//  Sequence.swift
//  mixer
//
//  Created by Namai Satoshi on 2016/02/07.
//  Copyright © 2016年 ainame. All rights reserved.
//

import Foundation
import RealmSwift

class Sequence: Object {
    dynamic var id: String = ""
    dynamic var title: String = ""
    dynamic var createdAt: NSDate = NSDate(timeIntervalSince1970: 1)

    override static func indexedProperties() -> [String] {
        return ["id", "createdAt"]
    }
}