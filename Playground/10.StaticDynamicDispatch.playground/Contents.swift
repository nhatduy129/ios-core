
protocol Worker {
    var name: String { get }
}

extension Worker {
    var name: String {
        return "worker"
    }
    
    func sayHi() {
        print("hi, \(self.name)")
    }
}

struct Dev: Worker {
    var name: String {
        return "dev"
    }
    
    func sayHi() {
        print("hello, \(self.name)")
    }
}

let dev = Dev()
dev.sayHi() // hello, dev

let anotherDev: Worker = dev
anotherDev.sayHi() // hi, dev

let listDev = [dev, anotherDev]
for persion in listDev {
    persion.sayHi() // hi, dev
}
