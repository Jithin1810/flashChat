//
//  Constants.swift
//  FlashChat
//
//  Created by JiTHiN on 05/09/24.
//

import Foundation
struct K {
    static let appName = "⚡️FlashChat"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "ChatTableViewCell"
    static let registerVc = "registerVc"
    static let loginVc = "loginVc"
    static let chatVc = "chatVc"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
