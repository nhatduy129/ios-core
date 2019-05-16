class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Student: Person {
    var id: Int
    
    init(name: String, id: Int) {
        self.id = id
        super.init(name: name)
    }
}

let s = Student(name: "duy", id: 1312087)
print(s.id)
print(s.name)
