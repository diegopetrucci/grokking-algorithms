// The knapsack problem

typealias Pounds = Int
typealias Kilos = Int

struct Item: Equatable {
    let cost: Pounds
    let weight: Kilos
}

typealias SpaceConfig = [Kilos: [Item]]


func maxValue(for items: [Item], at targetSpace: Kilos, spaceConfig: inout SpaceConfig) {
    if let existingItems = spaceConfig[targetSpace] {
        let existingBestValue = existingItems.reduce(0, { value, item -> Pounds in
            return value + item.cost
        })
        
        let itemsCost = items.reduce(0, { sum, i -> Int in sum + i.cost })
        
        print("existing best value is \(existingBestValue)")
        if itemsCost > existingBestValue {
            spaceConfig[targetSpace] = items
        } else {
            spaceConfig[targetSpace] = existingItems
        }
    } else {
        spaceConfig[targetSpace] = items
    }
}

var spaceConfig0 = [
    10: [Item(cost: 5, weight: 7), Item(cost: 6, weight: 3)]
]
var spaceConfig1 = [
    10: [Item(cost: 5, weight: 7), Item(cost: 4, weight: 3)]
]

maxValue(for: [.init(cost: 10, weight: 10)], at: 10, spaceConfig: &spaceConfig0)
spaceConfig0[10]
maxValue(for: [.init(cost: 10, weight: 10)], at: 10, spaceConfig: &spaceConfig1)
spaceConfig1[10]
maxValue(for: [.init(cost: 10, weight: 10)], at: 3, spaceConfig: &spaceConfig1)
spaceConfig1[3]

func setConfig(from item: Item, targetSpace: Kilos, spaceConfig: inout SpaceConfig) {
    Array(0...targetSpace).forEach { evaluatedSize in
        print("evaluating weight \(evaluatedSize)")
        
        print("item weight is \(item.weight)")
        if item.weight < evaluatedSize {
            let weightDifference = evaluatedSize - item.weight
            if let itemsAtDifference = spaceConfig[weightDifference] {
                if !itemsAtDifference.contains(where: { $0 == item }) {
                    maxValue(
                        for: [item] + itemsAtDifference,
                        at: evaluatedSize,
                        spaceConfig: &spaceConfig
                    )
                }
            } else {
                // (TODO) We could assign it directly because theoretically we have no bigger items
                maxValue(for: [item], at: evaluatedSize, spaceConfig: &spaceConfig)
            }
        } else if item.weight == evaluatedSize {
            print("==")
            maxValue(for: [item], at: evaluatedSize, spaceConfig: &spaceConfig)
        }
    }
}

func stealMaxValue(items: [Item], targetSpace: Kilos) -> [Item]? {
    var spaceConfig: [Kilos: [Item]] = [:]
    
    let itemsSortedByWeight = items.sorted(by: { $0.weight < $1.weight })
    
    itemsSortedByWeight.forEach { item in
        setConfig(from: item, targetSpace: targetSpace, spaceConfig: &spaceConfig)
    }
    
    return spaceConfig[targetSpace]
}

let item0 = Item(cost: 5, weight: 5)
let item1 = Item(cost: 6, weight: 6)
let item2 = Item(cost: 3, weight: 3)

stealMaxValue(items: [item0], targetSpace: 5)
stealMaxValue(items: [item0, item1], targetSpace: 11)
stealMaxValue(items: [item0, item1], targetSpace: 10)
stealMaxValue(items: [item0, item1], targetSpace: 3)
stealMaxValue(items: [item0, item1, item2], targetSpace: 3)
stealMaxValue(items: [item0, item1, item2], targetSpace: 14)
