//
//  ChatViewController.swift
//  FlashChat
//
//  Created by JiTHiN on 04/09/24.
//

import UIKit
import FirebaseAuth

class ChatViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    var viewModel = ChatViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        title = K.appName
        let logout = UIBarButtonItem(title: "Logout", style: .plain,target: self, action: #selector(logoutButtonTapped))
        self.navigationItem.rightBarButtonItem = logout
        self.navigationItem.hidesBackButton = true
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        fetch()
    }

    func fetch(){
        self.viewModel.getDatafromDb {[weak self] in
            self!.tableView.reloadData()
            let indexPath = IndexPath(row: self!.viewModel.messagesCount()-1, section: 0)
            self?.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
        
    }
    @IBAction func sendButtonTapped(_ sender: Any) {
        if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email{
            viewModel.sendDatatoDb(messageSender, messageBody)
            DispatchQueue.main.async {
                self.messageTextfield.text = ""
            }
        }
        
        
    }
    
    
    @objc func logoutButtonTapped(){
        do {
            try Auth.auth().signOut()
            self.navigationController?.popToRootViewController(animated: true)
        }catch let signOutError as NSError{
            print ("error signing out %@", signOutError)
        }
        
    }

}

extension ChatViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.messagesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = viewModel.messages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! ChatTableViewCell
        cell.messageLabel.text = message.body
            if message.sender == Auth.auth().currentUser?.email{
                cell.leftImageView.isHidden = true
                cell.rightimageView.isHidden = false
                cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
                cell.messageLabel.textColor = UIColor(named: K.BrandColors.purple)
            }else{
                cell.leftImageView.isHidden = false
                cell.rightimageView.isHidden = true
                cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.purple)
                cell.messageLabel.textColor = UIColor(named: K.BrandColors.lightPurple)
            }
        return cell
    }
}

extension ChatViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
}
