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
class A {
    func main() {
        let array = [6,5,4,3,2,1]
        let operation = OperationA(array: array)
        let operationQueue = OperationQueue()
        operationQueue.addOperation(operation)
        operation.completionBlock = {
            print("done")
            for i in operation.array {
                print(i)
            }
            
        }
    }
    
    deinit {
        print("A is deinit")
    }
}

let a = A()
a.main()

sleep(2)
