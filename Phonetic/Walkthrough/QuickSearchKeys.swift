//
//  QuickSearchKeys.swift
//  Zoom Contacts
//
//  Created by Augus on 5/1/16.
//  Copyright © 2016 iAugus. All rights reserved.
//

import UIKit

extension WalkthroughViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return keys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(QuickSearchKeyCell.self), for: indexPath) as! QuickSearchKeyCell
        
        cell.keyLabel.text = keys[indexPath.row]
        
        return cell
    }
}

extension WalkthroughViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        switch indexPath.row {
        case 0:
            UserDefaults.standard.set(true, forKey: kEnableNickname)
            UserDefaults.standard.set(false, forKey: kEnableCustomName)
        default:
            UserDefaults.standard.set(false, forKey: kEnableNickname)
            UserDefaults.standard.set(indexPath.row - 1, forKey: kQuickSearchKeyRawValue)
            UserDefaults.standard.set(true, forKey: kEnableCustomName)
        }
        UserDefaults.standard.synchronize()
    }
}


class QuickSearchKeyCell: UICollectionViewCell {
    
    @IBOutlet weak var keyLabel: UILabel!
    
    @IBOutlet private weak var imageView: UIImageView! {
        didSet {
            let color = UIColor(red: 0.5722, green: 0.0, blue: 0.9806, alpha: 1.0)
            imageView.backgroundColor = color
            imageView.layer.cornerRadius = 7.0
            imageView.layer.shadowColor = color.cgColor
            imageView.layer.shadowOffset = CGSize(width: 1, height: 1)
            imageView.layer.shadowOpacity = 0.5
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let customBackgroundView = CustomSelectedBackgroundView()
        selectedBackgroundView = customBackgroundView
        selectedBackgroundView?.backgroundColor = UIColor.clear()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
}
