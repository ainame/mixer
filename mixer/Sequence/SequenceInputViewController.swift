//
//  SequenceInputViewController.swift
//  mixer
//
//  Created by Namai Satoshi on 2016/02/07.
//  Copyright © 2016年 ainame. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SequenceInputViewController: UITableViewController, UIPopoverPresentationControllerDelegate, SequenceAcceptableViewControllerType {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var addSoundCell: UITableViewCell!
    
    var sequence = SequenceEntry()
    var bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        tableView.registerClass(SoundViewCell.self, forCellReuseIdentifier: SoundViewCell.identifier())
        
        if sequence.title.isEmpty {
            titleTextField.placeholder = "タイトルを入力してね"
            navigationItem.rightBarButtonItem?.enabled = false
        } else {
            titleTextField.text = sequence.title
        }

        titleTextField.rx_text.subscribeNext {
            self.navigationItem.rightBarButtonItem?.enabled = !$0.isEmpty
        }.addDisposableTo(bag)
    }
    
    @IBAction func unwindToSequenceInput(segue: SoundPortingSegue) {
        if let sound = segue.createSound() {
            sequence.sounds.append(sound)
            tableView.reloadData()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue {
        case let sequencePortingSegue as SequencePortingSegue:
            sequencePortingSegue.sequence = getSequence()
        case let popoverSegue as PopoverSegue:
            let vc = popoverSegue.destinationViewController as! PopoverTableViewController
            vc.originalViewController = navigationController
            
            let popPresentationController = vc.popoverPresentationController!
            popPresentationController.delegate = self
        default: break
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
    
    func getSequence() -> SequenceEntry {
        if let text = titleTextField?.text {
            sequence.title = text
        } 
        return sequence
    }
}

let kSectionOfSound: Int = 1
extension SequenceInputViewController {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == kSectionOfSound {
            return sequence.sounds.count + 1
        }
        return super.tableView(tableView, numberOfRowsInSection: section)
    }
 
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == kSectionOfSound {
            if indexPath.row >= sequence.sounds.count {
                return addSoundCell!
            } else {
                let cell = tableView.dequeueReusableCellWithIdentifier(SoundViewCell.identifier(), forIndexPath: indexPath) as! SoundViewCell
                cell.sound = sequence.sounds[indexPath.row]
                return cell
            }
        }
        return super.tableView(tableView, cellForRowAtIndexPath: indexPath)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(tableView: UITableView, indentationLevelForRowAtIndexPath indexPath: NSIndexPath) -> Int {
        if indexPath.section == kSectionOfSound {
            return super.tableView(tableView, indentationLevelForRowAtIndexPath: NSIndexPath(forRow: 0, inSection: indexPath.section))
        }
        return super.tableView(tableView, indentationLevelForRowAtIndexPath: indexPath)
    }

}