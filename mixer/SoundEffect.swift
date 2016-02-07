//
//  SoundEffect.swift
//  mixer
//
//  Created by Namai Satoshi on 2016/02/06.
//  Copyright © 2016年 ainame. All rights reserved.
//

import Foundation

struct SoundEffect {
    let name: String
    let filename: String

    func getPath () -> String {
        let ext = NSURL(fileURLWithPath: filename).pathExtension
        return NSBundle.mainBundle().pathForResource(name, ofType: ext, inDirectory: "SoundEffects")!
    }
    
    func getURL () -> NSURL {
        return NSURL(fileURLWithPath: getPath())
    }
}

extension SoundEffect: Hashable, Equatable {
    var hashValue: Int {
        return name.hashValue ^ filename.hashValue
    }
}

func ==(lhs: SoundEffect, rhs: SoundEffect) -> Bool {
    return lhs.name == rhs.name && lhs.filename == rhs.filename
}
