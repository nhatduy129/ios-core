import Foundation

class MyController: NSObject {
    func main() {
        _ = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(demo), userInfo: nil, repeats: true)
    }
    
    @objc func demo(completion: (() -> Void)? = nil) {
        print("demo")
    }
    
    deinit {
        print("MyController is deallocated")
    }
}

let myController = MyController()
myController.main()
