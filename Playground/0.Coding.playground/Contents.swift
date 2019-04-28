struct A {
    
    static func sayHello() {
        print("Hello")
    }
    
    func sayHello() {
        print("Hello in ext")
    }
}

let a = A()
a.sayHello()
A.sayHello()
