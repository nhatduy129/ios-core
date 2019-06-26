import Foundation

let az = (97...122).map({Character(UnicodeScalar($0))})

func equalStacks(h1: [Int], h2: [Int], h3: [Int]) -> Int {
    var st1 = Set<Int>()
    var sum: Int = 0
    for i in stride(from: h1.count-1, through: 0, by: -1) {
        st1.insert(h1[i] + sum)
        sum += h1[i]
    }
    var st2 = Set<Int>()
    sum = 0
    for i in stride(from: h2.count-1, through: 0, by: -1) {
        if st1.contains(h2[i] + sum) {
            st2.insert(h2[i] + sum)
        }
        sum += h2[i]
    }
    var ans = Array<Int>()
    sum = 0
    for i in stride(from: h3.count-1, through: 0, by: -1) {
        if st2.contains(h3[i] + sum) {
            ans.append(h3[i] + sum)
        }
        sum += h3[i]
    }
    return ans.max() ?? 0
}

print(equalStacks(h1: [1,10], h2: [10], h3: [10]))

//print(xs)
//-1 0 1 2 3
