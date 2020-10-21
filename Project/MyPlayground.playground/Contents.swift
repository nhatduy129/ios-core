import UIKit

class Person {
    func printName() {
        print("Person")
    }
}

class Student: Person {
    override func printName() {
        print("Student")
    }
}

let a: Person = Student()
a.printName()
