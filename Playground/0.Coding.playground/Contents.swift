var arr2D = [
    [1, 4, 2],
    [21, 14, 22],
    [12, 24, 32],
]

arr2D.flatMap({$0}).forEach({i in
    print(i)
})

//arr2D.forEach({i in
//
//})
