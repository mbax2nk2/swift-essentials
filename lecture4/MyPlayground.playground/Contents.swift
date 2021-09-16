import UIKit


enum CarManipulation {
    case toggleEngine
    case toggleWindow
    case cargo(load: Bool, volume: Float)
    case liftBody
    case openTrunk
}

enum BodyType {
    case sedan; case coupe;
}

class Car {
    let productionYear: Int
    let brandName: String
    let trunkSize: Float
    var engineRunning: Bool
    var windowsOpen: Bool
    var occupiedTrunkVolume: Float
    
    init(productionYear: Int, brandName: String, trunkSize: Float, engineRunning: Bool, windowsOpen: Bool, occupiedTrunkVolume: Float) {
        self.productionYear = productionYear;
        self.brandName = brandName;
        self.trunkSize = trunkSize;
        self.engineRunning = engineRunning;
        self.windowsOpen = windowsOpen;
        self.occupiedTrunkVolume = occupiedTrunkVolume;
    }
    
    func manipulate(manipulation: CarManipulation) -> Void {
        switch manipulation {
        case .cargo(let load, let volume):
            cargo(load: load, volume: volume)
        case .toggleEngine:
            toggleEngine()
        case .toggleWindow:
            toggleWindow()
        default:
            print("Не известная команда")
        }
        
    }
    
    func toggleEngine() -> Void {
        engineRunning = !engineRunning
    }
    
    func toggleWindow() -> Void {
        windowsOpen = !windowsOpen
    }
    
    func cargo(load: Bool, volume: Float) -> Void {
        let result = load ? occupiedTrunkVolume + volume : occupiedTrunkVolume - volume
        if result > 0 && result < trunkSize {
            self.occupiedTrunkVolume = result;
        } else {
            print("не правильное значение")
        }
    }
}

class SportCar : Car {
    let bodyType: BodyType
    var openTrunk: Bool
    init(openTrunk: Bool, bodyType: BodyType, productionYear: Int, brandName: String, trunkSize: Float, engineRunning: Bool, windowsOpen: Bool, occupiedTrunkVolume: Float) {
        self.bodyType = bodyType;
        self.openTrunk = openTrunk
        super.init(productionYear: productionYear, brandName: brandName, trunkSize: trunkSize, engineRunning: engineRunning, windowsOpen: windowsOpen, occupiedTrunkVolume: occupiedTrunkVolume);
    }
    
    override func manipulate(manipulation: CarManipulation) {
        switch manipulation {
        case .openTrunk:
            openTrunk = !openTrunk
        default:
            super.manipulate(manipulation: manipulation)
        }
    }
}

class TrunkCar: Car {
    var liftBody: Bool
    
    init(liftBody: Bool, productionYear: Int, brandName: String, trunkSize: Float, engineRunning: Bool, windowsOpen: Bool, occupiedTrunkVolume: Float) {
        self.liftBody = liftBody;
        super.init(productionYear: productionYear, brandName: brandName, trunkSize: trunkSize, engineRunning: engineRunning, windowsOpen: windowsOpen, occupiedTrunkVolume: occupiedTrunkVolume);
    }
    
    override func manipulate(manipulation: CarManipulation) {
        switch manipulation {
        case .liftBody:
            liftBody = !liftBody
        default:
            super.manipulate(manipulation: manipulation)
        }
    }
}

let car = SportCar(openTrunk: false, bodyType: BodyType.sedan, productionYear: 2020, brandName: "Toyota", trunkSize: 1000, engineRunning: true, windowsOpen: false, occupiedTrunkVolume: 0)
let truck = TrunkCar(liftBody: false, productionYear: 2020, brandName: "Toyota", trunkSize: 1000, engineRunning: true, windowsOpen: false, occupiedTrunkVolume: 0)
car.manipulate(manipulation: .openTrunk)
truck.manipulate(manipulation: .liftBody)
print(car.openTrunk)
print(truck.liftBody)
car.manipulate(manipulation: .openTrunk)
truck.manipulate(manipulation: .liftBody)
print(car.openTrunk)
print(truck.liftBody)
