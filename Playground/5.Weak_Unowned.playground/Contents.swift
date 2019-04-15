class A {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var a: A? = A(name: "duy")
weak var b = a
unowned var c: A? = a

//a = nil
print(b?.name)
print(c?.name)
