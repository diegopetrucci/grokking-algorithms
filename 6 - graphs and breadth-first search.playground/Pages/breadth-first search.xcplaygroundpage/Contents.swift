// Graphs and breadth-first search

struct Node<Value: Equatable & Hashable> {
    var value: Value
    var edges: [Node<Value>]
}

extension Node: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
}

func search<Value: Equatable>(source: Node<Value>, destination: Node<Value>) -> [Node<Value>]? {
    guard source != destination else {
        print("initialNode and destination are the same!")
              return []
    }
    
    var queue = [source]
    
    typealias PreviousNode = Node<Value>
    var visited: [Node<Value>: PreviousNode] = [:]
    
    var path: [Node<Value>] = []
    
    print("queue now is \(queue.map(\.value))")
    
    while let first = queue.first {
        print("first is now \(first.value)")
        if first == destination {
            print("found! it's \(first)")
            path.append(first)
            var checking: Node<Value> = first
            
            while let prev = visited[checking] {
                print("found previous, appending \(prev.value)")
                path.append(prev)
                checking = prev
            }
            
            print("path is \(path.map(\.value))")
            
            return path.reversed()
        } else {
            print("else")
            if !visited.contains(where: { $1.value == first.value }) {
                print("adding the edges of \(first.value)")
                first.edges.forEach { edge in
                    if visited[edge] == nil {
                        print("added edge \(edge.value)")
                        visited[edge] = first
                        queue.append(edge)
                    } 
                }
            } else {
                print("visited[first] of \(first.value) is: \(visited[first]?.value)")
            }
            
            queue = Array(queue.dropFirst())
            
            print("queue now is \(queue.map(\.value))")
        }
    }
    
    return nil
}

let destination0 = Node(value: 8, edges: [])
let destination1 = Node(value: 99, edges: [])

let initialNode = Node(value: 5, edges: [.init(value: 3, edges: [destination0]), .init(value: 4, edges: [.init(value: 5, edges: [])])])

let s = search(source: initialNode, destination: destination0)!.map(\.value)
print("\n")
print("***")
print(s)
search(source: initialNode, destination: initialNode)
search(source: initialNode, destination: destination1)

extension Bool {
    var isFalse: Bool { !self }
}
