var arr = [2, 3, 42, 1]

for (idx, i) in zip(arr.indices, arr) {
    print("\(idx): \(i)")
}

var map: [String:String] = ["sa": "duy",
                            "eu": "nhat",
                            "ie": "nguyen",
]

print("---------------------------")

let names: Set = ["Sofia", "Camilla", "Martina", "Mateo", "Nicolás"]
var shorterIndices: [Set<String>.Index] = []
for (i, name) in zip(names.indices, names) {
    if name.count <= 5 {
        shorterIndices.append(i)
    }
}
for i in shorterIndices {
    print(names[i])
}
