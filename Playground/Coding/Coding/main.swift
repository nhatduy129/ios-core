import Foundation

extension Decimal {
    var int: Int {
        return NSDecimalNumber(decimal: self).intValue
    }
}

extension Int {
    func power(_ n: Int) -> Int {
        if n == 0 {
            return 1
        }
        var ans: Int = 1
        for i in Array<Int>(repeating: self, count: n) {
            if Double(Double(ans) * Double(i)) < Double(Int.max) {
                ans *= i
            } else {
                return Int.max
            }
        }
        return ans
    }
}


func cal(_ k: Int, _ m: Int) -> Int {
    if k >= 10 && m >= 100 {
        return Int.max
    }
    var ans: Int = 0
    for i in Array(0...k).map({ m.power($0) }) {
        if Double(Double(ans) + Double(i)) < Double(Int.max) {
            ans += i
        } else {
            return Int.max
        }
    }
    return ans
}

func bs(_ k: Int, _ n: Int) -> Int {
    var l = 1, r = n, mid: Int = 0
    
    while(r - l > 1) {
        mid = (l + r)/2;
        if(cal(k, mid) >= n) {
            r = mid
        } else {
            l = mid
        }
    }
    return r
}

func smallestGoodBase(_ n: String) -> String {
    let n = Int(n)!
    for i in stride(from: Int(log2(Double(n))), through: 1, by: -1) {
        let tmp = bs(i, n)
        if cal(i, tmp) == n {
            return String(tmp)
        }
    }
    return ""
}


print(smallestGoodBase("665930169964312773"))

//print(cal(50, 2))
