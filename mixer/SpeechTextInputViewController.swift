//
//  SpeechTextInputViewController.swift
//  mixer
//
//  Created by Namai Satoshi on 2016/02/07.
//  Copyright © 2016年 ainame. All rights reserved.
//

import UIKit
import AVFoundation

class SpeechTextInputViewController: UIViewController {
    @IBOutlet weak var speechTextView: UITextView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapSpeechButton(sender: UIButton) {
        print(speechTextView?.text)
        if let text = speechTextView?.text {
            speech(text)
        }
    }
    
    func speech(text: String) {
        let synthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "ja")
        synthesizer.speakUtterance(utterance)
    }
}
