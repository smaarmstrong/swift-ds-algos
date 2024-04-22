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
