//: Playground - noun: a place where people can play

import UIKit
import Foundation
import XCPlayground

struct Matrix {
    
    var element: [Double]
    
    func sum() -> Double {
        return element.reduce(0.0) { $0 + $1 }
    }
    
    func mean() -> Double {
        return sum() / Double(element.count)
    }
    
    mutating func difference(_ diff: Double) {
        element = element.map { $0 - diff }
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

// 学習に用いるサンプルデータ
let x: [Double] = [40, 38, 36, 35, 32, 45, 55, 32, 28, 41, 44, 50, 43, 44, 31]
let y: [Double] = [137000, 93000, 95000, 97000, 85000, 140000, 213000, 82000, 75000, 103000, 110000, 195000, 124000, 99000, 72000]

var xMatrix = Matrix(element: x)
var yMatrix = Matrix(element: y)

// 中心化
let bar_x = xMatrix.mean()
xMatrix.difference(bar_x)

let bar_y = yMatrix.mean()
yMatrix.difference(bar_y)

// パラメータを求める
let xx = xMatrix * xMatrix
let xy = xMatrix * yMatrix
let a = xy.sum() / xx.sum()

// 予測値を求める
let predict = a * (40 - bar_x) + bar_y
print(predict)
