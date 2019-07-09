import Foundation

let az = (97...122).map({Character(UnicodeScalar($0))})

let q1 = DispatchQueue(label: "hello 1")
let q2 = DispatchQueue(label: "hello 2", attributes: .concurrent)

print("1")
q1.async {
    print("2")
    q2.async {
        print("3")
        q1.sync {
            print("4")
        }
        print("5")
    }
    print("6")
}
print("7")
