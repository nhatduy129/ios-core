
func abc(a: Int, closure: (() -> Void), b: (() -> Void)) {
    print("abc \(a)")
    closure()
    b()
}

abc(a: 4, closure: {
    print("def")
    }) {
        print("rty")
}
//abc(closure: {
//    print("def")
//})
