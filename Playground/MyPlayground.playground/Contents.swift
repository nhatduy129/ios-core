import Foundation

class Student {
    
    var name: String?
    lazy var age: Int = { return 5 }()
    var diaChi: String? = "Vietnam"
}

var s = Student()
print(s.name)
print(s.age)
print(s.diaChi)
