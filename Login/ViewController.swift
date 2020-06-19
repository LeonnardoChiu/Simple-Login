//
//  ViewController.swift
//  Login
//
//  Created by Leonnardo Benjamin Hutama on 19/06/20.
//  Copyright © 2020 Leonnardo Benjamin Hutama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    func validateFields() -> String? {
        let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if email == "" {
            return "Please Enter Your Email"
        }
        else if !isEmail(email!) {
            return "Email format is invalid"
        }
        else if email!.count < 10 || email!.count > 15 {
            return "Email must be between 10 to 15 character long"
        }
        else if password == "" {
            return "Please Enter Your Password"
        }
        else if !isPassword(password!) {
            return "Password must contain at least one uppercase, lowercase, number and symbol"
        }
        
        return nil
    }
    
    func okAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func isEmail(_ email : String) -> Bool {
        let emailRegX = "[A-Za-z0-9._%+-]+@[A-Za-z.-]+\\.[A-Za-z]{2,64}"
        let emailPres = NSPredicate(format: "SELF MATCHES %@", emailRegX)
        return emailPres.evaluate(with: email)
    }
    
    func isPassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{3,}$"
        let passwordPres = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPres.evaluate(with: password)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if segue.identifier == "segueToDashboard" {
            let nextVC = segue.destination as! DashboardViewController
            nextVC.email = email!
            
        }
    }
    
    @IBAction func loginTapped(_ sender: Any) {
//        let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
//        let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let error = validateFields()
        
        if error != nil {
            okAlert(title: "Fail Login", message: error ?? "")
        }
        else{
            emailTextField.text = ""
            passwordTextField.text = ""
            performSegue(withIdentifier: "segueToDashboard", sender: self)
        }
    }
    

}

