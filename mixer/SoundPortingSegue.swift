//
//  SoundPortingSegue.swift
//  mixer
//
//  Created by Namai Satoshi on 2016/02/07.
//  Copyright © 2016年 ainame. All rights reserved.
//

import UIKit

class SoundPortingSegue: UIStoryboardSegue, IdentifiableType {
    var type: SoundType?
    var value: String?
    
    func setParameters(type: SoundType, value: String) {
        self.type = type
        self.value = value
    }
    
    func createSound() -> SoundEntry? {
        guard let aType = type else { return nil }
        guard let aValue = value else { return nil }
        let sound =  SoundEntry()
        sound.type = aType.rawValue
        sound.value = aValue
        return sound
    }
}