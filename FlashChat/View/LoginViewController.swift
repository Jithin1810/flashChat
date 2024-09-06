//
//  LoginViewController.swift
//  FlashChat
//
//  Created by JiTHiN on 04/09/24.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var loginEmailTextField: UITextField!
    @IBOutlet weak var loginPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        if let loginEmail = loginEmailTextField.text{
            if let passWord = loginPasswordTextField.text{
                Auth.auth().signIn(withEmail: loginEmail, password: passWord) { [weak self] authResult, error in
                    if let e = error{
                        self!.showAlert(title: "Invalid", message: e.localizedDescription)
                    }else{
                        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                        guard let chatVc = storyBoard.instantiateViewController(identifier: K.chatVc) as? ChatViewController else {return}
                        self?.navigationController?.pushViewController(chatVc, animated: true)
                    }
                }
            }
        }
        
    }
    func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let vc = self.navigationController
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            
            vc!.present(alertController, animated: true, completion: nil)
        }
    }
}
