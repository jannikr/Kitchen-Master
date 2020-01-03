//
//  SignUpViewController.swift
//  kitchenMaster
//
//  Created by Jan Rückert on 11.12.19.
//  Copyright © 2019 Jan Rückert. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var registerName: CustomTextField!
    @IBOutlet weak var registerEmail: CustomTextField!
    @IBOutlet weak var registerPassword: CustomTextField!
    @IBOutlet weak var errorLabel: UILabel!
    
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
     
    @IBAction func signUpTaped(_ sender: Any) {
        
    }
    
}
