import Foundation

let az = (97...122).map({Character(UnicodeScalar($0))})

func getMinimumDifference(a: [String], b: [String]) -> [Int] {
    var result = [Int]()
    for i in 0..<a.count {
        if a[i].count != b[i].count {
            result.append(-1)
            continue
        }
        var countA = [Character: Int]()
        var countB = [Character: Int]()
        for c in a[i] {
            if countA[c] != nil {
                countA[c]! += 1
            } else {
                countA[c] = 1
            }
        }
        for c in b[i] {
            if countB[c] != nil {
                countB[c]! += 1
            } else {
                countB[c] = 1
            }
        }
        var cnt: Int = 0
        for c in az {
            cnt += min(countA[c] ?? 0, countB[c] ?? 0)
        }
        result.append(a[i].count - cnt)
    }
    return result
}


print(getMinimumDifference(a: ["c"], b: ["b"]))

//print(xs)
//-1 0 1 2 3
