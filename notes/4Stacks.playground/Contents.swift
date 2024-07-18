// STACKS

// Stacks are last in first out (LIFO) data structures. The last object added to the stack is the first one out.

// Three methods that stacks implement:
// push() to add an element to the top
// pop() to remove the top element
// peek() to return the top element

// USING SWIFT WITH STACKS
import Foundation

// Our stack
public struct Stack<T> {
    // This array will hold this stack's values
    private var items: [T] = []
    
    // push method - O(1)
    mutating func push(element: T) {
        items.append(element)
    }
    
    // pop method
    mutating func pop() -> T? {
        return items.popLast()
    }
    
    // peek method
    func peek() -> T? {
        return items.last
    }
}

// make a stack
var stack = Stack<Int>()

// pushing
stack.push(element: 4)
print(stack)
stack.push(element: 8)
print(stack)
stack.push(element: 12)
print(stack)

// peeking
print(stack.peek()!)

// popping
var x = stack.pop()
print(x!)
x = stack.pop()
print(x!)

// many extensions can be added to stacks to improve its behavior and functionality

// see CustomStringConvertible, ExpressibleByArrayLiteral, IteratorProtocol, and Sequence

extension Stack: CustomStringConvertible {
    public var description: String {
        return items.description
    }
}
