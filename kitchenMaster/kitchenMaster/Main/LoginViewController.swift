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

}
