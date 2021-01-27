// Recursive binary search

typealias Index = Int

func recursiveBinarySearch<T: Comparable>(value: T, list: [T]) -> Index? {
    if list.count == 0 { return nil }
    
    let min = 0
    let max = list.count - 1
    
    let mid = (min + max) / 2
    print("mid is now \(mid)")
    
    if value > list[mid] {
        print("value is > than mid")
        guard let i = recursiveBinarySearch(value: value, list: Array(list[(mid + 1)...]))
        else { return nil }
        
        return mid + i + 1
    } else if value < list[mid] {
        print("value is < than mid")
        guard let i = recursiveBinarySearch(value: value, list: Array(list[...(mid - 1)]))
        else { return nil }
        
        return mid - i - 1
    } else {
        return mid
    }
}

let list0 = [1, 3, 5, 6, 7, 9, 10]
let list1 = [1, 3, 5, 7, 9, 10]
let list2: [Int] = []
let list3 = [6]
let list4 = [1, 2, 6]
let list5 = [1, 6]
let list6 = [6, 7]
let list7 = [6, 7, 8]

recursiveBinarySearch(value: 6, list: list0)
recursiveBinarySearch(value: 6, list: list1)
recursiveBinarySearch(value: 6, list: list2)
recursiveBinarySearch(value: 6, list: list3)
recursiveBinarySearch(value: 6, list: list4)
recursiveBinarySearch(value: 6, list: list5)
recursiveBinarySearch(value: 6, list: list6)
recursiveBinarySearch(value: 6, list: list7)
