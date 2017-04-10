//
//  fetchdata.swift
//  teenbudget
//
//  Created by landon vago-hughes on 01/04/2017.
//  Copyright © 2017 landon vago-hughes. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

func ==(lhs: Bubble, rhs: Bubble) -> Bool {
    return lhs.budget == rhs.budget
    
    //conforming to equatable
    
}

class Bubble: Hashable, Equatable {
    
    var budget: Double
    var category: String
    var payment: String
    // conforming to hashable
    var hashValue: Int{
        return Int(self.budget)
    }
    
    init(budget: Double, category: String, payment: String) {
        self.budget = budget
        self.category = category
        self.payment = payment
        
    }
    
}

class Fetch {
    static var ref: FIRDatabaseReference?
    static var refhandle: UInt = 0
    
    class func dispatchQueue(closure: @escaping (Bubble) -> Void) {
        
        let bgQueue = DispatchQueue(label: "bg", qos: .background, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
        
        bgQueue.async {
            
            let uid = FIRAuth.auth()?.currentUser?.uid

            
            let postRef = FIRDatabase.database().reference().child("users").child(uid!)
            
            self.refhandle = postRef.observe(FIRDataEventType.value, with: { (snapshot) in
                let bubbleDict = snapshot.value as? [String: AnyObject] ?? [:]
                for (_, value) in bubbleDict {
                    
                    if let values = value as? [String: String]
                    {

                        if let budget = Double(values["budget"]!), let category = values["category"], let payment = values["payment"] {
                            
                            let bubbles = Bubble(budget: budget, category: category, payment: payment)
                            
                            DispatchQueue.main.async {
                                closure(bubbles)
                                print(bubbles)
                            }
                            
                        }
                        
                    }
                    
                }
            
                
            })
            
        }
        
    }
    
}
