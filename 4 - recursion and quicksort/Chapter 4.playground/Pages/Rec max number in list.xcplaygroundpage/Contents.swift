// Recursively count the elements of an array

func recursiveMaxNumber<T: Comparable>(list: [T]) -> T {
    if list.first == nil { return 0 as! T }
    
    let firstElement = list.first!
    let nextRecursion = recursiveMaxNumber(list: Array(list.dropFirst()))
    
    if firstElement > nextRecursion { return firstElement }
    else if nextRecursion > firstElement { return nextRecursion }
    else { return firstElement } // ¯\_(ツ)_/¯
}

let list0 = [5, 1, 6, 8, 22, 4]
let list1 = [5]
let list2: [Int] = []

recursiveMaxNumber(list: list0)
recursiveMaxNumber(list: list1)
recursiveMaxNumber(list: list2)
