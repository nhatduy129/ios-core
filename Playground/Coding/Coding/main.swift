import Foundation

let op1 = BlockOperation()
op1.addExecutionBlock {
    for i in 0...80000 {
        if i.isMultiple(of: 30000) {
            print("A")
        }
    }
}
op1.addExecutionBlock {
    for i in 0...80000 {
        if i.isMultiple(of: 30000) {
            print("B")
        }
    }
}
op1.start()

let op2 = BlockOperation {
    for i in 0...80000 {
        if i.isMultiple(of: 30000) {
            print("C")
        }
    }
}
op2.start()

sleep(3)
