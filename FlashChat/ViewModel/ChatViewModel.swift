//
//  ChatViewModel.swift
//  FlashChat
//
//  Created by JiTHiN on 06/09/24.
//

import Foundation
import Firebase
import FirebaseAuth

class ChatViewModel{
    var messages = [Message]()
    let db = Firestore.firestore()
    
    func sendDatatoDb(_ message: String, _ body : String){
        db.collection(K.FStore.collectionName).addDocument(data: [K.FStore.senderField : message, K.FStore.bodyField : body, K.FStore.dateField : Date().timeIntervalSince1970]) { error in
            if let e = error{
                print(e)
            }else{
                print("e")
            }
        }
    }
    
    func getDatafromDb(completion: @escaping () -> Void){
    
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener({querySnapshot, error in
            self.messages = []
            if let e = error{
                print(e)
            }else{
                if let snapDocuments = querySnapshot?.documents{
                    for doc in snapDocuments{
                        let data = doc.data()
                        if let messageSender = data[K.FStore.senderField] as? String, let messageBody = data[K.FStore.bodyField] as? String{
                            let newMessage = Message(sender: messageSender, body: messageBody)
                            self.messages.append(newMessage)
                            DispatchQueue.main.async {
                                completion()
                            }
                            
                        }
                    }
                }
            }
        })
    }
    func messagesCount() -> Int{
        messages.count
    }
}
