// Sum all elements of an array — recursively

func recursiveSum(list: [Int]) -> Int {
    guard list.count != 0 else { return 0 }
    
    return list.first! + recursiveSum(list: Array(list.dropFirst()))
}

let list0 = [5, 1, 6, 8, 22, 4] // 46
let list1 = [5]
let list2: [Int] = []

recursiveSum(list: list0)
recursiveSum(list: list1)
recursiveSum(list: list2)
