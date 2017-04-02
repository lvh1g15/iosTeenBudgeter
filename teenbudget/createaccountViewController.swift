//
//  createaccountViewController.swift
//  teenbudget
//
//  Created by landon vago-hughes on 01/04/2017.
//  Copyright © 2017 landon vago-hughes. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseDatabase

class createaccountViewController: UIViewController {
    
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var email: UITextField!

    @IBOutlet weak var password: UITextField!
    
    @IBAction func createButt(_ sender: Any) {
        
        if self.email.text == "" || self.password.text == "" {
            let alertController = UIAlertController(title: "Oops", message: "Please fill in required info to continue", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else{
            FIRAuth.auth()?.createUser(withEmail: self.email.text!, password: self.password.text!, completion: {(user: FIRUser?, error) in
                
                if user != nil {
                    self.performSegue(withIdentifier: "CreateAccount", sender: self)
                    let ref = FIRDatabase.database().reference(fromURL: "https://teenbudget-75e27.firebaseio.com/").child("users").child((user?.uid)!)
                    let values = ["displayName": self.name.text]
                    ref.updateChildValues(values)
                    
                    
                    
                } else {
                    
                    let alertController = UIAlertController(title: "Oops", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                    
                    
                }
            })
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        password.resignFirstResponder()
        return (true)
    }
    


}
