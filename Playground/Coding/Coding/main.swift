func sumOf(_ a: Int,  and b: Int) -> Int {
    let sum = a + b + 2 // "Giả sửa rằng hàm này rất phức tạp và bạn chưa phát hiện lỗi =))"
    return sum
}

func oneHundredSubtract(_ a: Int, and b: Int) -> Int {
    let sum = sumOf(a, and: b)
    let r = 100 - sum
    return r
}

let a = oneHundredSubtract(40, and: 45)
print(a)
