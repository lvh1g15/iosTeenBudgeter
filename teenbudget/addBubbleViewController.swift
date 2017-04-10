//
//  addBubbleViewController.swift
//  teenbudget
//
//  Created by landon vago-hughes on 01/04/2017.
//  Copyright © 2017 landon vago-hughes. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase


var globalBubble: [Bubble] = []


class addBubbleViewController: UIViewController, UITextFieldDelegate {

    
    var ref: FIRDatabaseReference?
    var refhandle: UInt = 0

    @IBOutlet weak var buttonAdd: UIButton!

    @IBAction func cancel(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    @IBOutlet weak var budget: UITextField!
    
    @IBOutlet weak var category: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonAdd.frame = CGRect(x: 120, y: 250, width: 70, height: 70)
        buttonAdd.backgroundColor = .blue
        buttonAdd.setTitle("Add", for: .normal)
        buttonAdd.addTarget(self, action: #selector(addBubble), for: .touchUpInside)
        buttonAdd.layer.cornerRadius = 35
        
        
        // Do any additional setup after loading the view.
    }
    
    @objc func addBubble(_ sender: UIButton) {
        
        if budget.text != "" {
            
            let uid = FIRAuth.auth()?.currentUser?.uid
            
//            let postRef = FIRDatabase.database().reference().child("users").child(uid!).child("displayName")
            
                
            let ref = FIRDatabase.database().reference(fromURL: "https://teenbudget-75e27.firebaseio.com/").child("users").child(uid!).childByAutoId()
            
            if let category = self.category.text, let budget = self.budget.text, let payment = initialisingPayment {
                
                let values = ["category": category, "budget": budget, "payment": payment]
                
                ref.setValue(values)
                
                
            
            } else {
                
            }
            
            dismiss(animated: true, completion: nil)
        
    }
        
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
