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

func ==(lhs: Circle, rhs: Circle) -> Bool {
    return lhs.budget == rhs.budget
    
    //conforming to equatable
    
}

class Circle: Hashable, Equatable {
    var circle: UIView?
    var textView: UITextField?
    var budget: Double?
    var category: String?
    var payment: String?
    
    var hashValue: Int{
        return Int(self.budget!)
    }

    
    init(circle: UIView, textView: UITextField, budget: Double, category: String, payment: String) {
        self.circle = circle
        self.textView = textView
        self.budget = budget
        self.category = category
        self.payment = payment
        
    }
}

var initialisingPayment: String! = "\(0)"
var bubbly: [Bubble] = []
var circles: [Circle] = []

class firsttabViewController: UIViewController, UITextFieldDelegate {
    
    var ref: FIRDatabaseReference?
    var refhandle: UInt = 0
    
    var colorarray: [UIColor] = [.blue, .green, .red, .black]
    
    var circleCenter: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        if FIRAuth.auth()?.currentUser != nil {
        
            
//            let uid = FIRAuth.auth()?.currentUser?.uid
//            
//            let ref = FIRDatabase.database().reference(fromURL: "https://teenbudget-75e27.firebaseio.com/")
            
//            ref.child("users").child(uid!).observe(.value, with: { (snapshot) in
//                if let result = snapshot.children.allObjects as? [FIRDataSnapshot]{
//                    print(result)
//                    for i in result {
//                        print(i)
//                        let childkey = i.key
//                        if(childkey == String(describing: ref.childByAutoId()) ) {
//                            for i in self.bubbly {
//                            ref.child(childkey).setValue(["payment": ])
//                                
//                            }
//                        }
//                        
//                    }
//                }
//            
//            })
            
            
            Fetch.dispatchQueue { (bubbles) in
                
                
                bubbly.append(bubbles)
                print(bubbles)
                
                let newArray = self.uniqueElementsFrom(array: bubbly)
                print(newArray)
//                
//                let newArray = Array(Set(bubbly.filter({ (i: Int) in bubbly.filter({ $0 == i }).count > 1})))
//                print(newArray)
                
                for i in newArray {
                    
                    
                    
                    let z: Double = 0.0
                    let x: Double = 50.0
                    
                    let circle = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 100.0+z, height: 100.0+z))
                    circle.center = self.view.center
                    circle.layer.cornerRadius = CGFloat(x)
                    circle.backgroundColor = UIColor.blue
                    
                    let label = UITextField(frame: CGRect(x: 40, y: 40, width: 50, height: 50))
                    let title = UILabel(frame: CGRect(x: 30, y: 0, width: 50, height: 50))
                    
//                    func textFieldDidEndEditing(_ textField: UITextField) {
//                        var alabel: String?
////                        anotherlabel.text = "\(label.text)"
//                        
//                        if ((anotherlabel.text) != nil) {
//                        text1 = anotherlabel.text
//                        } else {
//                        text1 = ""
//                    }
//                        
//                    text
//                        
//                    }
                    
                    
                    title.text = i.category
                    label.text = i.payment
                    
                    label.textColor = .white
                    title.textColor = .white
                    
                    circle.addSubview(label)
                    circle.addSubview(title)
                    
                    
                    label.delegate = self
                
                    let acircle = Circle.init(circle: circle, textView: label, budget: i.budget, category: i.category, payment: i.payment)
                    circles.append(acircle)
                    let circleArray = self.uniqueCircle(array: circles)
                    
                    
                    for i in circleArray {
                        
                    self.view.addSubview(i.circle!)
                    i.circle!.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.dragCircle)))
                    }
                }
                
            }

        } else {
            self.performSegue(withIdentifier: "mainToLogin", sender: self)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func uniqueElementsFrom(array: [Bubble]) -> [Bubble] {
        var set = Set<Bubble>()
        let result = array.filter {
            guard !set.contains($0) else {
                return false
            }
            set.insert($0)
            return true
        }
        return result
    }
    
    func uniqueCircle(array: [Circle]) -> [Circle] {
        var set = Set<Circle>()
        let result = array.filter {
            guard !set.contains($0) else {
                return false
            }
            set.insert($0)
            return true
        }
        return result
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
