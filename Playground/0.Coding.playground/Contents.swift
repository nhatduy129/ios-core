
extension Array {
    
    func chooseRandom(_ quantity: Int) -> Array {
        return Array(shuffled().prefix(quantity))
    }
}

print([1,2,3,4,5].chooseRandom(3))
