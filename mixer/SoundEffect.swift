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

let SoundEffectGroups: [SoundEffect] = [
    SoundEffect(name: "alien1", filename: "alien1.mp3"),
    SoundEffect(name: "ban1", filename: "ban1.mp3"),
    SoundEffect(name: "bite1", filename: "bite1.mp3"),
    SoundEffect(name: "blink1", filename: "blink1.mp3"),
    SoundEffect(name: "boyon1", filename: "boyon1.mp3"),
    SoundEffect(name: "boyoyon1", filename: "boyoyon1.mp3"),
    SoundEffect(name: "brake1", filename: "brake1.mp3"),
    SoundEffect(name: "broadcasting-end1", filename: "broadcasting-end1.mp3"),
    SoundEffect(name: "broadcasting-start1", filename: "broadcasting-start1.mp3"),
    SoundEffect(name: "buzzer-opening1", filename: "buzzer-opening1.mp3"),
    SoundEffect(name: "clock-tower-bell1", filename: "clock-tower-bell1.mp3"),
    SoundEffect(name: "correct1", filename: "correct1.mp3"),
    SoundEffect(name: "correct2", filename: "correct2.mp3"),
    SoundEffect(name: "correct3", filename: "correct3.mp3"),
    SoundEffect(name: "correct4", filename: "correct4.mp3"),
    SoundEffect(name: "correct5", filename: "correct5.mp3"),
    SoundEffect(name: "costume-drama1", filename: "costume-drama1.mp3"),
    SoundEffect(name: "costume-drama2", filename: "costume-drama2.mp3"),
    SoundEffect(name: "costume-drama3", filename: "costume-drama3.mp3"),
    SoundEffect(name: "despair1", filename: "despair1.mp3"),
    SoundEffect(name: "dissonance1", filename: "dissonance1.mp3"),
    SoundEffect(name: "dondonpafupafu1", filename: "dondonpafupafu1.mp3"),
    SoundEffect(name: "dorodoro1", filename: "dorodoro1.mp3"),
    SoundEffect(name: "drop1", filename: "drop1.mp3"),
    SoundEffect(name: "drum-japanese1", filename: "drum-japanese1.mp3"),
    SoundEffect(name: "drum-japanese2", filename: "drum-japanese2.mp3"),
    SoundEffect(name: "drum-roll1", filename: "drum-roll1.mp3"),
    SoundEffect(name: "eat-meat1", filename: "eat-meat1.mp3"),
    SoundEffect(name: "eerie-laughter1", filename: "eerie-laughter1.mp3"),
    SoundEffect(name: "extend1", filename: "extend1.mp3"),
    SoundEffect(name: "eye-shine1", filename: "eye-shine1.mp3"),
    SoundEffect(name: "fall-down1", filename: "fall-down1.mp3"),
    SoundEffect(name: "fate1", filename: "fate1.mp3"),
    SoundEffect(name: "fate2", filename: "fate2.mp3"),
    SoundEffect(name: "fear-bird1", filename: "fear-bird1.mp3"),
    SoundEffect(name: "fear1", filename: "fear1.mp3"),
    SoundEffect(name: "feed1", filename: "feed1.mp3"),
    SoundEffect(name: "flash1", filename: "flash1.mp3"),
    SoundEffect(name: "flash2", filename: "flash2.mp3"),
    SoundEffect(name: "flee1", filename: "flee1.mp3"),
    SoundEffect(name: "game-versus1", filename: "game-versus1.mp3"),
    SoundEffect(name: "game-versus2", filename: "game-versus2.mp3"),
    SoundEffect(name: "gong-played1", filename: "gong-played1.mp3"),
    SoundEffect(name: "gong-played2", filename: "gong-played2.mp3"),
    SoundEffect(name: "heart1", filename: "heart1.mp3"),
    SoundEffect(name: "hero1", filename: "hero1.mp3"),
    SoundEffect(name: "hitahita1", filename: "hitahita1.mp3"),
    SoundEffect(name: "hitahita2", filename: "hitahita2.mp3"),
    SoundEffect(name: "hyoushigi1", filename: "hyoushigi1.mp3"),
    SoundEffect(name: "hyoushigi2", filename: "hyoushigi2.mp3"),
    SoundEffect(name: "hyoushigi3", filename: "hyoushigi3.mp3"),
    SoundEffect(name: "hyun1", filename: "hyun1.mp3"),
    SoundEffect(name: "incorrect1", filename: "incorrect1.mp3"),
    SoundEffect(name: "incorrect2", filename: "incorrect2.mp3"),
    SoundEffect(name: "jump-anime1", filename: "jump-anime1.mp3"),
    SoundEffect(name: "jump-cute1", filename: "jump-cute1.mp3"),
    SoundEffect(name: "kira2", filename: "kira2.mp3"),
    SoundEffect(name: "kotsudumi1", filename: "kotsudumi1.mp3"),
    SoundEffect(name: "machdash1", filename: "machdash1.mp3"),
    SoundEffect(name: "madness1", filename: "madness1.mp3"),
    SoundEffect(name: "mens-ou1", filename: "mens-ou1.mp3"),
    SoundEffect(name: "notice1", filename: "notice1.mp3"),
    SoundEffect(name: "nyu1", filename: "nyu1.mp3"),
    SoundEffect(name: "nyu2", filename: "nyu2.mp3"),
    SoundEffect(name: "nyu3", filename: "nyu3.mp3"),
    SoundEffect(name: "piano-midnight1", filename: "piano-midnight1.mp3"),
    SoundEffect(name: "piano1", filename: "piano1.mp3"),
    SoundEffect(name: "prayer1", filename: "prayer1.mp3"),
    SoundEffect(name: "puyon1", filename: "puyon1.mp3"),
    SoundEffect(name: "question1", filename: "question1.mp3"),
    SoundEffect(name: "question2", filename: "question2.mp3"),
    SoundEffect(name: "recollection1", filename: "recollection1.mp3"),
    SoundEffect(name: "roll-finish1", filename: "roll-finish1.mp3"),
    SoundEffect(name: "roll1", filename: "roll1.mp3"),
    SoundEffect(name: "sceneswitch1", filename: "sceneswitch1.mp3"),
    SoundEffect(name: "sceneswitch2", filename: "sceneswitch2.mp3"),
    SoundEffect(name: "school-chime1", filename: "school-chime1.mp3"),
    SoundEffect(name: "scream-woman1", filename: "scream-woman1.mp3"),
    SoundEffect(name: "scream1", filename: "scream1.mp3"),
    SoundEffect(name: "self-regulation1", filename: "self-regulation1.mp3"),
    SoundEffect(name: "shakin1", filename: "shakin1.mp3"),
    SoundEffect(name: "shine1", filename: "shine1.mp3"),
    SoundEffect(name: "shine2", filename: "shine2.mp3"),
    SoundEffect(name: "shine3", filename: "shine3.mp3"),
    SoundEffect(name: "shine4", filename: "shine4.mp3"),
    SoundEffect(name: "shock1", filename: "shock1.mp3"),
    SoundEffect(name: "shock2", filename: "shock2.mp3"),
    SoundEffect(name: "shock3", filename: "shock3.mp3"),
    SoundEffect(name: "shock4", filename: "shock4.mp3"),
    SoundEffect(name: "shock5", filename: "shock5.mp3"),
    SoundEffect(name: "shrink1", filename: "shrink1.mp3"),
    SoundEffect(name: "sit1", filename: "sit1.mp3"),
    SoundEffect(name: "smoke1", filename: "smoke1.mp3"),
    SoundEffect(name: "solemnity1", filename: "solemnity1.mp3"),
    SoundEffect(name: "strike1", filename: "strike1.mp3"),
    SoundEffect(name: "stupid1", filename: "stupid1.mp3"),
    SoundEffect(name: "stupid2", filename: "stupid2.mp3"),
    SoundEffect(name: "stupid3", filename: "stupid3.mp3"),
    SoundEffect(name: "stupid4", filename: "stupid4.mp3"),
    SoundEffect(name: "suck1", filename: "suck1.mp3"),
    SoundEffect(name: "switch1", filename: "switch1.mp3"),
    SoundEffect(name: "teardrop1", filename: "teardrop1.mp3"),
    SoundEffect(name: "telepathy1", filename: "telepathy1.mp3"),
    SoundEffect(name: "tickle1", filename: "tickle1.mp3"),
    SoundEffect(name: "tin1", filename: "tin1.mp3"),
    SoundEffect(name: "tin2", filename: "tin2.mp3"),
    SoundEffect(name: "tirin1", filename: "tirin1.mp3"),
    SoundEffect(name: "touch1", filename: "touch1.mp3"),
    SoundEffect(name: "trumpet-dub1", filename: "trumpet-dub1.mp3"),
    SoundEffect(name: "trumpet1", filename: "trumpet1.mp3"),
    SoundEffect(name: "tympani-roll1", filename: "tympani-roll1.mp3"),
    SoundEffect(name: "work-cute1", filename: "work-cute1.mp3"),
]
