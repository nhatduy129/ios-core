
extension Float {
    static func +(lhs: Int, rhs: Float) -> Float {
        return Float(lhs) + rhs
    }
    
    static func +(lhs: Float, rhs: Int) -> Float {
        return lhs + Float(rhs)
    }
    
    static func +=(lhs: inout Float, rhs: Int) {
        lhs += Float(rhs)
    }
}

extension Double {
    static func +(lhs: Int, rhs: Double) -> Double {
        return Double(lhs) + rhs
    }
    
    static func +(lhs: Double, rhs: Int) -> Double {
        return lhs + Double(rhs)
    }
    
    static func +=(lhs: inout Double, rhs: Int) {
        lhs += Double(rhs)
    }
}

extension Double {
    static func +(lhs: Float, rhs: Double) -> Double {
        return Double(lhs) + rhs
    }
    
    static func +(lhs: Double, rhs: Float) -> Double {
        return lhs + Double(rhs)
    }
    
    static func +=(lhs: inout Double, rhs: Float) {
        lhs += Double(rhs)
    }
}
