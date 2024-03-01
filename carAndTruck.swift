
enum EngineState {
    case start, stop
}

enum WindowsState {
    case open, close
}

enum TrunkAction {
    case load, unload
}

struct Car: Hashable {
    var brand: String 
    var releaseYear: Int 
    var maxTrunkVolume: Double 
    var engineState: EngineState = EngineState.stop
    var windowsState: WindowsState = WindowsState.close
    var currentTrunkVolume: Double = 0
    
    mutating func ChangeEngineState(newState: EngineState) {
        engineState = newState

        if newState == EngineState.stop {
            windowsState = WindowsState.close
            print("Двигатель \(brand) заглушен и закрыты окна")
        } else {
            engineState = newState
            print("Двигатель \(brand) запущен")
        }
    }

    mutating func ChangeTrunkVolume(action: TrunkAction, volume: Double) {
        switch action {
            case TrunkAction.load:
                if currentTrunkVolume + volume > maxTrunkVolume {
                    print("Нельзя погрузить груз в \(brand) - превышен объем багажника")
                } else {
                    currentTrunkVolume += volume
                }
            case TrunkAction.unload:
                if currentTrunkVolume - volume < 0 {
                    print("Груз в багажнике \(brand) занимает меньше \(volume) объема")
                } else {
                    currentTrunkVolume -= volume
                }
        }
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(brand)
        hasher.combine(releaseYear)
        hasher.combine(maxTrunkVolume)
        hasher.combine(engineState)
        hasher.combine(windowsState)
        hasher.combine(currentTrunkVolume)
    }
    
    static func == (lhs: Car, rhs: Car) -> Bool {
        return lhs.brand == rhs.brand && lhs.releaseYear == rhs.releaseYear && lhs.maxTrunkVolume == rhs.maxTrunkVolume && lhs.engineState == rhs.engineState && lhs.windowsState == rhs.windowsState && lhs.currentTrunkVolume == rhs.currentTrunkVolume
    }
}

struct Truck: Hashable {
    var brand: String
    var releaseYear: Int
    var maxBodyVolume: Double
    var engineState: EngineState = EngineState.stop
    var windowsState: WindowsState = WindowsState.close
    var currentBodyVolume: Double = 0
    
    mutating func ChangeEngineState(newState: EngineState) {
        engineState = newState

        if newState == EngineState.stop {
            windowsState = WindowsState.close
            print("Двигатель \(brand) заглушен и закрыты окна")
        } else {
            engineState = newState
            print("Двигатель \(brand) запущен")
        }
    }

    mutating func ChangeBodyVolume(action: TrunkAction, volume: Double) {
        switch action {
            case TrunkAction.load:
                if currentBodyVolume + volume > maxBodyVolume {
                    print("Нельзя погрузить груз в \(brand) - превышен объем кузова")
                } else {
                    currentBodyVolume += volume
                }
            case TrunkAction.unload:
                if currentBodyVolume - volume < 0 {
                    print("Груз в кузове \(brand) занимает меньше \(volume) объема")
                } else {
                    currentBodyVolume -= volume
                }
        }
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(brand)
        hasher.combine(releaseYear)
        hasher.combine(maxBodyVolume)
        hasher.combine(engineState)
        hasher.combine(windowsState)
        hasher.combine(currentBodyVolume)
    }
    
    static func == (lhs: Truck, rhs: Truck) -> Bool {
        return lhs.brand == rhs.brand && lhs.releaseYear == rhs.releaseYear && lhs.maxBodyVolume == rhs.maxBodyVolume && lhs.engineState == rhs.engineState && lhs.windowsState == rhs.windowsState && lhs.currentBodyVolume == rhs.currentBodyVolume
    }
    
}


var car1 = Car(brand: "Volvo", releaseYear: 2013, maxTrunkVolume: 500)
car1.ChangeEngineState(newState: EngineState.start)
car1.windowsState = WindowsState.open
car1.ChangeTrunkVolume(action: TrunkAction.load, volume:100)

var car2 = Car(brand: "Audi", releaseYear: 2024, maxTrunkVolume: 333)
car2.ChangeEngineState(newState: EngineState.start)
car2.ChangeTrunkVolume(action: TrunkAction.unload, volume:100)

var truck1 = Truck(brand: "KAMAZ", releaseYear: 2015, maxBodyVolume: 10000)
truck1.ChangeEngineState(newState: EngineState.start)
truck1.ChangeBodyVolume(action: TrunkAction.load, volume:1000)
truck1.ChangeBodyVolume(action: TrunkAction.load, volume:8000)

var truck2 = Truck(brand: "MAN", releaseYear: 2026, maxBodyVolume: 5000)
truck2.ChangeEngineState(newState: EngineState.start)
truck2.ChangeBodyVolume(action: TrunkAction.load, volume:4500)
truck2.ChangeBodyVolume(action: TrunkAction.unload, volume:3333)


var dict = [car1: "car1", car2: "car2", truck1: "truck1", truck2: "truck2"] as [AnyHashable: String]

print("\nResult dict: \(dict as AnyObject)")