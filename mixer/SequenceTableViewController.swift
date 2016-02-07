//
//  SequenceTableViewController.swift
//  mixer
//
//  Created by Namai Satoshi on 2016/02/07.
//  Copyright © 2016年 ainame. All rights reserved.
//

import UIKit
import RealmSwift

class SequenceTableViewController: UITableViewController {
    let store = SequenceStore()
    let results = SequenceStore().allObjects()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        results.addNotificationBlock { (results, error) -> () in
            self.tableView.reloadData()
        }
    }
}

extension SequenceTableViewController {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(SequenceViewCell.identifier(), forIndexPath: indexPath)
        switch cell {
        case let sequenceViewCell as SequenceViewCell:
            sequenceViewCell.sequence = results[indexPath.row]
        default: break
        }
        return cell
    }
}
