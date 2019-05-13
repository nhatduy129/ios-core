
class A {
    var a: Int = 1
    var b: Int = 123
    var c: Int = 12384
    var t = Array<Int>()
}

//extension A {
//    static var age = 0x10
//}

let a = A()
print(MemoryLayout.size(ofValue: a))
