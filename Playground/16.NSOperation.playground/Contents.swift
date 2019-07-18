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

let opQueue = OperationQueue()
opQueue.maxConcurrentOperationCount = 2
opQueue.addOperation {
    print("A")
    print("A")
}
opQueue.addOperation {
    print("B")
    print("B")
}
opQueue.addOperation {
    print("C")
    print("C")
}
opQueue.addOperation {
    print("D")
    print("D")
}


//Operation Dependency

//class OperationA: Operation {
//
//    var abc: String?
//
//    override func main() {
//        for i in 0...8000 {
//            if i.isMultiple(of: 3000) {
//                print("A Operation")
//            }
//        }
//    }
//
//    deinit {
//        print("Operation A is deallocated")
//    }
//}
//
//class OperationB: Operation {
//    override func main() {
//        for i in 0...8000 {
//            if i.isMultiple(of: 3000) {
//                print("B Operation")
//            }
//        }
//    }
//
//    deinit {
//        print("Operation B is deallocated")
//    }
//}
//
//func run() {
//    let aOp = OperationA()
//    let bOp = OperationB()
//    aOp.completionBlock = {
//        aOp.abc = "Duy"
//        print("A Operation finished")
//    }
//    bOp.completionBlock = {
//        print("B Operation finished")
//    }
//
//    aOp.addDependency(bOp)
//
//    let queue = OperationQueue()
//    queue.maxConcurrentOperationCount = 1
//    queue.addOperation(aOp)
//    queue.addOperation(bOp)
//}
//
//run()
//
//sleep(2)
