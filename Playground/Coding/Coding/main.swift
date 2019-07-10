import Foundation

let q1 = DispatchQueue(label: "hello 1")
let q2 = DispatchQueue(label: "hello 2", attributes: .concurrent)

//q2.async {
//    q1.async {
//        for i in 0...10000 {
//            if i.isMultiple(of: 3000) {
//                print("1")
//            }
//        }
//    }
//    print("off 1")
//}
//
//q2.async {
//    q1.sync {
//        q1.async {
//            print("33")
//        }
//        for i in 0...10000 {
//            if i.isMultiple(of: 3000) {
//                print("3")
//            }
//        }
//    }
//    print("off 3")
//}
//
//q2.async {
//    q1.sync {
//        for i in 0...10000 {
//            if i.isMultiple(of: 3000) {
//                print("2")
//            }
//        }
//    }
//    print("off 2")
//}


q1.async {
    for i in 0...80000 {
        if i.isMultiple(of: 3000) {
            print("1")
        }
    }
}
q1.async {
    for i in 0...8000 {
        if i.isMultiple(of: 3000) {
            print("2")
        }
    }
}
q1.async {
    for i in 0...80000 {
        if i.isMultiple(of: 3000) {
            print("3")
        }
    }
}
sleep(3)
