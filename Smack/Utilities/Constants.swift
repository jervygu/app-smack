//
//  Constants.swift
//  Smack
//
//  Created by Jeff Umandap on 3/11/21.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

// Base urls
let BASE_URL = "https://app-smack-default-rtdb.firebaseio.com/"

// segues
let GO_TO_LOGIN = "goToLogin"
let GO_TO_CREATEACCOUNT = "goToCreateAccount"
let UNWIND = "unwindToChannel"
let GO_TO_AVATAR_PICKER = "goToAvatarPicker"

let UNWIND_TO_CHANNEL = "unwindToChannel"



// User defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

//Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]

 
