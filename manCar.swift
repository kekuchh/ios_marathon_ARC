class Car {
    weak var driver: Man? // Должен быть weak
    
    deinit {
        print("Машина удалена из памяти")
    }
}

class Man {
    var myCar: Car?
    
    deinit {
        print("Мужчина удален из памяти")
    }
}

var car: Car? = Car()
var man: Man? = Man()

car?.driver = man
man?.myCar = car

car = nil
man = nil
