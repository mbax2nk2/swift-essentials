import Foundation

/*
 
 Задача 1
 
 */

//x2 - 8x + 12 = 0
let a: Double = 1
let b: Double = -8
let c: Double = 12

let d = pow(Double(b), 2) - 4 * a * c
print("Дискриминант: \(d)")

if d > 0 {
    let x1 = (-b + sqrt(d)) / 2 * a
    let x2 = (-b - sqrt(d)) / 2 * a
    
    print("Корни x1: \(x1), x2: \(x2)")
} else if d == 0 {
    let x1 = -b / 2 * a
    print("Корень x1: \(x1)")
} else {
    print("Квадратное уравнение не имеет корней")
}

/*
 
 Задача 2
 
 */

let catet1:Double = 3
let catet2:Double = 4
let hypotenuse = sqrt(pow(catet1, 2) + pow(catet2, 2))
let perimeter = catet1 + catet2 + hypotenuse
let square = 0.5 * catet1 * catet2

print("Гипотенуза: \(hypotenuse), Периметр: \(perimeter), Площадь: \(square)")


/*
 
 Задача 3
 
 */

let deposit = 5000
let interestRate = 2
let duration = 5

let result = deposit + (deposit * interestRate * duration) / 100

print("Сумма вклада будет: \(result)")

