//
//  ChatVC.swift
//  19.QuickbloxSimple
//
//  Created by Duy Nguyen on 28/5/19.
//  Copyright © 2019 Duy Nguyen. All rights reserved.
//

import UIKit
import Quickblox
import KRProgressHUD
import JSQMessagesViewController

class ChatVC: JSQMessagesViewController, QBChatDelegate {
    
    // MARK: Variables
    var messages = [JSQMessage]()
    var qbUser: QBUser!
    
    lazy var outgoingBubble: JSQMessagesBubbleImage = {
        return JSQMessagesBubbleImageFactory()!.outgoingMessagesBubbleImage(with: UIColor.orange)
    }()
    
    lazy var incomingBubble: JSQMessagesBubbleImage = {
        return JSQMessagesBubbleImageFactory()!.incomingMessagesBubbleImage(with: UIColor.jsq_messageBubbleLightGray())
    }()
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupQBChat()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startChat()
    }
    
    // MARK: Initialization
    func setupQBChat() {
        self.senderId = "\(qbUser.id!)"
        self.senderDisplayName = "You"
        QBChat.instance.addDelegate(self)
    }
    
    func startChat() {
        KRProgressHUD.show(withMessage: "Please wait...")
        QuickbloxHelper.connectToChat(id: qbUser.id!, password: qbUser.password!) {[weak self] (error) in
            if error == nil {
                self?.createPrivateDialog()
            } else {
                KRProgressHUD.dismiss()
            }
        }
    }
    
    func createPrivateDialog() {
        var id: Int
        if FakeData.arrUser[0].id == qbUser.id! {
            id = FakeData.arrUser[1].id!
        } else {
            id = FakeData.arrUser[0].id!
        }
        QuickbloxHelper.getPrivateChatDialog(occupantID: id, successBlock: { [weak self] (response, dialog) in
            self?.fetchMessages()
        }) { (response) in
            KRProgressHUD.dismiss()
            debugPrint(response.error!.error!.localizedDescription)
        }
    }
    
    func fetchMessages() {
        QuickbloxHelper.loadMessages { [weak self] (responseMessages) in
            KRProgressHUD.dismiss()
            for message in responseMessages {
                self?.messages.insert(self!.convertMessage(source: message), at: 0)
            }
            self?.collectionView.reloadData()
            if (self!.messages.count <= QuickbloxHelper.messagesPerPage) {
                self?.scrollToBottom(animated: false)
            } else {
                self?.scroll(to: IndexPath.init(row: QuickbloxHelper.messagesPerPage, section: 0), animated: false)
            }
        }
    }
    
    func convertMessage(source: QBChatMessage) -> JSQMessage {
        return JSQMessage(senderId: "\(source.senderID)", senderDisplayName: "\(source.senderID)", date: source.dateSent!, text: source.text!)!
    }
    
    func sendMessage(message: String) {
        QuickbloxHelper.sendMessage(text: message)
    }
    
    func addNewMessage(_ text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        let message = JSQMessage(senderId: senderId, senderDisplayName: senderDisplayName, date: date, text: text)!
        messages.append(message)
        collectionView.reloadData()
    }
    
    // MARK: - QBChat Delegate
    func chatDidReceive(_ message: QBChatMessage) {
        addNewMessage(message.text!, senderId: "\(message.senderID)", senderDisplayName: "\(message.senderID)", date: message.dateSent!)
    }
    
    // MARK: - JSQMessages Collection View Delegate
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        addNewMessage(text, senderId: senderId, senderDisplayName: senderDisplayName, date: date)
        finishSendingMessage()
        sendMessage(message: text)
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
        return messages[indexPath.item]
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource! {
        return messages[indexPath.item].senderId == senderId ? outgoingBubble : incomingBubble
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource! {
        return nil
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, attributedTextForMessageBubbleTopLabelAt indexPath: IndexPath!) -> NSAttributedString! {
        return NSAttributedString(string: "You")
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForMessageBubbleTopLabelAt indexPath: IndexPath!) -> CGFloat {
        // return messages[indexPath.item].senderId == senderId ? 0 : 15
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if messages.count > 0 && indexPath.row == 0 {
            fetchMessages()
        }
    }
}
