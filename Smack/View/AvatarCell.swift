//
//  AvatarCell.swift
//  Smack
//
//  Created by Jeff Umandap on 3/15/21.
//

import UIKit

class AvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    func setUpView() {
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
    }
 
    
    
    
}
