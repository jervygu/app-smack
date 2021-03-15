//
//  AuthService.swift
//  Smack
//
//  Created by Jeff Umandap on 3/15/21.
//

import Foundation

class AuthService {
    
    static let instance = AuthService()
    
    let defaults  = UserDefaults.standard
    
    var isLoggedIn : Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken : String {
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail : String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler) {
        
        let lowerCasedEmail = email.lowercased()
        
        // need firebase saving code
        
    }
    
    func loginUser(email: String, password: String, completion: @escaping CompletionHandler) {
        
        // need firebase saving code
        let lowerCasedEmail = email.lowercased()
        
    }
    
    func createUser(name: String, email: String, avatarName: String, avatarColor: String, completion: @escaping CompletionHandler) {
        
        let lowerCasedEmail = email.lowercased()
        
        
        // need firebase saving code
        
    }
    
    
    
    
    
    
}
