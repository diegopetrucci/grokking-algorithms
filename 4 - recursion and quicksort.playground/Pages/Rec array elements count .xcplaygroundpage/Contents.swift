// Recursively count the elements of an array

func recursiveElementsCount<T>(list: [T]) -> Int {
    if list.first == nil { return 0 }
    
    return 1 + recursiveElementsCount(list: Array(list.dropFirst()))
}

let list0 = [5, 1, 6, 8, 22, 4]
let list1 = [5]
let list2: [Int] = []

recursiveElementsCount(list: list0)
recursiveElementsCount(list: list1)
recursiveElementsCount(list: list2)
