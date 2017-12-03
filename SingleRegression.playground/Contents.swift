//: Playground - noun: a place where people can play

import Foundation

struct Matrix {
    
    let element: [Double]
    
    func sum() -> Double {
        return element.reduce(0.0) { $0 + $1 }
    }
    
    func mean() -> Double {
        return sum() / Double(element.count)
    }
}

func *(lhs: Matrix, rhs: Matrix) -> Matrix {
    if lhs.element.count != rhs.element.count {
        // 今回は要素数が違う場合を考慮しません
        assertionFailure()
    }
    
    var array: [Double] = []
    for i in 0..<lhs.element.count {
        let prod = lhs.element[i] * rhs.element[i]
        array.append(prod)
    }
    
    return Matrix(element: array)
}
