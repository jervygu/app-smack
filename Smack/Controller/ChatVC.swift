//
//  ChatVC.swift
//  Smack
//
//  Created by Jeff Umandap on 3/10/21.
//

import UIKit
import Firebase

class ChatVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    
    @IBOutlet weak var menuBtn: UIButton!
    
    @IBOutlet weak var messageTableView: UITableView!
    @IBOutlet weak var messageTF: UITextField!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var heightCons: NSLayoutConstraint!
    
    var messageArray : [Message] = [Message]()

    

    override func  viewDidLoad() {
        super.viewDidLoad()
        
        messageTableView.delegate = self
        messageTableView.dataSource = self
        messageTF.delegate = self
        
        menuBtn.addTarget(self.revealViewController(),
                          action: #selector(SWRevealViewController.revealToggle(_:)),
                          for: .touchUpInside)
        
        self.view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
        self.view.addGestureRecognizer((self.revealViewController()?.tapGestureRecognizer())!)
        
        
        //TODO: Register your MessageCell.xib file here:
        messageTableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "customMessageCell")
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        messageTableView.addGestureRecognizer(tapGesture)
        
        
        messageTableView.separatorStyle = .none
    
        
        configureTableView()
        retrieveMessages()
        
    }
    
    
    // textfield deledate methods
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        UIView.animate(withDuration: 0.25) {
            self.heightCons.constant = 353
            self.view.layoutIfNeeded()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        UIView.animate(withDuration: 0.25) {
            self.heightCons.constant = 50
            self.view.layoutIfNeeded()
        }

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
        
//        let messageArray = ["First message", "Second message Second message Second message Second message Second message Second message Second message Second message Second message Second message Second message Second message Second message Second message Second message Second message Second message Second message Second message", "A paragraph is a series of related sentences developing a central idea, called the topic. Try to think about paragraphs in terms of thematic unity: a paragraph is a sentence or a group of sentences that supports one central, unified idea. Paragraphs add one idea at a time to your broader argument."]
        
//        cell.messageBody.text = messageArray[indexPath.row]
        
        cell.messageBody.text = messageArray[indexPath.row].messageBody
        cell.senderUsername.text = messageArray[indexPath.row].sender
        cell.avatarImageView.image = UIImage(named: "profileDefault")
        
        return cell
    }
    
    func configureTableView() {
        messageTableView.rowHeight = UITableView.automaticDimension
        messageTableView.estimatedRowHeight = 120.0
    }
    
    
    @objc func tableViewTapped() {
        messageTF.endEditing(true)
    }

    @IBAction func sendPressed(_ sender: Any) {
        messageTF.endEditing(true)
        
        messageTF.isEnabled = false
        sendBtn.isEnabled = false
        
        let messagesDB = Database.database().reference().child("Messages")
        
        let messageDictionary = [
            "Sender": Auth.auth().currentUser?.email,
            "MessageBody": messageTF.text!
        ]
        
        messagesDB.childByAutoId().setValue(messageDictionary) {
            (error, reference) in
            
            if error != nil {
                print(error!)
            } else {
                print("Message saved succesfully!")
                self.messageTF.isEnabled = true
                self.sendBtn.isEnabled = true
                self.messageTF.text = ""
            }
        }
    }
    
    
    
    func retrieveMessages() {
        let messageDB = Database.database().reference().child("Messages")
        
        messageDB.observe(.childAdded) { (snapshot) in
            let snapshotValue = snapshot.value as! Dictionary<String, String>
            
            let text = snapshotValue["MessageBody"]!
            let sender = snapshotValue["Sender"]!
            
            print(text, sender)
            
            let message = Message()
            message.messageBody = text
            message.sender = sender
            
            self.messageArray.append(message)
            
            self.configureTableView()
            self.messageTableView.reloadData()
        }
    }
    
    
    
}
