import Foundation

//1. Pass preference of parameter
func abc(_ d: inout Int) {
    
}
var f = 0
abc(&f)


//2. Dictionary
var dt: [Int: [Int]] = [:]
//kiểm tra key tồn tại bằng cách
if dt[3] != nil {
    //do something
}


//3. Set
var st = Set<Int>()
st.insert(2)
st.contains(3) // return false

var st2: Set = ["a", "ldk", "ldk"]
//do something


//4. Create array with default value
var graph: [[Int]] = Array(repeating: [], count: 10)


//5. 1 bài thực hành swift về đồ thị
//https://www.hackerrank.com/challenges/torque-and-development/problem
//Solution is correct, but swift is slow, so cannot accept all test cases.

//6. String
//Lấy kí tự thứ i
let s = "nhat duy"
let index = s.index(s.startIndex, offsetBy: i)
print(s[index])
// Hoặc viết extension đơn giản
extension String {
    
    subscript (i: Int) -> Character {
        let index = self.index(self.startIndex, offsetBy: i)
        return self[index]
    }
}
print(s[i])
//Lưu ý: cách sử dụng subscript bằng index như trên độ phức tạp lý thuyết là O(1) nhưng thực tế khi submit bài trên Hackerrank toàn bị TLE, do đó tốt nhất là chuyển string thành Array Character rồi subscript dạng string
var arr = Array(s)
//arr sẽ trở thành [Character]
//Bài tập tham khảo https://www.hackerrank.com/challenges/palindrome-index/problem

//7. Iterate Dictionary or Set, use zip
let names: Set = ["Sofia", "Camilla", "Martina", "Mateo", "Nicolás"]
var shorterIndices: [Set<String>.Index] = []
for (i, name) in zip(names.indices, names) {
    if name.count <= 5 {
        shorterIndices.append(i)
    }
}

//8. sieve
let MAX = 100005
var F = Array(repeating: 0, count: MAX)

func sieve() {
    for i in 2..<Int(Double(MAX).squareRoot()) {
        if F[i] != 0 { continue }
        for j in stride(from: i*i, to: MAX, by: i) {
            F[j] = i
        }
    }
}
//Bây giờ F[i] nào bằng 0 thì i đó là số nguyên tố, F[i] nào khác 0 thì i đó có ước số nhỏ nhất là i

//9. Sử dụng stride để thay thế cho vòng lặp truyền thống
for i in stride(from: 0, to: 10, by: 2) {       //ko chứa end value
    print(i)        //output: 0, 2, 4, 6, 8
}
for i in stride(from: 0, through: 10, by: 2) {  //Chứa luôn cả end value
    print(i)        //output: 0, 2, 4, 6, 8, 10
}

//10. Mũ, căn    power, square root
print(pow(5, 2))        //output: 25
print(pow(25, 2))       //output: 5
//Lưu ý:
//  - Để dùng đc pow cần import Foundation
//  - 2 parameter trong pow đều phải là Double
//  - Giá trị trả về của pow luôn là Double

//11. DFS for tree
func dfs(_ u: Int, _ p: Int) {
    // do something from root to left
    for v in graph[u] {
        if v == p { continue }
        dfs(v, u)
    }
    // do something from left to root
}
//Ex: https://www.hackerrank.com/challenges/even-tree/problem

//12. Recursive
//Dạng 1: c^N, lồng nhau
//VD: Bài toán phép tính
//insert operator: + - * / to pair of numbers in order to get the maximum. Always LEFT -> RIGHT
//Input: [1, 12, 3] -> 1 + 12 * 3 = 39
//Input [1, 12, -3] -> 1 - 12 * (-3) = 33
//Đối với dạng này truyền processing value vào parameter
