// The knapsack problem

typealias Pounds = Int
typealias Kilos = Int

struct Item {
    let cost: Pounds
    let weight: Kilos
}

func stealMaxValue(items: [Item], maxSize: Kilos) -> [Item] {
    var spaceLeft = maxSize
    var result: [Item] = []
    
    var remainingItems = items
    
    remainingItems.sort(by: { $0.weight > $1.weight })
    
    while remainingItems.isNotEmpty {
        let first = remainingItems.first!
        print("Evaluating \(first)")
        
        if first.weight <= spaceLeft {
            result.append(first)
            spaceLeft -= first.weight
            print("\n")
            print("Added \(first.cost) to knapsack, space left is \(spaceLeft)")
            print("\n")
        }
        
        remainingItems = Array(remainingItems.dropFirst())
    }
    
    return result
}

extension Array {
    var isNotEmpty: Bool { !self.isEmpty }
}

let items: [Item] = [
    .init(cost: 3000, weight: 30),
    .init(cost: 2000, weight: 20),
    .init(cost: 1500, weight: 15)
]

print(stealMaxValue(items: items, maxSize: 50).map(\.cost))
print(stealMaxValue(items: items, maxSize: 35).map(\.cost))
print(stealMaxValue(items: items, maxSize: 65).map(\.cost))
print(stealMaxValue(items: items, maxSize: 5).map(\.cost))

