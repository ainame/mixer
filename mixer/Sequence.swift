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
    dynamic var id: String = NSUUID().UUIDString
    dynamic var title: String = "仮タイトル"
    dynamic var createdAt: NSDate = NSDate(timeIntervalSince1970: 1)
    let sounds = List<Sound>()

    override static func indexedProperties() -> [String] {
        return ["id", "createdAt"]
    }
    
    func play() {
        SoundEffectPlayer.sharedInstance.cancel()
        for sound in sounds {
            sound.play()
        }
    }
}