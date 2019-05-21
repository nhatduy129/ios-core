import UIKit

struct Car {
    var color: UIColor?
    let model: String
    
    init(model: String) {
        self.model = model
    }
    
    func changeColor(color: UIColor) {
        self.color = color
    }
}

var car = Car(model: "123")
car.changeColor(color: .red)
print("abc")
