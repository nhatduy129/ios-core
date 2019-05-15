
protocol Person {
    var name: String { get set }
    func changeName(newName: String)
}

extension Person {
    var name: String {
        get {
            return name
        }
    }
    func changeName(newName: String) {
        name = newName
    }
}
