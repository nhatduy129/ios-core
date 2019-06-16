var genres = ["towel", "42"]
var jointGenres : String = genres.reduce("", { $0 == "" ? $1 : $0 + "," + $1 })

print(jointGenres)
