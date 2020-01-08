//
//  SignUpViewController.swift
//  kitchenMaster
//
//  Created by Jan Rückert on 11.12.19.
//  Copyright © 2019 Jan Rückert. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

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
            
            //Make error label invisible
            errorLabel.alpha = 0;
            
            //Look input-textfield
            CustomInputField.styleInputField(registerName)
            CustomInputField.styleInputField(registerEmail)
            CustomInputField.styleInputField(registerPassword)
            
            //do not show charakters
            registerPassword.isSecureTextEntry = true
            
        }
    
    //Hide status-bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@",
                                       "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    
    // Check the fields and validate the data is correct. If everything is correct, this method return nil. Otherwise, it return the error message.
    func validateFields() -> String? {
        
        //Check that all fields are filled in
        if registerName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            registerEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            registerPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            return "Bitte alle Felder ausfüllen."
        }
        
        // Check if the password is secure
        /*
        print(registerPassword.text!)
        let cleanedPassword = registerPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if isPasswordValid(cleanedPassword) == false {
            //Password isnt secure enough
            return "Bitte achte darauf, dass das Passwort mindestens 8 Zeichen sowie ein Sonderzeichen und eine Nummer enthält."
        }
        */
        
        return nil
    }
     
    @IBAction func signUpTaped(_ sender: Any) {
        
        //Validate the fields
        let error = validateFields()
        
        if error != nil{
            
            //There is something wrong with the fields, show error message
            showError(error!)
        } else {
            
            //Create cleaned versions of the data
            let name = registerName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            let email = registerEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            let password = registerPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                //Check for errors
                if err != nil {
                    
                    //There was an error creating the user
                    self.showError("Error creating user")
                    
                }
                else {
                    
                    //User was created successfully, now store the first name
                    let db = Firestore.firestore()
                    
                    
                    
                    db.collection("users").addDocument(data: ["firstname": name, "uid": result!.user.uid]) { (error) in
                        if error != nil {
                            self.showError("Personal User data [e.g. name] couldnt be saved")
                        }
                    }
 
                    
                    
                    //Transistion to the home screen
                    self.transitionToHome()
                    
                }
                
                
            }
            
            
        }
        
    }
    
    func showError(_ message:String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome() {
        
        let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "TabBar")
        self.present(controller, animated: true, completion: nil)
        
    }
    
}
