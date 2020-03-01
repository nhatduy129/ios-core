let str = "nguyen vu nhat duy"
var arr = [String]()
let sub = str.split(separator: " ")
arr.append(contentsOf: sub.map { String($0) })
print(arr)
