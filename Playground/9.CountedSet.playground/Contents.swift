import Foundation

let set = NSCountedSet()
set.add("Bob")
set.add("Charlotte")
set.add("John")
set.add("Bob")
set.add("James")
set.add("Sophie")
set.add("Bob")

print(set.count(for: "Bob"))
