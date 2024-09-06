//
//  ViewController.swift
//  FlashChat
//
//  Created by JiTHiN on 03/09/24.
//

import UIKit
import CLTypingLabel


class WelcomeViewController: UIViewController {
    @IBOutlet weak var titleLable: CLTypingLabel!
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func registerButtonTapped(_ sender: Any) {
        guard let registerVc = storyBoard.instantiateViewController(identifier: K.registerVc) as? RegisterViewController else {return}
        self.navigationController?.pushViewController(registerVc, animated: true)
    }
    @IBAction func LoginButtonTapped(_ sender: Any) {
        guard let loginVc = storyBoard.instantiateViewController(identifier: K.loginVc) as? LoginViewController else {return}
        self.navigationController?.pushViewController(loginVc, animated: true)
    }
    

}

