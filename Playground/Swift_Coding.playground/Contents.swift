
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
