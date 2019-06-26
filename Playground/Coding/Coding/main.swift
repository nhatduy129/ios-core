import Foundation

let az = (97...122).map({Character(UnicodeScalar($0))})

class A {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

let demo = A(name: "Duy")
print(demo.name)
