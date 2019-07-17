import Foundation

//Operation

//let op1 = Operation()
//op1.completionBlock = {
//    for i in 0...8000 {
//        if i.isMultiple(of: 3000) {
//            print("A")
//        }
//    }
//}
//op1.start()
//
//let op2 = Operation()
//op2.completionBlock = {
//    for i in 0...8000 {
//        if i.isMultiple(of: 3000) {
//            print("B")
//        }
//    }
//}
//op2.start()
//
////BlockOperation: Operation
//
//let blockOperation = BlockOperation()
//blockOperation.addExecutionBlock {
//    print("I")
//}
//blockOperation.addExecutionBlock {
//    print("love")
//}
//blockOperation.addExecutionBlock {
//    print("programming!")
//}
//blockOperation.start()
//print("so much")
//OperationQueue

//let opQueue = OperationQueue()
//opQueue.maxConcurrentOperationCount = 1
//opQueue.addOperation {
//    for i in 0...8000 {
//        if i.isMultiple(of: 3000) {
//            print("A")
//        }
//    }
//}
//opQueue.addOperation {
//    for i in 0...8000 {
//        if i.isMultiple(of: 3000) {
//            print("B")
//        }
//    }
//}
//opQueue.addOperation {
//    for i in 0...8000 {
//        if i.isMultiple(of: 3000) {
//            print("C")
//        }
//    }
//}
//opQueue.addOperation {
//    for i in 0...8000 {
//        if i.isMultiple(of: 3000) {
//            print("D")
//        }
//    }
//}
//

//Operation Dependency

class OperationA: Operation {
    override func main() {
        for i in 0...8000 {
            if i.isMultiple(of: 3000) {
                print("A Operation")
            }
        }
    }
}

class OperationB: Operation {
    override func main() {
        for i in 0...8000 {
            if i.isMultiple(of: 3000) {
                print("B Operation")
            }
        }
    }
}

let aOp = OperationA()
let bOp = OperationB()

aOp.completionBlock = {
    print("A Operation finished")
}
bOp.completionBlock = {
    print("B Operation finished")
}

aOp.addDependency(bOp)

let queue = OperationQueue()
queue.maxConcurrentOperationCount = 1
queue.addOperation(aOp)
queue.addOperation(bOp)

sleep(2)
