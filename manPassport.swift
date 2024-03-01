class Man {
    var passport: Passport?

    deinit {
        print("Мужчина удален из памяти")
    }
}

class Passport {
    unowned let man: Man // Должен быть unowned
    
    init(man: Man) {
        self.man = man
    }
    
    deinit {
        print("Паспорт удален из памяти")
    }
}

var man: Man? = Man()
var passport: Passport? = Passport(man: man!)
man?.passport = passport
passport = nil
man = nil
