//
//  SoundEffectPickerViewController.swift
//  mixer
//
//  Created by Namai Satoshi on 2016/02/06.
//  Copyright © 2016年 ainame. All rights reserved.
//

import UIKit

class SoundEffectPickerViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView?
    let player = SoundEffectPlayer.sharedInstance
    let soundEffects = SoundEffectGroups
    var itemSize: CGSize?
    
    override func viewWillLayoutSubviews() {
        let screenSizeOrNil = UIApplication.sharedApplication().keyWindow?.bounds.size
        guard let screenSize = screenSizeOrNil else { return }
        let edgeSize = (screenSize.width - 3.0) / 4.0
        itemSize = CGSize(width: edgeSize, height: edgeSize)
        super.viewDidLayoutSubviews()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.registerNib(UINib(nibName: SoundEffectViewCell.identifier(), bundle: nil), forCellWithReuseIdentifier: SoundEffectViewCell.identifier())
        collectionView?.allowsMultipleSelection = true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue {
        case let unwindSegue as SoundPortingSegue:
            if let soundEffect = getSelectedSoundEffect() {
                unwindSegue.setParameters(.SoundEffect, value: soundEffect.name)
            }
        default: break
        }
    }
    
    func getSelectedSoundEffect () -> SoundEffect? {
        guard let cv = collectionView else { return nil }
        guard let indexPath = cv.indexPathsForSelectedItems()?.first else { return nil }
        guard let cell = cv.cellForItemAtIndexPath(indexPath) else { return nil }
        guard let soundEffectViewCell = cell as? SoundEffectViewCell else { return nil }
        return soundEffectViewCell.soundEffect
    }
}

extension SoundEffectPickerViewController : UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return soundEffects.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(SoundEffectViewCell.identifier(), forIndexPath: indexPath)
        switch cell {
        case let soundEffectCell as SoundEffectViewCell:
            soundEffectCell.soundEffect = soundEffects[indexPath.row]
        default: break
        }
        return cell
    }
}

extension SoundEffectPickerViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return itemSize!
    }
}

extension SoundEffectPickerViewController: UICollectionViewDelegate {
    // allowMutipleSelectionをtrueにしつつも複数選択できない状態にする挙動
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if let indexPaths = collectionView.indexPathsForSelectedItems() {
            indexPaths.filter { $0 != indexPath }
                .forEach {
                    collectionView.deselectItemAtIndexPath($0, animated: true)
            }
        }
        let cellOrNil = collectionView.cellForItemAtIndexPath(indexPath)
        guard let cell = cellOrNil else { return }
        
        switch cell {
        case let soundEffectCell as SoundEffectViewCell:
            if let se = soundEffectCell.soundEffect {
                player.cancel()
                player.play(se)
            }
        default:
            print("not found cell pattern \(cell)")
        }
    }
    
    func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        let indexPathsOrNil = collectionView.indexPathsForSelectedItems()
        guard let indexPaths = indexPathsOrNil else { return true }
        if indexPaths.isEmpty {
            return true
        }
        if !indexPaths.contains(indexPath) {
            return true
        }
        return false
    }
}
