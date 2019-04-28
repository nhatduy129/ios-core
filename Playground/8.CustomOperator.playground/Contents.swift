
import Foundation

struct Fraction {
    
    var numerator: Int
    var denominator: Int
    
    init(_ numerator: Int, _ denominator: Int) {
        self.numerator = numerator
        self.denominator = denominator
    }
    
    //Can move this function to outside, if this function be outside, dont need to use static
    static func +(lhs: Fraction, rhs: Fraction) -> Fraction {
        let numerator = (lhs.numerator * rhs.denominator) + (rhs.numerator * lhs.denominator)
        let denominator = rhs.denominator * lhs.denominator
        return Fraction(numerator, denominator)
    }
}

let a = Fraction(2, 3)
let b = Fraction(3, 4)

let c = a + b
print(c)

//------------------------------------------------------

infix operator ^^
infix operator ^^=

extension Int {
    
    static func ^^(lhs: Int, rhs: Int) -> Int {
        return Int(pow(Double(lhs), Double(rhs)))
    }
    
    static func ^^=(lhs: inout Int, rhs: Int) {
         lhs = Int(pow(Double(lhs), Double(rhs)))
    }
}

var x = 2, y = 3
x ^^= y
print(x)
