//
//  loginViewController.swift
//  teenbudget
//
//  Created by landon vago-hughes on 01/04/2017.
//  Copyright © 2017 landon vago-hughes. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class loginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBAction func loginButt(_ sender: Any) {
        
        if self.email.text == "" || self.password.text == "" {
            let alertController = UIAlertController(title: "Oops", message: "Please fill in required info to continue", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            
            FIRAuth.auth()?.signIn(withEmail: self.email.text!, password: self.password.text!, completion: {(user, error) in
                
                if user != nil {
                    self.performSegue(withIdentifier: "loginToMain", sender: self)
                } else {
                    let alertController = UIAlertController(title: "Oops", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            })
        }
        
    }
    var databasehandle: FIRDatabaseHandle?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        password.resignFirstResponder()
        return (true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
