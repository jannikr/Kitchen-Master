//
//  LoginViewController.swift
//  kitchenMaster
//
//  Created by Jan Rückert on 11.12.19.
//  Copyright © 2019 Jan Rückert. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    //UI View Properties
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    //First load funtion
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProperties()
    }
    
    //Setups UI Elements
    func setupProperties(){
        
    }
    
    //Hide status-bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        //Validate Text Fields
        
        //Create cleaned version of the text field
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        //Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            } else{
                self.transitionToHome()
            }
        }
        
    }
    
    func transitionToHome() {
        
        let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "TabBar")
        self.present(controller, animated: true, completion: nil)
        
    }
    
    
}
