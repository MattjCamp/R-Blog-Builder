// Playground - noun: a place where people can play

import UIKit

class Person {
    var name: String = "Name"
    var age:Int = 0
    
    func profile() -> String {
        return "I'm \(self.name) and I'm \(self.age) years old."
    }
    
}

extension Person {
    var dogYears:Int {
    get{
        return self.age * 7
    }
    }
}

var p = Person()
p.name = "Matt"
p.age = 40

println(p.dogYears)
