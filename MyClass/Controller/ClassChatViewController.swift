//
//  ClassChatViewController.swift
//  MyClass
//
//  Created by Mac on 10/24/2560 BE.
//  Copyright © 2560 BE Radeth Chhay. All rights reserved.
//

import UIKit
import JSQMessagesViewController
import FirebaseAuth
import FirebaseDatabase

class ClassChatViewController: JSQMessagesViewController {

    var messages = [JSQMessage]()
    var array = [String]()
    
    var ref : DatabaseReference!
    var handle : DatabaseHandle!
    
    lazy var outgoingBubble: JSQMessagesBubbleImage = {
        return JSQMessagesBubbleImageFactory()!.outgoingMessagesBubbleImage(with: UIColor.jsq_messageBubbleBlue())
    }()
    
    lazy var incomingBubble: JSQMessagesBubbleImage = {
        return JSQMessagesBubbleImageFactory()!.incomingMessagesBubbleImage(with: UIColor.jsq_messageBubbleLightGray())
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        senderId = Auth.auth().currentUser?.uid
        senderDisplayName = "ASDD"
        showDisplayNameDialog()
        
        collectionView.collectionViewLayout.incomingAvatarViewSize = CGSize.zero
        collectionView.collectionViewLayout.outgoingAvatarViewSize = CGSize.zero
        
        let query = Constants.refs.databaseChats.queryLimited(toLast: 10); _ = query.observe(.childAdded, with: { [weak self] snapshot in

            if let data  = snapshot.value as? [String: String],
               let id = data["sender_id"],
               let name = data["name"],
               let text = data["text"],
               !text.isEmpty
            {
                if let message = JSQMessage(senderId: id, displayName: name, text: text)
                {
                    self?.messages.append(message)
                    self?.finishReceivingMessage()
                }
            }
        })
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //hide tab bar controller
        self.tabBarController?.tabBar.isHidden = true
    }
    
    //return an item from messages
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
        return messages[indexPath.item]
    }
    
    //return total number of messages
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource!
    {
        return messages[indexPath.item].senderId == senderId ? outgoingBubble : incomingBubble
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource!
    {
        return nil
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, attributedTextForMessageBubbleTopLabelAt indexPath: IndexPath!) -> NSAttributedString!
    {
        return messages[indexPath.item].senderId == senderId ? nil : NSAttributedString(string: messages[indexPath.item].senderDisplayName)
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForMessageBubbleTopLabelAt indexPath: IndexPath!) -> CGFloat
    {
        return messages[indexPath.item].senderId == senderId ? 0 : 15
    }
    
    //when user pressed send button
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        
        //write data to firebase
        let ref = Constants.refs.databaseChats.childByAutoId()
        
        let message = [
            "sender_id": senderId,
            "name": Constants.refs.databaseChats,
            "text": text
            ] as [String : Any]
        
        ref.setValue(message)
        finishSendingMessage()
    }
    
    
    //Setting A User’s Display Name With A Dialog
    @objc func showDisplayNameDialog()
    {
        let defaults = UserDefaults.standard
        let ref = Database.database().reference()
        
        ref.observeSingleEvent(of: .value, with: { snapshot in
            let name = snapshot.value as? String
            self.senderDisplayName = name
        })
        
        self.title = "Chat: \(self.senderDisplayName)"
        defaults.synchronize()
    
    }
    


}
