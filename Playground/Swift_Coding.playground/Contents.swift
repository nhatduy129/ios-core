let s = ["Duy"].reduce("", { $0 + ($0 == "" ? "" : ", ") + $1 })
print(s)
