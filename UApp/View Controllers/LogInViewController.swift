//
//  LogInViewController.swift
//  UApp
//
//  Created by Németh Tamás on 2020. 05. 02..
//  Copyright © 2020. Németh Tamás. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LogInViewController: UIViewController {

    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var LoginButton: UIButton!

    @IBOutlet weak var ErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
        // Do any additional setup after loading the view.
    }
    func setUpElements(){
        //Hide error label
        ErrorLabel.alpha = 0
        // Style
        Utilities.styleFilledButton(LoginButton)
        Utilities.styleTextField(EmailTextField)
        Utilities.styleTextField(PasswordTextField)
    }

    
    @IBAction func LoginTapped(_ sender: Any) {
        
        //Create clean version of text field data
        let email = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Sign in user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                // Coldn't sign in.
                self.ErrorLabel.text = error?.localizedDescription
                self.ErrorLabel.alpha = 1
            } else {
                let homeViewController = self.storyboard?.instantiateViewController(identifier: constants.Storyboard.homeViewController) as? HomeViewController
                
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
    
    
}
