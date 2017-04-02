//
//  firsttabViewController.swift
//  teenbudget
//
//  Created by landon vago-hughes on 01/04/2017.
//  Copyright © 2017 landon vago-hughes. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseDatabase

class Circle {
    var circle: UIView?
    var textView: UITextField?
    var budget: Double?
    var category: String?
    var payment: String?

        
    init(circle: UIView, textView: UITextField, budget: Double, category: String, payment: String) {
        self.circle = circle
        self.textView = textView
        self.budget = budget
        self.category = category
        self.payment = payment
        
    }
}

var initialisingPayment: String! = "\(0)"

class firsttabViewController: UIViewController, UITextFieldDelegate {
    
    var ref: FIRDatabaseReference?
    var refhandle: UInt = 0
    var bubbly: [bubble] = []
    
    
    var colorarray: [UIColor] = [.blue, .green, .red, .black]
    
    var circleCenter: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        if FIRAuth.auth()?.currentUser != nil {
        
            
            let uid = FIRAuth.auth()?.currentUser?.uid
            
            let ref = FIRDatabase.database().reference(fromURL: "https://teenbudget-75e27.firebaseio.com/")
            
            ref.child("users").child(uid!).observe(.value, with: { (snapshot) in
                if let result = snapshot.children.allObjects as? [FIRDataSnapshot]{
                    print(result)
                    for i in result {
                        print(i)
                        var childkey = i.key
                        
                    }
                }
            
            })
            
            
            Fetch.dispatchQueue { (bubbles) in
                
                self.bubbly.append(bubbles)
                
//                let bubble = bubbles.budget
//                let category = bubbles.category
//                let payment = bubbles.payment
//                
//                self.budget.append(bubble)
//                self.category.append(category)
//                self.payments.append(payment)
                
                
//                let circle = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
//                circle.center = self.view.center
//                circle.layer.cornerRadius = 50.0
//                circle.backgroundColor = UIColor.blue
//                
//                let label = UITextField(frame: CGRect(x: 30, y: 40, width: 50, height: 50))
//                let title = UILabel(frame: CGRect(x: 20, y: 0, width: 50, height: 50))
//                
//                for i in self.category {
//                    title.text = i
//                }
//                
//                for i in self.payments {
//                    label.text = i
//                }
//                
//                label.textColor = .white
//                title.textColor = .white
//                
//                circle.addSubview(label)
//                circle.addSubview(title)
//                
//                
//                label.delegate = self
                
                for i in self.bubbly {
                    print(self.bubbly.count)
                    
                    let z: Double = 0.0
                    let x: Double = 50.0
                    
                    let circle = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 100.0+z, height: 100.0+z))
                    circle.center = self.view.center
                    circle.layer.cornerRadius = CGFloat(x)
                    circle.backgroundColor = UIColor.blue
                    
                    let label = UITextField(frame: CGRect(x: 40, y: 40, width: 50, height: 50))
                    let title = UILabel(frame: CGRect(x: 30, y: 0, width: 50, height: 50))
                    
                    title.text = i.category
                    label.text = i.payment
                    
                    
                    
                    label.textColor = .white
                    title.textColor = .white
                    
                    circle.addSubview(label)
                    circle.addSubview(title)
                    
                    
                    label.delegate = self
                
                
                    let acircle = Circle.init(circle: circle, textView: label, budget: i.budget, category: i.category, payment: i.payment)
                    
                    print(acircle)
                    
                    self.view.addSubview(acircle.circle!)
                    acircle.circle!.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.dragCircle)))
                    
                }
//                
//                for i in circles {
//                    self.view.addSubview(i.circle!)
//                    i.circle!.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.dragCircle)))
//                    
//                }
                
            }
            
            
            
            
        } else {
            self.performSegue(withIdentifier: "mainToLogin", sender: self)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        // text hasn't changed yet, you have to compute the text AFTER the edit yourself
        let updatedString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
        
        
        
        // do whatever you need with this updated string (your code)
        
        
        // always return true so that changes propagate
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    func dragCircle(gesture: UIPanGestureRecognizer) {
        let target = gesture.view!
        
        switch gesture.state {
        case .began, .ended:
            circleCenter = target.center
        case .changed:
            let translation = gesture.translation(in: self.view)
            target.center = CGPoint(x: circleCenter!.x + translation.x, y: circleCenter!.y + translation.y)
        default: break
        }
    }
    
}
