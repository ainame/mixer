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
        speechTextView?.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapSpeechButton(sender: UIButton) {
        if let text = speechTextView?.text {
            SpeechText(body: text).play()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue {
        case let unwindSegue as SoundPortingSegue:
            if let text = getSpeechText() {
                unwindSegue.setParameters(.SpeechText, value: text)
            }
        default: break
        }
    }
    
    func getSpeechText() -> String? {
        return speechTextView?.text
    }
    
}
