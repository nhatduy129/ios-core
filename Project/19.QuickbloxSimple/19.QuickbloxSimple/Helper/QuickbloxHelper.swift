//
//  QuickbloxHelper.swift
//  19.QuickbloxSimple
//
//  Created by Duy Nguyen on 28/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import Quickblox

class QuickbloxHelper {
    
    static var dialog: QBChatDialog?
    static var message: [QBChatMessage] = []
    static var isLoggedIn: Bool = false
    
    static func login(login: String, password: String, successBlock: ((QBResponse, QBUUser) -> ())?, errorBlock: ((QBResponse) -> ())?) {
        QBRequest.logIn(withUserLogin: login, password: password, successBlock: { response, user in
            QuickbloxHelper.isLoggedIn = true
            successBlock?(response, user)
        }, errorBlock: errorBlock)
    }
    
    static func connectToChat(id: Int, password: String, completionBlock: ((Error?) -> ())?) {
        let user = QBUUser()
        user.id = UInt(id)
        user.password = password
        QBChat.instance.connect(with: user, completion: completionBlock)
    }
    
    static func disconnect() {
        if QBChat.instance.isConnected {
            QBChat.instance.disconnect(completionBlock: { (error) in
                if let error = error {
                    debugPrint(error.localizedDescription)
                }
            })
        }
    }
}
