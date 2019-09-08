import UIKit

class Person {
    var name: String
    var age: Int {
        get {
            return 10
        }
    }
    
    init(age: Int, name: String) {
        self.name = name
    }
    
    func desc() {
        print("This Person named: \(name)")
    }
}

protocol PersonProtocol: AnyObject {
    var age: Int { get set }
    func desc()
}

class Student: PersonProtocol {
    
    var grade: Int
    var age: Int
    
    init(age: Int, grade: Int) {
        self.grade = grade
        self.age = age
    }
    
    func desc() {
        print("This Student age: \(age)")
    }
}

class Worker: PersonProtocol {
    var jobName: String
    var age: Int
    
    init(age: Int, jobName: String) {
        self.jobName = jobName
        self.age = age
    }
    
    func desc() {
        print("This Worker age: \(age)")
    }
}

var arr = [PersonProtocol]()
arr.append(Student(age: 2, grade: 10))
arr.append(Worker(age: 3, jobName: "no"))
arr.append(Student(age: 4, grade: 12))

arr.forEach({
    $0.desc()
})
