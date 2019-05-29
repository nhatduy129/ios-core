//
//  QuickbloxHelper.swift
//  19.QuickbloxSimple
//
//  Created by Duy Nguyen on 28/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import Quickblox

class QuickbloxHelper {
    
    static let messagesPerPage = 20
    static var currentOffset: Int = 0
    static var dialog: QBChatDialog?
    static var messages: [QBChatMessage] = []
    static var isLoggedIn: Bool = false
    static var isReadyForChat: Bool = false
    
    static func login(login: String, password: String, successBlock: ((QBResponse, QBUUser) -> ())?, errorBlock: ((QBResponse) -> ())?) {
        QBRequest.logIn(withUserLogin: login, password: password, successBlock: { response, user in
            isLoggedIn = true
            successBlock?(response, user)
        }, errorBlock: errorBlock)
    }
    
    static func connectToChat(id: Int, password: String, completionBlock: ((Error?) -> ())?) {
        QBChat.instance.connect(withUserID: UInt(id), password: password, completion: completionBlock)
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
    
    static func getPrivateChatDialog(occupantID: Int, successBlock: ((QBResponse, QBChatDialog) -> ())?, errorBlock: ((QBResponse) -> ())?) {
        let initialDialog = QBChatDialog(dialogID: nil, type: .private)
        initialDialog.occupantIDs = [NSNumber(value: occupantID)]
        QBRequest.createDialog(initialDialog, successBlock: { (response, chatDialog) in
            isReadyForChat = true
            dialog = chatDialog
            successBlock?(response, chatDialog)
        }, errorBlock: errorBlock)
    }
    
    static func sendMessage(text: String) {
        let message = QBChatMessage()
        let params: NSMutableDictionary = NSMutableDictionary()
        params["save_to_history"] = true
        message.text = text
        message.customParameters = params
        
        dialog?.send(message, completionBlock: { (error) in
            if error != nil {
                
            } else {
                
            }
        })
    }
    
    static func loadMessages(successBlock: (([QBChatMessage]) -> ())?) {
        guard let privateDialog = dialog else {
            return
        }
        
        let page = QBResponsePage(limit: messagesPerPage, skip: currentOffset)
        
        QBRequest.messages(withDialogID: privateDialog.id!, extendedRequest: ["sort_desc": "date_sent"], for: page, successBlock: { (response, responseMessages, page) in
            messages.append(contentsOf: responseMessages)
            currentOffset += messagesPerPage
            if successBlock != nil {
                successBlock!(responseMessages)
            }
        }) { (response) in
            debugPrint(response.error!.error!.localizedDescription)
        }
    }
    
    static func deleteDialog(successBlock: (()->())?, errorBlock: ((QBResponse)->())?) {
        guard let dialogId = QuickbloxHelper.dialog?.id else {
            return
        }
        QBRequest.deleteDialogs(withIDs: ["\(dialogId)"], forAllUsers: false, successBlock: { (response, _, _, _) in
            isReadyForChat = false
            dialog = nil
            successBlock?()
        }) { (response) in
            errorBlock?(response)
        }
    }
    
    static func deleteMessages() {
        // TODO: To be implemented
    }
}
