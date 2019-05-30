
func test(_ toDo: @autoclosure () -> Void) {
    print("step 1")
    toDo()
}

test(print("step 2"))
