import Foundation

/*
 
 Задача 1, 2
 
 */

func checkNumber(number: Int, divisibleBy: Int) {
    let divisible = number % divisibleBy == 0
    
    if divisibleBy == 2 {
        divisible ? print("Число \(number) четное") : print("Число \(number) не четное")
    } else {
        divisible ? print("Число \(number) делится на \(divisible)") : print("Число \(number) не делится на \(divisible)")
    }
}

/*
 
 Задача 3
 
 */

var arr:[Int] = [];

for i in 1...100 {
    arr.append(i)
}

/*
 
 Задача 4
 
 */

for value in arr {
    if value % 2 == 0 && value % 3 != 0 {
        arr.remove(at: arr.firstIndex(of: value)!)
    }
}

/*
 
 Задача 5
 
 */

func fibonacci() {
    var array:[Int] = [];
    
    for i in 0...50 {
        if array.count < 2 {
            array.append(i)
        } else {
            array.append(array[i-1] + array[i-2])
        }
        
    }
}



/*
 
 Задача 6
 
 */

func findNaturalNumber() {
    var array:[Int] = [];
    for i in 2...101 {
        array.append(i)
    }
    var i = 0;
    var p = array[i];
    
    while p > 0 {
        for value in array {
            let remove = value * p
            if let index = array.firstIndex(of: remove) {
                array.remove(at: index)
            }
        }
        i += 1;
        if i < array.count  {
            p = array[i];
        } else {
            p = 0;
        }
    }
}


findNaturalNumber()


