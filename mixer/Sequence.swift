//
//  Sequence.swift
//  mixer
//
//  Created by Namai Satoshi on 2016/02/07.
//  Copyright © 2016年 ainame. All rights reserved.
//

import Foundation
import RealmSwift

let kPlayingQueue = dispatch_queue_create("playingqueue", DISPATCH_QUEUE_SERIAL)
class Sequence: Object {
    dynamic var id: String = NSUUID().UUIDString
    dynamic var title: String = "仮タイトル"
    dynamic var createdAt: NSDate = NSDate(timeIntervalSince1970: 1)
    let sounds = List<Sound>()

    override static func indexedProperties() -> [String] {
        return ["id", "createdAt"]
    }
    
    func play() {
        let selfId = id
        SoundEffectPlayer.sharedInstance.cancel()
        dispatch_async(kPlayingQueue) {
            let sounds = SequenceStore().findById(selfId).sounds
            for sound in sounds {
                let interval = sound.play()
                sleep(interval)
            }
        }
    }
}