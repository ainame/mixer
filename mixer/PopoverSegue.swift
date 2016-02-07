//
//  PopoverSegue.swift
//  mixer
//
//  Created by Namai Satoshi on 2016/02/08.
//  Copyright © 2016年 ainame. All rights reserved.
//

import UIKit

class PopoverSegue: UIStoryboardSegue, IdentifiableType {
}

class PopoverPassthroughSegue: UIStoryboardSegue, IdentifiableType {
    var originalViewController: UIViewController?
    override func perform() {
        sourceViewController.dismissViewControllerAnimated(true) {
            if let vc = self.originalViewController as? UINavigationController {
                vc.pushViewController(self.destinationViewController, animated: true)
            }
        }
    }
}