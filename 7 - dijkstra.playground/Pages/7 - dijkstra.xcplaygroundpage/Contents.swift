// Djkstra's algorithm for weighted graphs

struct Node {
    typealias Cost = Int
    
    var name: String
    var edges: [Node: Cost]
}

extension Node: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

func search(source: Node, destination: Node) -> [Node]? {
    guard source != destination else {
        print("initialNode and destination are the same!")
              return []
    }
    
    var costs: [Node: Int] = [:]
    costs[source] = 0
    costs[destination] = nil
    
    typealias Parent = Node
    var parents: [Node: Parent?] = [source: nil]
    
    var queue: [Node] = [source]
    
    var completed: [Node] = []
    
    while queue.isNotEmpty {
        let parent = queue
            .sorted(by: { costs[$0]! < costs[$1]! })
            .first!
        
        queue = Array(queue.dropFirst())
        
        if completed.contains(parent).isFalse {
        
            parent.edges.forEach { (node, cost) in
                print("node being evaluated: \(node.name) with parent \(parent.name)")
                
                // `node` was never evaluated
                if costs[node] == nil {
                    print("no cost found")
                    
                    parents[node] = parent
                    let parentCost = costs[parent]!
                    
                    costs[node] = parentCost + cost
                    print("setting cost of \(cost) + parent cost of \(parentCost)")
                } else {
                    // we've found an existing cost
                    print("found a cost of \(costs[node]!)")
                    
                    // is it bigger than the one we're evaluating?
                    parents[node] = parent
                    let newCost = costs[parent]! + cost
                    print("new cost would be \(newCost)")
                    
                    if costs[node]! > newCost {
                        // we update the cost and the parent
                        costs[node] = newCost
                        
                        print("setting cost of \(newCost)")
                    }
                }
                
                queue.append(node)
            }
            
            completed.append(parent)
        }
    }
    
    completed.forEach { print("name: \($0.name), cost: \(costs[$0])") }
    
    if completed.isNotEmpty {
        var resultList: [Node] = []
        var node = destination
        
        while node != source {
            let _parent = parents[node]!
            resultList.append(_parent!) // why is it a double optional?
            node = _parent!
        }
        
        return resultList.reversed()
    } else {
        // Didn't find any route
        return nil
    }
}

extension Array {
    var isNotEmpty: Bool { !self.isEmpty }
}

extension Bool {
    var isFalse: Bool { !self }
}

let destinationNode = Node(name: "Destination", edges: [:])
let nodeA = Node(
    name: "A",
    edges: [destinationNode: 1]
)
let nodeB = Node(name: "B", edges: [nodeA: 3, destinationNode: 5])
let sourceNode = Node(
    name: "Start",
    edges: [nodeA: 6, nodeB: 2 ]
)

print(search(source: sourceNode, destination: destinationNode)?
        .compactMap { $0 }
        .map(\.name))
