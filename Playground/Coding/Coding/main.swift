import Foundation

class OperationA: Operation {
    
    var array:[Int]
    
    init(array:[Int]){
        self.array=array
        print("Operation init")
    }
    
    deinit{
        print("Operation deinit")
    }
    
    override func main() {
        for i in 0..<array.count{
            for j in 0..<array.count{
                if array[i]<array[j]{
                    let k = array[i]
                    array[i] = array[j]
                    array[j] = k
                }
            }
        }
    }
    
}
struct A {
    func main() {
        DispatchQueue.global().async {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in
                self.printA()
            })
        }
    }
    
    func printA() {
        print("A")
    }
}

func run() {
    let a = A()
    a.main()
}

run()

sleep(10)
