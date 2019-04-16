
enum Operator {
    case plus, minus, multi, div
}

var ans: Float = Float(Int.min)

func cal(_ list: [Float], _ ith: Int, _ value: Float, _ op: Operator) {
    var value = value
    switch op {
    case .plus:
        value += list[ith]
    case .minus:
        value -= list[ith]
    case .multi:
        value *= list[ith]
    case .div:
        value /= list[ith]
    }
    
    if ith == list.count - 1 {
        ans = max(ans, value)
        return
    }
    
    cal(list, ith + 1, value, .plus)
    cal(list, ith + 1, value, .minus)
    cal(list, ith + 1, value, .multi)
    cal(list, ith + 1, value, .div)
}

func solve(list: [Float]) -> Float {
    cal(list, 1, list[0], .plus)
    cal(list, 1, list[0], .minus)
    cal(list, 1, list[0], .multi)
    cal(list, 1, list[0], .div)
    return ans
}

print(solve(list: [1, 12, -3]))
