import UIKit

protocol Car: CustomStringConvertible {
    var engineRunning: Bool {get set}
    var openWindows: Bool {get set}
    var productionYear: Int {get}
    var color: UIColor {get set}
    mutating func toggleEngine()
    mutating func toggleWindows()
}

extension Car {
    mutating func toggleEngine() {
        self.engineRunning = !self.engineRunning;
    }
    
    mutating func toggleWindows() {
        self.openWindows = !self.openWindows
    }
}


class SportCar: Car {
    var engineRunning: Bool
    
    var openWindows: Bool
    
    let productionYear: Int
    
    var color: UIColor
    
    var sportMode: Bool
    
    init(engineRunning: Bool, openWindows: Bool, productionYear: Int, color: UIColor, sportMode: Bool) {
        self.color = color
        self.engineRunning = engineRunning
        self.openWindows = openWindows
        self.productionYear = productionYear
        self.sportMode = sportMode;
    }
}


class TrunkCar: Car {
    var engineRunning: Bool
    
    var openWindows: Bool
    
    let productionYear: Int
    
    var color: UIColor
    
    var liftBody: Bool
    
    init(engineRunning: Bool, openWindows: Bool, productionYear: Int, color: UIColor, liftBody: Bool) {
        self.color = color
        self.engineRunning = engineRunning
        self.openWindows = openWindows
        self.productionYear = productionYear
        self.liftBody = liftBody
    }
    
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "{engineRunning: \(self.engineRunning), color: \(self.color.accessibilityName), openWindows: \(self.openWindows), productionYear: \(self.productionYear) } "
    }
}


extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "{engineRunning: \(self.engineRunning), color: \(self.color.accessibilityName), openWindows: \(self.openWindows), productionYear: \(self.productionYear), } "
    }
}

var sportCar = SportCar(engineRunning: false, openWindows: false, productionYear: 2020, color: .white, sportMode: false)
var trunkCar = TrunkCar(engineRunning: false, openWindows: false, productionYear: 2020, color: .white, liftBody: false)
sportCar.toggleEngine();
trunkCar.toggleEngine();

print(sportCar)
print(trunkCar)
