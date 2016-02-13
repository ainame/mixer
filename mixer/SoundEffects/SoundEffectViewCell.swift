//
//  SoundEffectViewCell.swift
//  mixer
//
//  Created by Namai Satoshi on 2016/02/06.
//  Copyright © 2016年 ainame. All rights reserved.
//

import UIKit

class SoundEffectViewCell: UICollectionViewCell, IdentifiableType {
    @IBOutlet weak var nameLabel: UILabel!
    override var selected: Bool {
        willSet {
            if newValue {
                layer.borderWidth = 3.0
                layer.borderColor = UIColor.yellowColor().CGColor
            } else {
                layer.borderWidth = 0
                layer.borderColor = nil
            }

        }
    }
    
    let colors: [UIColor] = [
        UIColor.blueColor(),
        UIColor.greenColor(),
        UIColor.redColor()
    ]

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var soundEffect: SoundEffect? {
        willSet {
            if let se = newValue {
                apply(se)
            }
        }
    }
    
    private func apply(soundEffect: SoundEffect) {
        nameLabel.text = soundEffect.name
        backgroundColor = colors[Int(rand() % 3)]
    }
}
