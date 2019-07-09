import Foundation

//func subsetsHelper(arr: [Int], i: Int, result: inout [[Int]]) {
//    guard i < arr.count else {
//        return
//    }
//    for var sub in result {
//        sub.append(arr[i])
//
//    }
//}

func subsets(arr: [Int]) -> [[Int]] {
    var result = [[Int]]()
    var temp = [[Int]]()
    temp.append([])
    for i in 0..<arr.count {
        result = []
        for var sub in temp {
            result.append(sub)
            sub.append(arr[i])
            result.append(sub)
        }
        temp = result
    }
    return result
}

print(subsets(arr: [1,2,3]))
