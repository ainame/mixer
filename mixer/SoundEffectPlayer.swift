//
//  SoundEffectPlayer.swift
//  mixer
//
//  Created by Namai Satoshi on 2016/02/06.
//  Copyright © 2016年 ainame. All rights reserved.
//

import Foundation
import AVFoundation

protocol SoundEffectPlayerType {
    func play(soundEffect: SoundEffect)
}

class SoundEffectPlayer : SoundEffectPlayerType {
    static let sharedInstance = SoundEffectPlayer()
    let player = AVQueuePlayer()

    func play(soundEffect: SoundEffect) {
        let asset = AVURLAsset(URL: soundEffect.getURL())
        let item = AVPlayerItem(asset: asset)
        player.insertItem(item, afterItem: player.items().last)
        player.play()
    }
    
    func cancel() {
        player.pause()
        player.removeAllItems()
    }
}