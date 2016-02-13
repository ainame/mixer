//
//  Player.swift
//  mixer
//
//  Created by Namai Satoshi on 2016/02/13.
//  Copyright © 2016年 ainame. All rights reserved.
//

import Foundation
import AVFoundation

protocol PlayableSourceType {
    func getDuration() -> Double
}

protocol PlayerType {
    typealias Source: PlayableSourceType
    func play(source: Source)
}

final class PlayerDispatcher {
    func dispatch (source: PlayableSourceType) {
        switch source {
        case let soundEffect as SoundEffect:
            SoundEffectPlayer.sharedInstance.play(soundEffect)
        case let speechText as SpeechText:
            SpeechTextPlayer.sharedInstance.play(speechText)
        default:
            break
        }
    }
}

final class SoundEffectPlayer : PlayerType {
    typealias Source = SoundEffect
    
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

final class SpeechTextPlayer: PlayerType {
    typealias Source = SpeechText
    static let sharedInstance = SpeechTextPlayer()
    
    func play(speechText: SpeechText) {
        let synthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: speechText.body)
        utterance.voice = AVSpeechSynthesisVoice(language: "ja")
        synthesizer.speakUtterance(utterance)
    }
}



