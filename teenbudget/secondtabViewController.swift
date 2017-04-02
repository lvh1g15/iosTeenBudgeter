//
//  secondtabViewController.swift
//  teenbudget
//
//  Created by landon vago-hughes on 01/04/2017.
//  Copyright © 2017 landon vago-hughes. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import Firebase

class secondtabViewController: UIViewController {
    


    @IBAction func logout(_ sender: Any) {
        do {
            try! FIRAuth.auth()?.signOut()
            self.performSegue(withIdentifier: "secondToLogin", sender: nil)
            
        } catch {
            print("fuck")
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
    


}
