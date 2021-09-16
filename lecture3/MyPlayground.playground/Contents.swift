import UIKit

enum CarManipulation {
    case toggleEngine
    case toggleWindow
    case cargo(load: Bool, volume: Float)
}

struct SportCar {
    let productionYear: Int
    let brandName: String
    let trunkSize: Float
    var engineRunning: Bool
    var windowsOpen: Bool
    var occupiedTrunkVolume: Float
    
    mutating func manipulate(manipultaion: CarManipulation) {
        switch manipultaion {
        case .cargo(let load, let volume):
            let result = load ? occupiedTrunkVolume + volume : occupiedTrunkVolume - volume
            if result > 0 && result < trunkSize {
                self.occupiedTrunkVolume = result;
            } else {
                print("не правильное значение")
            }
        case .toggleEngine:
            engineRunning = !engineRunning
        case .toggleWindow:
            windowsOpen = !windowsOpen
        }
    }
}

struct TrunkCar {
    let productionYear: Int
    let brandName: String
    let trunkSize: Float
    var engineRunning: Bool
    var windowsOpen: Bool
    var occupiedTrunkVolume: Float
    
    mutating func manipulate(manipultaion: CarManipulation) {
        switch manipultaion {
        case .cargo(let load, let volume):
            let result = load ? occupiedTrunkVolume + volume : occupiedTrunkVolume - volume
            if result > 0  && result < trunkSize {
                self.occupiedTrunkVolume = result;
            } else {
                print("не правильное значение")
            }
        case .toggleEngine:
            engineRunning = !engineRunning
        case .toggleWindow:
            windowsOpen = !windowsOpen
        }
    }
}

var sportCar = SportCar(productionYear: 2020, brandName: "Toyota", trunkSize: 1000, engineRunning: false, windowsOpen: false, occupiedTrunkVolume: 0)
sportCar.manipulate(manipultaion: .toggleEngine)
sportCar.manipulate(manipultaion: .toggleWindow)

sportCar.manipulate(manipultaion: .cargo(load: false, volume: 10))

var honda = SportCar(productionYear: 2021, brandName: "Honda", trunkSize: 2000, engineRunning: false, windowsOpen: false, occupiedTrunkVolume: 1000)
honda.manipulate(manipultaion: .toggleEngine)
honda.manipulate(manipultaion: .toggleWindow)

honda.manipulate(manipultaion: .cargo(load: false, volume: 10))
print(honda)


var volvoTruck = TrunkCar(productionYear: 2021, brandName: "Volvo", trunkSize: 20000, engineRunning: false, windowsOpen: false, occupiedTrunkVolume: 0)
volvoTruck.manipulate(manipultaion: .toggleEngine)
volvoTruck.manipulate(manipultaion: .toggleWindow)

volvoTruck.manipulate(manipultaion: .cargo(load: false, volume: 10))
volvoTruck.manipulate(manipultaion: .cargo(load: true, volume: 20000))
print(volvoTruck)
