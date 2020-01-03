//
//  LoginViewController.swift
//  kitchenMaster
//
//  Created by Jan Rückert on 11.12.19.
//  Copyright © 2019 Jan Rückert. All rights reserved.
//

import UIKit

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
        
    }
    
}
