// Selection sort

func selectionSort<T: Comparable>(list: [T]) -> [T] {
    guard list.count > 0 else { return [] }
    
    var originalList = list
    var result: [T] = []
    
    while originalList.count > 0 {
        var smallest = originalList.first! // cannot fail
        
        for element in originalList {
            if element < smallest {
                print("found new smallest: \(smallest)")
                smallest = element
            }
        }
        
        print("appending final smallest candidate: \(smallest)")
        result.append(smallest)
        
        originalList.removeAll(where: { $0 == smallest })
        print("originalList now has \(originalList.count) elements")
    }
    
    return result
}

let list0 = [5, 1, 6, 8, 22, 4]
let list1: [Int] = []
let list2 = [3]
let list3 = [1, 4, 5, 6, 8, 22]

selectionSort(list: list0)
selectionSort(list: list1)
selectionSort(list: list2)
selectionSort(list: list3)
