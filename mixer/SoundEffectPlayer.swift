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
    var player: AVPlayer?
    
    func play(soundEffect: SoundEffect) {
        let asset = AVURLAsset(URL: soundEffect.getURL())
        let item = AVPlayerItem(asset: asset)
        self.player = AVPlayer(playerItem: item)
        
        guard let player = self.player else { return }
        player.play()
    }
}