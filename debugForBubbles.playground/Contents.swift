//: Playground - noun: a place where people can play

import UIKit

var numbers: [Int] = [1,2,2,3,4,5,5,5,5,7]

var digits = [1,4,10,15,26,25]
//let even = digits.filter { for i in digits { $0 == i}}


var newArray = Array(Set(numbers.filter({ (i: Int) in numbers.filter({ $0 == i }).count > 1})))
print(newArray)

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

//
//for i in numbers {
//    for m in newArray {
//        if m == i {
//            while count
//        }
//    }
//    print(numbers)
//}


//for i in numbers {
//    if i == newArray {
//        numbers.remove(at: i)
//    }
//}

