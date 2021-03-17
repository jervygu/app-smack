//
//  LoginVC.swift
//  Smack
//
//  Created by Jeff Umandap on 3/11/21.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    @IBAction func loginBtnPressed(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: emailTF.text!, password: passwordTF.text!) { (user, error) in
            if error != nil {
                print(error!)
            } else {
                print("Login Successful!")
                self.performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: self)
            }
        }
    }
    
    
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: GO_TO_CREATEACCOUNT, sender: nil)
    }
    
    
    


}
