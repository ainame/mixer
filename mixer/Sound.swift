//
//  Sound.swift
//  mixer
//
//  Created by Namai Satoshi on 2016/02/07.
//  Copyright © 2016年 ainame. All rights reserved.
//

import Foundation
import RealmSwift

class Sound: Object {
    dynamic var type: String = ""
    dynamic var value: String = ""

    func play() -> UInt32 {
        switch type {
        case SoundType.SoundEffect.rawValue:
            if let soundEffect = SoundEffectGroups.filter({ $0.name == value }).first {
                print(soundEffect)
                SoundEffectPlayer.sharedInstance.play(soundEffect)
            }
            return 2
        case SoundType.SpeechText.rawValue:
            let speechText = SpeechText(body: value)
            speechText.play()
            return 2
        default: break
        }
        return 0
    }
}

enum SoundType: String {
    case SoundEffect = "SoundEffect"
    case SpeechText = "SpeechText"
}
