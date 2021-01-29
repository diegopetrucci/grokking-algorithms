// Quick sort

func quickSort<T: Comparable>(list: [T]) -> [T] {
    if list.count == 0 { return [] }
    if list.count == 1 { return list }
    
    if list.count == 2 {
        if list[0] < list[1] { return list }
        else { return [list[1], list[0]] }
    }
    
    let pivotIndex = Int.random(in: 0 ..< list.count)
    let pivot = list[pivotIndex]
    print("pivot is: \(pivot)")
    
    var leftSide: [T] = []
    var rightSide: [T] = []
    
    var newList = list
    newList.remove(at: pivotIndex)
    
    while newList.count > 0 {
        if newList.first! > pivot { rightSide.append(newList.first!) }
        if newList.first! < pivot { leftSide.append(newList.first!) }
        newList = Array(newList.dropFirst())
    }
    
    print("leftSide: \(leftSide)")
    print("rightSide: \(rightSide)")
    
    return quickSort(list: leftSide) + [pivot] + quickSort(list: rightSide)
}

let list0 = [1, 5, 22, 3, 60, 6, 2, 9, 10]
let list1 = [1, 5, 22, 3, 60, 6, 2, 9]
let list2: [Int] = []
let list3 = [6]
let list4 = [1, 2, 6]
let list5 = [1, 6]

quickSort(list: list0)
quickSort(list: list1)
quickSort(list: list2)
quickSort(list: list3)
quickSort(list: list4)
quickSort(list: list5)
