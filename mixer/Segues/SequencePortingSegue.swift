//
//  SequencePortingSegue.swift
//  mixer
//
//  Created by Namai Satoshi on 2016/02/08.
//  Copyright © 2016年 ainame. All rights reserved.
//

import UIKit

protocol SequenceAcceptableViewControllerType {
    var sequence: SequenceEntry { get set }
}

final class SequencePortingSegue: UIStoryboardSegue {
    var sequence: SequenceEntry?
    
    override func perform() {
        super.perform()
        if let sequence = sequence,
            var dest = destinationViewController as? SequenceAcceptableViewControllerType {
                dest.sequence = sequence
        }
    }
}
