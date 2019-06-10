class Singleton {
    static var shared = Singleton()
    private init() {}
}

class SubClass: Singleton {
    
}

extension Singleton {
    func cal(a: Int, b: Int) -> Int {
        return a + b
    }
}

var ans = Singleton.shared.cal(a: 1, b: 2)
print(ans)
