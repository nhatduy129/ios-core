import Foundation
import ObjectiveC

protocol Flyable {
    
    var age: Int {get set}
    
    func test()
}

extension Flyable {
    
    func test() {
        print("Protocol of Flyable")
    }
}

protocol TempProtocol {

    var age: Int {get}
    
    func a()
}

extension TempProtocol {

    func a() {
        print("Protocol of TempProtocol")
    }
}

class MyClass: Flyable, TempProtocol {
    var age: Int = 0
    
    func ok() {
        age = 10
        print(age)
        test()
    }
}

var a = MyClass()
a.ok()
