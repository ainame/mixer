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
        navigationItem.leftBarButtonItem = editButtonItem()

        results = store.allObjects()
        notificationToken = results?.addNotificationBlock { [weak self] (results, error) -> () in
            self?.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        notificationToken?.stop()
        super.didReceiveMemoryWarning()
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "SequenceEdit" {
            return tableView.editing
        }
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue {
        case let portingSegue as SequencePortingSegue:
            portingSegue.sequence = extractSequenceFromSender(sender)
        default:
            break
        }
    }

    @IBAction func unwindToTop(segue: UIStoryboardSegue) {
        switch segue {
        case let sequencePortingSegue as SequencePortingSegue:
            if let sequence = sequencePortingSegue.sequence {
                store.createOrUpdate(sequence)
                tableView.reloadData()
            }
        default: break
        }
    }
    
    func deleteRow(indexPath: NSIndexPath) {
        let sequence = results![indexPath.row]
        store.delete(sequence)
    }
    
    func extractSequenceFromSender(sender: AnyObject?) -> SequenceEntry? {
        guard let sender = sender else { return nil }
        if let cell = sender as? SequenceViewCell {
            return cell.sequence
        }
        return nil
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
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.editing = editing
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if tableView.editing {
            print("editing!")
        }
        else {
            let sequence = results![indexPath.row]
            print(sequence)
            SequencePlayerService.play(sequence)
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        guard tableView.editing else { return false }
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        guard tableView.editing else { return }
        
        switch editingStyle {
        case .Insert:
            break
        case .Delete:
            deleteRow(indexPath)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        case .None:
            break
        }
    }
}
