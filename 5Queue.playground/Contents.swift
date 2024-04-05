// QUEUE
// First in, first out (FIFO) data structure, basically the opposite of a stack.
// enqueuing is when an element is added to a queue
// dequeuing is when an element is removed from a queue
// relevant methods include: enqueue(), dequeue(), peek(), count, clear(), isEmpty(), isFull()
// useful for point of sales in restaurants, single shared resources like printers, call centers, handling interrupts in real time systems, buffers on music players, etc.

// IMPLEMENTATION
import Foundation

// create a queue structure with a private array of Swift Generics with an empty T type array
public struct Queue<T> {
    private var data: [T] = []
    
    // Enqueue method
    public mutating func enqueue(element: T) {
        data.append(element)
    }
    
    // Dequeue method
    public mutating func dequeue() -> T? {
        return data.removeFirst()
    }
    
    // Peek method
    public func peek() -> T? {
        return data.first
    }
    
    // Clear
    public mutating func clear() {
        return data.removeAll()    }
    
    // Count
    public var count: Int {
        return data.count
    }
    
    // Capacity will be used for isFull() method
    public var capacity: Int {
        get {
            return data.capacity
        }
        set {
            data.reserveCapacity(newValue)
        }
    }
    
    // isFull method
    public func isFull() -> Bool {
        return count == data.capacity
    }
    
    // isEmpty() method
    public func isEmpty() -> Bool {
        return data.isEmpty
    }
}

var customQueue = Queue<Int>()

customQueue.enqueue(element: 1)
customQueue.enqueue(element: 2)
customQueue.enqueue(element: 3)
print(customQueue)

// improve the output -- the book doesn't seem to care
extension Queue: CustomStringConvertible {
    public var description: String {
        return data.description
    }
}

print(customQueue)
