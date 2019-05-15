extension String {
    subscript (i: Int) -> Character {
        let index = self.index(self.startIndex, offsetBy: i)
        return self[index]
    }
}

func lengthOfLongestSubstring(_ s: String) -> Int {
    var map = Array(repeating: false, count: 256)
    var ans = -1
    var i = 0, j = 0
    while(i < s.count) {
        if map[Int(s[i].asciiValue!)] {
            ans = max(ans, i - j)
            repeat {
                map[Int(s[j].asciiValue!)] = false
                j += 1
            } while(s[j-1] != s[i])
        }
        map[Int(s[i].asciiValue!)] = true
        i += 1
    }
    return max(ans, i - j)
}

print(lengthOfLongestSubstring("aab"))
