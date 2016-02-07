//
//  SpeechText.swift
//  mixer
//
//  Created by Namai Satoshi on 2016/02/08.
//  Copyright © 2016年 ainame. All rights reserved.
//

import Foundation
import AVFoundation

struct SpeechText {
    var body: String
    
    func play() {
        let synthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: body)
        utterance.voice = AVSpeechSynthesisVoice(language: "ja")
        synthesizer.speakUtterance(utterance)
        AVAudioSequencer
    }
}