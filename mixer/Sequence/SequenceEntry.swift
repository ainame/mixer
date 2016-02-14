//
//  Sequence.swift
//  mixer
//
//  Created by Namai Satoshi on 2016/02/07.
//  Copyright © 2016年 ainame. All rights reserved.
//

import Foundation
import RealmSwift

final class SequenceEntry: Object {
    dynamic var id: String = NSUUID().UUIDString
    dynamic var title: String = ""
    dynamic var createdAt: NSDate = NSDate(timeIntervalSince1970: 1)
    let sounds = List<SoundEntry>()

    override static func indexedProperties() -> [String] {
        return ["id", "createdAt"]
    }
}