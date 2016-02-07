//
//  SequenceViewCell.swift
//  mixer
//
//  Created by Namai Satoshi on 2016/02/07.
//  Copyright © 2016年 ainame. All rights reserved.
//

import UIKit

class SequenceViewCell: UITableViewCell, IdentifiableCellType {
    var sequence: Sequence? {
        willSet {
            textLabel?.text = newValue?.title
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
