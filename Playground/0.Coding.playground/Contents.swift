
class A {
    var t: Int?
}

func change(obj: A) {
    obj.t = 50
}


var a = A()
a.t = 10
change(obj: a)

print(a.t)
