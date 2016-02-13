//
//  SpeechText.swift
//  mixer
//
//  Created by Namai Satoshi on 2016/02/08.
//  Copyright © 2016年 ainame. All rights reserved.
//

import Foundation

struct SpeechText: PlayableSourceType {
    var body: String
    
    func getDuration () -> Double {
        return Double(1 * body.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)) / 15.0
    }
}