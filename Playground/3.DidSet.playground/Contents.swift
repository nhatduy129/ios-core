
class Animal {
    var name: String? {
        didSet {
            print("didSet in Animal")
        }
    }
}

class Dog: Animal {
    override var name: String? {
        didSet {
            print("didSet in Dog")
        }
    }
}

let dog = Dog()
dog.name = "lu"

let animal: Animal = Dog()
animal.name = "lon"

//Output
//didSet in Animal
//didSet in Dog
