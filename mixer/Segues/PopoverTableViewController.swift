//
//  PopoverTableViewController.swift
//  mixer
//
//  Created by Namai Satoshi on 2016/02/08.
//  Copyright © 2016年 ainame. All rights reserved.
//

import UIKit

final class PopoverTableViewController: UITableViewController {
    var originalViewController: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue {
        case let popoverPassthroughSegue as PopoverPassthroughSegue:
            popoverPassthroughSegue.originalViewController = originalViewController
        default: break
        }
    }
}
