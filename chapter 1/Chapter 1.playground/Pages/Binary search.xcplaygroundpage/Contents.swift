// Binary search

typealias ElementIndex = Int

func binarySearch<T: Comparable>(value: T, list: [T]) -> ElementIndex? {
    var lowPoint = 0
    var highPoint = list.count - 1
    
    while lowPoint <= highPoint {
        let midPoint = (highPoint + lowPoint) / 2
        print("midPoint is now: \(midPoint)")
        
        if list[midPoint] < value {
            lowPoint = midPoint + 1
            print("lowPoint is now: \(lowPoint)")
        } else if list[midPoint] > value {
            highPoint = midPoint - 1
            print("highPoint is now: \(highPoint)")
        } else {
            print("\nFound at index \(midPoint)!\n")
            return midPoint
        }
    }
    
    print("\nNot found!\n")
    return nil
}

let list0 = [1, 3, 5, 6, 7, 9, 10]
let list1 = [1, 3, 5, 7, 9, 10]
let list2: [Int] = []
let list3 = [6]
let list4 = [1, 2, 6]
let list5 = [1, 6]
let list6 = [6, 7]
let list7 = [6, 7, 8]

binarySearch(value: 6, list: list0)
binarySearch(value: 6, list: list1)
binarySearch(value: 6, list: list2)
binarySearch(value: 6, list: list3)
binarySearch(value: 6, list: list4)
binarySearch(value: 6, list: list5)
binarySearch(value: 6, list: list6)
binarySearch(value: 6, list: list7)
