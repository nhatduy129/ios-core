//1. Filter
var arr = [1, 4, 10, 2, 43, 1, 23]
print(arr.filter({ $0 > 5 }))               // output: [10, 43, 23]
