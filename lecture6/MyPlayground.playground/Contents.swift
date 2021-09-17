import UIKit

struct Queue<T> {
    var elements: [T] = [];
    
    mutating func enqueue(element: T) {
        elements.append(element)
    }

    mutating func dequeue() -> T? {
        guard !elements.isEmpty else {
          return nil
        }
        return elements.removeFirst()
    }

    var head: T? {
        return elements.first
    }

    var tail: T? {
        return elements.last
    }
    
    func forEach(_ closure: (_ el: T) -> Void) -> Void {
        elements.forEach(closure)
    }
    
    subscript(index: Int) -> T? {
        return elements.indices.contains(index) ? elements[index] : nil
    }

}

enum CarAddOn {
    
    case panoramicRoof(price: Int)
    case heatedSeats(price: Int)
    case hudDisplay(price: Int)
    
    var price: Int {
        switch self {
            case .panoramicRoof(let price),
                 .heatedSeats(let price),
                 .hudDisplay(let price):
                return price
            }
    }
    
    var label: String {
        switch self {
            case .panoramicRoof(let price):
                return "Панорамная крыша, цена: \(price)"
            case .heatedSeats(let price):
                return "Сиденья с подогревом, цена: \(price)"
            case .hudDisplay(let price):
                return "Индикатор на лобовом стекле, цена: \(price)"
            }
    }
}

protocol Car: CustomStringConvertible {
    var price: Int {get set}
    var model: String {get}
    mutating func add(_ addOn: CarAddOn)
    var totalPrice: Int {get}
}

class SportCar: Car {
    
    private var addOns: [CarAddOn];
    var price: Int
    let model: String
    
    init(price:Int, model:String, addOns: [CarAddOn]) {
        self.price = price;
        self.model = model
        self.addOns = addOns
    }
    
    func add(_ addOn: CarAddOn) {
        addOns.append(addOn)
    }
    
    var totalPrice: Int {
        var total = price
        
        for addOn in addOns {
            total += addOn.price
        }
        return total;
    }
    
    var description: String {
        let addonsDescription = addOns.map{"\($0.label)"}
        return "Base price: \(price), model: \(model), addOns: \(addonsDescription), totalPrice: \(totalPrice),"
    }
}

var q = Queue<Car>()

q.enqueue(element: SportCar(price: 20000, model: "Toyota", addOns: [.panoramicRoof(price: 2500), .heatedSeats(price: 1500)]))
q.enqueue(element: SportCar(price: 20000, model: "Honda", addOns: [.panoramicRoof(price: 2200), .heatedSeats(price: 500)]))
q.enqueue(element: SportCar(price: 20000, model: "Nissan", addOns: [.heatedSeats(price: 200), .hudDisplay(price: 2400)]))

if let car = q.dequeue() {
    print(car)
}


q.forEach{ print($0) }


