//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Jeff Umandap on 3/11/21.
//

import UIKit
import Firebase

class CreateAccountVC: UIViewController {
    
    
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    //variables
    
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    var bgColor : UIColor?
     

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
            
            if avatarName.contains("light") && bgColor == nil {
                userImg.backgroundColor = UIColor.lightGray
            }
        }
    }
    
    
    
    @IBAction func createAccountPressed(_ sender: Any) {
        
        guard let username = userNameTxt.text , userNameTxt.text != "" else { return }
        guard let email = emailTxt.text , emailTxt.text != "" else { return }
        guard let pass = passwordTxt.text , passwordTxt.text != "" else { return }
        
        
        
        Auth.auth().createUser(withEmail: emailTxt.text!, password: passwordTxt.text!) { (user, error) in
            
            
            if error != nil {
                print(error!)
            } else {
                Database.database().reference()
                print("Registration Successful!")
                self.performSegue(withIdentifier: UNWIND, sender: nil)
                
                AuthService.instance.registerUser(email: email, password: pass) { (success) in
                    if success {
                        AuthService.instance.loginUser(email: email, password: pass) { (success) in
                            if success {
                                AuthService.instance.createUser(email: email, avatarName: self.avatarName, avatarColor: self.avatarColor) { (success) in
                                    if success {
                                        print(UserDataService.instance.name,
                                              UserDataService.instance.avatarName)
                                        
                                        self.performSegue(withIdentifier: UNWIND, sender: nil)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    @IBAction func pickAvataPressed(_ sender: Any) {
        performSegue(withIdentifier: GO_TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func pickBGColorPressed(_ sender: Any) {
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        
        
        bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        self.userImg.backgroundColor = bgColor
    }
    
    
    
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    
    

}
