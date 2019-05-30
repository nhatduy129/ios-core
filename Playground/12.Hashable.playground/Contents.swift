struct Student: Hashable {
    var name: String
    var age: Int
}

var dict = [Student: Int]()

let a = Student(name: "duy", age: 25)
dict[a] = 1209
let b = Student(name: "nhat", age: 26)
dict[b] = 123

print(a.hashValue)
print(b.hashValue)

print(dict[a])
print(dict[b])
