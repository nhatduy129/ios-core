import Foundation

//Operation

let op1 = Operation()
op1.completionBlock = {
    for i in 0...8000 {
        if i.isMultiple(of: 3000) {
            print("A")
        }
    }
}
op1.start()

let op2 = Operation()
op2.completionBlock = {
    for i in 0...8000 {
        if i.isMultiple(of: 3000) {
            print("B")
        }
    }
}
op2.start()

//BlockOperation: Operation

let sentence = "Ray's courses are the best!"
let wordOperation = BlockOperation()
for word in sentence.split(separator: " ") {
    wordOperation.addExecutionBlock {
        print(word)
    }
}

wordOperation.start()

//OperationQueue

sleep(2)
