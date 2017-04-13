//: Playground - noun: a place where people can play

import UIKit

class Circle {
    var circle: UIView?
    var textView: UITextField?
    var category: UILabel?
    
    init(circle: UIView, textView: UITextField, category: UILabel) {
        self.circle = circle
        self.textView = textView
        self.category = category
        
    }
    
}


var z: Double = 100.0
var x: Double = 73*(z+60)/145

let circle = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 60.0+z, height: 60.0+z))
circle.layer.cornerRadius = CGFloat(x)
circle.backgroundColor = UIColor.blue

var titleWidth: CGFloat = 50
var titleHeight: CGFloat = 50

var labelWidth: CGFloat = 50
var labelHeight: CGFloat = 50

let title = UILabel(frame: CGRect(x: (circle.center.x-titleWidth/2), y: 0, width: titleWidth, height: titleHeight))
let label = UITextField(frame: CGRect(x: (circle.center.x-labelWidth/2), y: circle.center.y, width: 50, height: 50))
label.backgroundColor = UIColor.green
title.backgroundColor = UIColor.red
circle.addSubview(label)
circle.addSubview(title)
circle.translatesAutoresizingMaskIntoConstraints = false

circle.center



//let horizontalConstraint = title.centerXAnchor.constraint(equalTo: circle.centerXAnchor)
//let horizontalConstraint2 = label.centerXAnchor.constraint(equalTo: circle.centerXAnchor)
//
//let verticalConstraint = title.centerYAnchor.constraint(equalTo: circle.centerYAnchor)
//let verticalConstraint2 = label.centerYAnchor.constraint(equalTo: circle.centerYAnchor)
//
//NSLayoutConstraint.activate([horizontalConstraint, horizontalConstraint2, verticalConstraint, verticalConstraint2])

label.textColor = .white
title.textColor = .white
title.text = "bread"
label.text = "100"


title.centerYAnchor.constraint(equalTo: circle.centerYAnchor).isActive = true
label.centerYAnchor.constraint(equalTo: circle.centerYAnchor).isActive = true


let acircle = Circle(circle: circle, textView: label, category: title)































