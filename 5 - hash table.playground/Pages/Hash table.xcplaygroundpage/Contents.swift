// Hash table

final class Node<V> {
    var value: V
    var key: String
    var next: Node?
    
    init(value: V, key: String, next: Node? = nil) {
//    init(value: V, key: String) {
        self.value = value
        self.key = key
        self.next = next
    }
}

final class HashTable<V> {
    var buckets: [Node<V>?]
    
    init(size: Int) {
        buckets = Array(repeating: nil, count: size)
    }
    
    func store(value: V, key: String) {
        let hashValue = hash(key: key)
        
        // If we find a node / linked list
        if let node = buckets[hashValue] {
            // Iterate through the list until the end is found
            var n = node
            while n.next != nil {
                n = n.next! // Just checked, can't fail
            }
            
            print("found a list, inserting \(key) at the end")
            n.next = .init(value: value, key: key)
        } else {
            // There's no existing node
            print("no node found, inserting")
            buckets[hashValue] = .init(value: value, key: key)
        }
    }
    
    func retrieve(key: String) -> Node<V>? {
        let hashValue = hash(key: key)
        
        // If we find a node / linked list
        if let node = buckets[hashValue] {
            // Iterate through the list until the the value is found
            var n = node
            while n.next != nil && n.key != key {
                n = n.next! // Just checked, can't fail
            }
            
            if n.key == key {
                print("n.key is \(n.key) and key is \(key)")
                return n
            }
            else {
                print("no node found with key \(key)")
                return nil
            }
        } else {
            // No node
            print("no node found")
            return nil
        }
    }
    
    // Deletion does not work ¯\_(ツ)_/¯
    func delete(key: String) {
        let hashValue = hash(key: key)
        
        // Iterate through the list until the the value is found
        var node = buckets[hashValue]
        while node?.next != nil && node?.key != key {
            node = node?.next
        }
        
        print("currentNode is \(node?.key)")
        print("next is \(node?.next?.key)")
        if node?.key == key {
            print("removing key \(key)…")
            print("with next key of \(node?.next?.key)")
            node = node?.next
            dump(buckets[hashValue])
        }
    }
    
    /// A simple (and not O(i)) hashing function
    private func hash(key: String) -> Int {
        key.unicodeScalars
            .map { $0 }
            .reduce(0) { (result: Int, scalar: Unicode.Scalar) -> Int in
                return (result + Int(scalar.value)) % buckets.count
            }
    }
}

let table = HashTable<Int>(size: 1)
table.store(value: 5, key: "Five")
table.retrieve(key: "Five")
table.delete(key: "Five")
table.store(value: 7, key: "Seven")
table.store(value: 2, key: "Two")
table.buckets
table.retrieve(key: "Five")?.value
table.retrieve(key: "Two")?.value
table.retrieve(key: "One")
table.delete(key: "Two")
table.retrieve(key: "Two")?.value
table.retrieve(key: "Five")?.value
table.retrieve(key: "Two")?.value
