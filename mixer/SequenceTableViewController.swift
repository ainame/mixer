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
    var results: Results<SequenceEntry>?
    var notificationToken: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        results = store.allObjects()
        notificationToken = results?.addNotificationBlock { [weak self] (results, error) -> () in
            self?.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        notificationToken?.stop()
        super.didReceiveMemoryWarning()
    }

    @IBAction func didTapDeleteButton(sender: AnyObject) {
        store.deleteAll()
    }
    
    @IBAction func unwindToTop(segue: UIStoryboardSegue) {
        switch segue {
        case let sequencePortingSegue as SequencePortingSegue:
            if let sequence = sequencePortingSegue.sequence {
                store.add(sequence)
            }
        default: break
        }
    }
}

extension SequenceTableViewController {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(SequenceViewCell.identifier(), forIndexPath: indexPath)
        switch cell {
        case let sequenceViewCell as SequenceViewCell:
            sequenceViewCell.sequence = results![indexPath.row]
        default: break
        }
        return cell
    }
}

extension SequenceTableViewController {
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let sequence = results![indexPath.row]
        print(sequence)
        sequence.play()
    }
}
