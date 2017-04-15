//: Playground - noun: a place where people can play

import UIKit
var digits = [1,4,10,15,26,25]
//let even = digits.filter { for i in digits { $0 == i}}

var numbers: [Int] = [1,2,2,3,4,5,5,5,5,7]
func uniqueElementsFrom(array: [Int]) -> [Int] {
    var set = Set<Int>()
    let result = array.filter {
        guard !set.contains($0) else {
            return false
        }
        set.insert($0)
        return true
    }
    return result
}

let newArray2 = uniqueElementsFrom(array: numbers)
print(newArray2)


let string = "   10   "

let newString = string.trimmingCharacters(in: .whitespaces)
let doublex = Double(newString)
print(doublex)
