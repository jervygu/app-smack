//
//  ChatVC.swift
//  Smack
//
//  Created by Jeff Umandap on 3/10/21.
//

import UIKit

class ChatVC: UIViewController {
    
    @IBOutlet weak var menuBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuBtn.addTarget(self.revealViewController(),
                          action: #selector(SWRevealViewController.revealToggle(_:)),
                          for: .touchUpInside)
        
        self.view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
        self.view.addGestureRecognizer((self.revealViewController()?.tapGestureRecognizer())!)
        
        
        
    }
    

}
