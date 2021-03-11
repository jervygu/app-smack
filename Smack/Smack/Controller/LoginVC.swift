//
//  LoginVC.swift
//  Smack
//
//  Created by Jeff Umandap on 3/11/21.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var closeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: GO_TO_CREATEACCOUNT, sender: nil)
    }
    
    
    


}
