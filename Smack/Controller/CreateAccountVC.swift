//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Jeff Umandap on 3/11/21.
//

import UIKit
import Firebase

class CreateAccountVC: UIViewController {
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func createAccountPressed(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: emailTxt.text!, password: passwordTxt.text!) { (user, error) in
            
            if error != nil {
                print(error!)
            } else {
                Database.database().reference()
                print("Registration Successful!")
                self.performSegue(withIdentifier: UNWIND, sender: nil)
            }
        }
    }
    
    
    @IBAction func pickAvataPressed(_ sender: Any) {
        performSegue(withIdentifier: GO_TO_AVATAR, sender: nil)
    }
    
    @IBAction func pickBGColorPressed(_ sender: Any) {
    }
    
    
    
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    
    

}
