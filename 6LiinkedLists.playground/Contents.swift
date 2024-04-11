// LINKED LISTS

// data structure that represents a sequence of nodes linked to each other
// their main advantage is quick insertion and deletion
// linear like arrays, but not stored in a contiguous location

// IMPLEMENTATION

// Do NOT use value types like structures to create linked lists.
// Capturing self for value types is dangerous because it can cause memory leaks, runtime errors, logical errors, race conditions, data inconsistencies, etc.

// Instead, use classes; as reference types, they are safer.
// Also, use access specifiers to achieve abstraction.

// NODE

// create a node class with swift generics for flexibility
public class Node<nodeType> {
    public var value : nodeType
    public var next : Node?
    
    public init(value: nodeType) {
        self.value = value
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}
