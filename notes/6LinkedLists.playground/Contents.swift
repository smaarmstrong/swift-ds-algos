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

// SINGLY LINKED LIST

public class SinglyLinkedList<listType> {
    public var head: Node<listType>?
    public var tail: Node<listType>?
    
    // checks whether the LinkedList is empty or not
    public var isEmpty: Bool {
        return head == nil
    }
}
extension SinglyLinkedList: CustomStringConvertible {
    public var description: String{
        
        // guard means only execute if that condition is true
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}

// ADDING NEW VALUES TO A LINKED LIST

// append - new value added to the end of the list
// insert(value:, index:) insert an element at a necessary position

// APPEND

public class SinglyLinkedList2<listType> {
    public var head: Node<listType>?
    public var tail: Node<listType>?
    
    // checks whether the LinkedList is empty or not
    public var isEmpty: Bool {
        return head == nil
    }
    
    public func append(value: listType) {
        let newNode = Node(value: value)
        if var h = head {
            while h.next != nil {
                h = h.next!
            }
            h.next = newNode
        } else {
            head = newNode
        }
    }
}
extension SinglyLinkedList2: CustomStringConvertible {
    public var description: String{
        
        // guard means only execute if that condition is true
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}

var newList = SinglyLinkedList2<Int>()
newList.append(value: 2)
newList.append(value: 4)
newList.append(value: 6)
newList.append(value: 8)
print(newList)

// INSERT

public class SinglyLinkedList3<listType> {
    public var head: Node<listType>?
    public var tail: Node<listType>?
    
    // checks whether the LinkedList is empty or not
    public var isEmpty: Bool {
        return head == nil
    }
    
    public func append(value: listType) {
        let newNode = Node(value: value)
        if var h = head {
            while h.next != nil {
                h = h.next!
            }
            h.next = newNode
        } else {
            head = newNode
        }
    }
    
    func insert(value : listType, index : Int) {
        let newNode = Node(value: value)
        
        if (index == 0) {
            newNode.next = head
            head = newNode
        } else {
            var prev = head
            var cur = head
            // what's going on with the syntax in the next four lines?
            for _ in 0..<index {
                prev = cur
                cur = cur?.next
            }
            newNode.next = prev?.next
            prev?.next = newNode
        }
    }
}
extension SinglyLinkedList3: CustomStringConvertible {
    public var description: String{
        
        // guard means only execute if that condition is true
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}

// REMOVING NEW VALUES FROM A LINKED LIST

// removeLast - removes values from the end of the list
// remove(at:) - removes values from anywhere in a list

// removeLast

public class SinglyLinkedList4<listType> {
    public var head: Node<listType>?
    public var tail: Node<listType>?
    
    // checks whether the LinkedList is empty or not
    public var isEmpty: Bool {
        return head == nil
    }
    
    public func append(value: listType) {
        let newNode = Node(value: value)
        if var h = head {
            while h.next != nil {
                h = h.next!
            }
            h.next = newNode
        } else {
            head = newNode
        }
    }
    
    func insert(value : listType, index : Int) {
        let newNode = Node(value: value)
        
        if (index == 0) {
            newNode.next = head
            head = newNode
        } else {
            var prev = head
            var cur = head
            // what's going on with the syntax in the next four lines?
            for _ in 0..<index {
                prev = cur
                cur = cur?.next
            }
            newNode.next = prev?.next
            prev?.next = newNode
        }
        
        func removeLast() -> listType? {
            // check if the head is nil
            if let h = head {
                
                // check if the list consists of one node
                // remove the one node inside defer
                if h.next == nil {
                    defer {
                        head = nil
                        tail = nil
                    }
                    return h.value
                }
                
                // search for the next node until curr.next is nil
                var prev = h
                var curr = h
                while let next = curr.next {
                    prev = curr
                    curr = next
                }
                prev.next = nil
                tail = prev
                return curr.value
                
            } else {
                return nil
            }
        }
    }
}
extension SinglyLinkedList4: CustomStringConvertible {
    public var description: String{
        
        // guard means only execute if that condition is true
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}

// remove(at:)

public class SinglyLinkedList5<listType> {
    public var head: Node<listType>?
    public var tail: Node<listType>?
    
    // checks whether the LinkedList is empty or not
    public var isEmpty: Bool {
        return head == nil
    }
    
    public func append(value: listType) {
        let newNode = Node(value: value)
        if var h = head {
            while h.next != nil {
                h = h.next!
            }
            h.next = newNode
        } else {
            head = newNode
        }
    }
    
    func insert(value : listType, index : Int) {
        let newNode = Node(value: value)
        
        if (index == 0) {
            newNode.next = head
            head = newNode
        } else {
            var prev = head
            var cur = head
            // what's going on with the syntax in the next four lines?
            for _ in 0..<index {
                prev = cur
                cur = cur?.next
            }
            newNode.next = prev?.next
            prev?.next = newNode
        }
        
        func removeLast() -> listType? {
            // check if the head is nil
            if let h = head {
                
                // check if the list consists of one node
                // remove the one node inside defer
                if h.next == nil {
                    defer {
                        head = nil
                        tail = nil
                    }
                    return h.value
                }
                
                // search for the next node until curr.next is nil
                var prev = h
                var curr = h
                while let next = curr.next {
                    prev = curr
                    curr = next
                }
                prev.next = nil
                tail = prev
                return curr.value
                
            } else {
                return nil
            }
        }
        func remove(at position: Int) {
            
            // 1. check if the head is nil; then there is nothing to remove
            if head == nil {
                return
            }
            
            // create an instance of the head
            var h = head
            
            // if the position is 0, remove the head and set the next value to the head
            if (position == 0) {
                head = h?.next
                return
            }
            // loop from 0 to position by assigning head
            for _ in 0..<position-1 where h != nil {
                h = h?.next
            }
            if h == nil || h?.next == nil {
                return
            }
            let nextToNextNode = h?.next?.next
            h?.next = nextToNextNode
        }
    }
}
extension SinglyLinkedList5: CustomStringConvertible {
    public var description: String{
        
        // guard means only execute if that condition is true
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}

// DOUBLY LINKED LIST

// First, let's make the double nodes.

public class DoubleNode<nodeType> {
    var value: nodeType
    var next: DoubleNode<nodeType>?
    weak var previous: DoubleNode<nodeType>?
    
    init(value: nodeType) {
        self.value = value
    }
}

extension DoubleNode: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
    return "\(value) -> " + String(describing: next) + " " }
}

// Now here's a basic DoublyLinkedList class.

public class DoublyLinkedList<listType> {
    var head: DoubleNode<listType>?
    private var tail: DoubleNode<listType>?
    
    public var isEmpty: Bool {
        return head == nil
    }
    public func nodeAt(index: Int) -> DoubleNode<listType>? {
        if index >= 0 {
            var node = head
            var i = index
            while node != nil {
                if i == 0 { return node }
                i -= 1
                node = node!.next
            }
        }
        return nil
    }
    
    // APPEND
    func insert(node: DoubleNode<listType>, at index: Int) {
        if index == 0,
           tail == nil {
            head = node
            tail = node
        } else {
            guard let nodeAtIndex = nodeAt(index: index) else {
                print("Index out of bounds.")
                return
            }
            if nodeAtIndex.previous == nil {
                head = node
            }
            node.previous = nodeAtIndex.previous
            nodeAtIndex.previous?.next = node
            
            node.next = nodeAtIndex
            nodeAtIndex.previous = node
        }
    }
    
    // REMOVE NODE METHOD
    public func remove(node: DoubleNode<listType>) -> listType {
        let previousNode = node.previous
        let nextNode = node.next
        
        if let prev = previousNode {
            prev.next = nextNode
        } else {
            head = nextNode
        }
        nextNode?.previous = previousNode
        
        if nextNode == nil {
            tail = previousNode
        }
        
        node.previous = nil
        node.next = nil
        
        return node.value
    }
    
    // REMOVE(at:)
    func remove(at index: Int) {
        var toDeleteNode = nodeAt(index: index)
        guard toDeleteNode != nil else {
            print("Index out of bounds.")
            return
        }
        
        let previousNode = toDeleteNode?.previous
        let nextNode = toDeleteNode?.next
        
        if previousNode == nil {
            head = nextNode
        }
        
        if toDeleteNode?.next == nil {
            tail = previousNode
        }
        
        previousNode?.next = nextNode
        nextNode?.previous = previousNode
        
        toDeleteNode = nil
    }

}
