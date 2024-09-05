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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLable.text = K.appName
    }
    @IBAction func registerButtonTapped(_ sender: Any) {
    }
    @IBAction func LoginButtonTapped(_ sender: Any) {
    }
    

}

