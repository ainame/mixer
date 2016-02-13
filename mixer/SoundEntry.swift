//
//  SoundEntry.swift
//  mixer
//
//  Created by Namai Satoshi on 2016/02/07.
//  Copyright © 2016年 ainame. All rights reserved.
//

import Foundation
import RealmSwift

final class SoundEntry: Object {
    dynamic var type: String = ""
    dynamic var value: String = ""
    
    func getType() -> SoundType {
        switch type {
        case SoundType.SoundEffect.rawValue:
            return SoundType.SoundEffect
        case SoundType.SpeechText.rawValue:
            return SoundType.SpeechText
        default:
            fatalError()
        }
    }
}

enum SoundType: String {
    case SoundEffect = "SoundEffect"
    case SpeechText = "SpeechText"
}

struct SoundSerialzier {
    static func serialize(sound: SoundEntry) -> PlayableSourceType {
        switch sound.getType() {
        case .SoundEffect:
            guard let soundEffect = SoundEffectGroups.filter({ $0.name == sound.value }).first else {
                fatalError()
            }
            return soundEffect
        case .SpeechText:
            return SpeechText(body: sound.value)
        }
    }
}