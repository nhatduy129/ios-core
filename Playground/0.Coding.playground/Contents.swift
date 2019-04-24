func cal(_ n: Int, _ s: inout [Int], _ i: Int) -> Int {
    if n % s[i] != 0 || n == s[i] {
        return 1
    }
    for j in (i+1)..<s.count {
        if n % s[j] == 0 {
            return (n/s[i]) * cal(s[i], &s, j)
        }
    }
    return 1
}

// Complete the stoneDivision function below.
func stoneDivision(n: Int, s: [Int]) -> Int {
    var s = s
    var mx = Int.min
    for i in s {
        mx = max(mx, cal(n, &s, i))
    }
    return mx
}

let ans = stoneDivision(n: 12, s: [2, 3, 4])
print(ans)
