//
//  ChannelVC.swift
//  Smack
//
//  Created by Jeff Umandap on 3/10/21.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
        
        
    }
    

}
