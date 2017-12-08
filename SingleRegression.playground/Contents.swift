import UIKit

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

func -(lhs: Matrix, rhs: Double) -> Matrix {
    let array = lhs.element.map { $0 - rhs }
    return Matrix(element: array)
}

// 学習に用いるサンプルデータ
let sample_x: [Double] = [40, 38, 36, 35, 32, 45, 55, 32, 28, 41, 44, 50, 43, 44, 31]
let sample_y: [Double] = [137000, 93000, 95000, 97000, 85000, 140000, 213000, 82000, 75000, 103000, 110000, 195000, 124000, 99000, 72000]

var x = Matrix(element: sample_x)
var y = Matrix(element: sample_y)

// 中心化
let bar_x = x.mean()
let c_x = x - bar_x

let bar_y = y.mean()
let c_y = y - bar_y

// パラメータを求める
let xx = c_x * c_x
let xy = c_x * c_y
let a = xy.sum() / xx.sum()

// 予測値を求める
let predict = a * (40 - bar_x) + bar_y
print(predict)
