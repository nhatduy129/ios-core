func flippingBits(n: Int) -> Int {
    var s = String(n, radix: 2)
    s = String(Array<Character>(repeating: "0", count: 32 - s.count)) + s
    let s2 = String(s.map {
        $0 == "0" ? "1" : "0"
    })
    return Int(UInt(s2, radix: 2)!)
}

print(flippingBits(n: 4))
