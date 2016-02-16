//
//  Player.swift
//  mixer
//
//  Created by Namai Satoshi on 2016/02/13.
//  Copyright © 2016年 ainame. All rights reserved.
//

import Foundation
import AVFoundation
import RxSwift

protocol PlayableSourceType {}

protocol PlayerType {
    typealias Source: PlayableSourceType
    var sequencer: PublishSubject<Void>? { get set }
    func play(sequencer: PublishSubject<Void>, source: Source)
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

    func dispatch (sequencer: PublishSubject<Void>, source: PlayableSourceType) {
        switch source {
        case let soundEffect as SoundEffect:
            SoundEffectPlayer.sharedInstance.play(sequencer, source: soundEffect)
        case let speechText as SpeechText:
            SpeechTextPlayer.sharedInstance.play(sequencer, source: speechText)
        default:
            break
        }
    }
}

final class SequencePlayerService {
    var dispatcher = PlayerDispatcher()
    var bag = DisposeBag()
    
    func play(sequence: SequenceEntry) {
        let selfId = sequence.id
        SoundEffectPlayer.sharedInstance.cancel()
        
        let sequencer = PublishSubject<Void>()
        guard let sounds = SequenceStore().findById(selfId)?.sounds else { return }
        Observable<SoundEntry>.zip(sequencer, sounds.toObservable()) { _, sound in sound }
            .subscribeNext { [weak self] sound in
                self?.playSound(sequencer, sound: sound)
            }.addDisposableTo(bag)
        sequencer.onNext()
    }
    
    private func playSound(sequencer: PublishSubject<Void>, sound: SoundEntry) {
        let source = SoundSerialzier.serialize(sound)
        dispatcher.dispatch(sequencer, source: source)
    }
}

final class SoundEffectPlayer : PlayerType {
    typealias Source = SoundEffect
    
    static let sharedInstance = SoundEffectPlayer()
    let player = AVQueuePlayer()
    var sequencer: PublishSubject<Void>?
    
    func play(sequencer: PublishSubject<Void>, source: SoundEffect) {
        let asset = AVURLAsset(URL: source.getURL())
        let item = AVPlayerItem(asset: asset)
        self.sequencer = sequencer
        NSNotificationCenter.defaultCenter()
            .addObserver(self, selector: "didPlaySoundEffect:", name: AVPlayerItemDidPlayToEndTimeNotification, object: item)
        player.insertItem(item, afterItem: player.items().last)
        player.play()
    }
    
    func play(source: SoundEffect) {
        let asset = AVURLAsset(URL: source.getURL())
        let item = AVPlayerItem(asset: asset)
        player.insertItem(item, afterItem: player.items().last)
        player.play()
    }
    
    func cancel() {
        player.pause()
        player.removeAllItems()
    }
    
    @objc
    func didPlaySoundEffect(notification: NSNotification?) {
        NSNotificationCenter.defaultCenter().removeObserver(self)
        sequencer?.onNext()
        self.sequencer = nil
    }
}

final class SpeechTextPlayer: NSObject, PlayerType, AVSpeechSynthesizerDelegate {
    typealias Source = SpeechText
    static let sharedInstance = SpeechTextPlayer()
    var sequencer: PublishSubject<Void>?
    
    func play(sequencer: PublishSubject<Void>, source: SpeechText) {
        let synthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: source.body)
        utterance.voice = AVSpeechSynthesisVoice(language: "ja")
        self.sequencer = sequencer
        synthesizer.delegate = self
        synthesizer.speakUtterance(utterance)
    }
    
    func play(source: SpeechText) {
        let synthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: source.body)
        utterance.voice = AVSpeechSynthesisVoice(language: "ja")
        synthesizer.delegate = self
        synthesizer.speakUtterance(utterance)
    }
    
    func speechSynthesizer(synthesizer: AVSpeechSynthesizer, didFinishSpeechUtterance utterance: AVSpeechUtterance) {
        sequencer?.onNext()
    }
}




