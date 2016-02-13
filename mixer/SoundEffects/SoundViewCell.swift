//
//  SoundViewCell.swift
//  mixer
//
//  Created by Namai Satoshi on 2016/02/07.
//  Copyright © 2016年 ainame. All rights reserved.
//

import UIKit

class SoundViewCell: UITableViewCell, IdentifiableType {
    var sound: SoundEntry? {
        willSet {
            textLabel?.text = newValue?.value
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
