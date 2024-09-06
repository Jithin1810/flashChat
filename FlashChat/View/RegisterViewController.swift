//
//  RegisterViewController.swift
//  FlashChat
//
//  Created by JiTHiN on 04/09/24.
//

import UIKit
import Firebase
import FirebaseAuth

class RegisterViewController: UIViewController {
    @IBOutlet weak var registerEmailTextField: UITextField!
    @IBOutlet weak var registerPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func registereButtonTapped(_ sender: Any) {
        if let email = registerEmailTextField.text{
            if let password = registerPasswordTextField.text{
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    if let e = error?.localizedDescription{
                        self.showAlert(title: "Error", message: e)
                    }else{
                        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                        guard let chatVc = storyBoard.instantiateViewController(identifier: K.chatVc) as? ChatViewController else {return}
                        self.navigationController?.pushViewController(chatVc, animated: true)
                    }
                }
            }
        }
    }
    
    func showAlert(title: String, message: String) {
        let vc = self.navigationController
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        vc!.present(alertController, animated: true, completion: nil)
    }
    
    
}
