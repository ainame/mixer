//
//  ViewController.swift
//  mixer
//
//  Created by Namai Satoshi on 2016/02/06.
//  Copyright © 2016年 ainame. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView?
    let player = SoundEffectPlayer()
    let soundEffects = SoundEffectGroups

    var itemSize: CGSize?
    
    override func viewWillLayoutSubviews() {
        let screenSizeOrNil = UIApplication.sharedApplication().keyWindow?.bounds.size
        guard let screenSize = screenSizeOrNil else { return }
        let edgeSize = (screenSize.width - 3.0) / 4.0
        itemSize = CGSize(width: edgeSize, height: edgeSize)
        super.viewDidLayoutSubviews()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.registerNib(UINib(nibName: SoundEffectViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: SoundEffectViewCell.identifier)
    }
}

extension ViewController : UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return soundEffects.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(SoundEffectViewCell.identifier, forIndexPath: indexPath)
        switch cell {
        case let soundEffectCell as SoundEffectViewCell:
            soundEffectCell.soundEffect = soundEffects[indexPath.row]
        default: break
        }
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return itemSize!
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cellOrNil = collectionView.cellForItemAtIndexPath(indexPath)
        guard let cell = cellOrNil else { return }

        switch cell {
        case let soundEffectCell as SoundEffectViewCell:
            if let se = soundEffectCell.soundEffect {
                player.play(se)
            }
        default:
            print("not found cell pattern \(cell)")
        }
    }
}
