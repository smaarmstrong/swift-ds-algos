// BINARY TREE

// Tree data structures in which each node has at most two children.

// BINARY TREE PRIMER

// Node depth - the number of edges from the node to the root node. Root depth is 0.
// Node height - the number of edges on the longest path from the node to a leaf. Leaf height is 0.
// Tree height - from the root node to the farthest leaf.

// PROPERTIES OF BINARY TREES

// 1. The maximum number of nodes at level "i" of the binary tree is 2^(i-1)
// The level in the root is 1 -> 2^(1-1) = 1. Due to the fact that every node has at most
// two children, the next level has twice the nodes, 2*2^(i-1).

// 2. If the height of the binary tree is "h", the maximum number of nodes is 2h-1. 
// The height of a tree is the maximum number of nodes on the root to the leaf path.

// 3. The number of leaf nodes is always one more than the nodes with two children in a
// binary tree where every node has zero or two children.

// TYPES OF BINARY TREES

// 1. Full binary tree - each node has zero or two children, but not one.
// 2. Perfect binary tree - all nodes have two children and the same depth.
// 3. Complete binary tree - all levels are completely filled except the last level,
// but in which the existing nodes are in the left side of the tree.
// 4. Balanced binary tree - each leaf is "not more than a certain distance"
// from the root node than any other leaf.

// TREE TRAVERSAL AKA TREE SEARCH

// Tree traversal is the process of checking or updating each node
// in a tree data structure once.

// Three ways of tree traversal: in-order, pre-order, and post-order.

// IMPLEMENTATION

// We need a key/value for a data container
// References to the left and right children nodes
// A reference to a parent node

class BTNode<T> {
    var value: T
    var leftChild: BTNode<T>?
    var rightChild: BTNode<T>?
    
    init(_ value: T,_ leftChild: BTNode?,_ rightChild: BTNode?) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
    
    // IN-ORDER TRAVERSAL
    func inOrderTraversal(_ btNode: BTNode<T>?) {
        guard let _ = btNode else { return }
        self.inOrderTraversal(btNode?.leftChild)
        print("\(btNode!.value)", terminator: " ")
        self.inOrderTraversal(btNode?.rightChild)
    }
    
    // PRE-ORDER TRAVERSAL
    func preOrderTraversal(_ btNode: BTNode<T>?) {
        guard let _ = btNode else { return }
        print("\(btNode!.value)", terminator: " ")
        self.preOrderTraversal(btNode?.leftChild)
        self.preOrderTraversal(btNode?.rightChild)
    }
    
    // POST-ORDER TRAVERSAL
    func postOrderTraversal(_ btNode: BTNode<T>?) {
        guard let _ = btNode else { return }
        self.postOrderTraversal(btNode?.leftChild)
        self.postOrderTraversal(btNode?.rightChild)
        print("\(btNode!.value)", terminator: " ")
    }
}

// TESTING IMPLEMENTATION

// Create binary tree
let node3 = BTNode(3, nil, nil)
let node12 = BTNode(12, nil, nil)
let node17 = BTNode(17, nil, nil)
let node28 = BTNode(28, nil, nil)
let node9 = BTNode(9, node3, node12)
let node23 = BTNode(23, node17, node28)
let root = BTNode(15, node9, node23)
let t = BTNode(0, nil, nil)

// Call traversal functions
t.inOrderTraversal(root)
t.preOrderTraversal(root)
t.postOrderTraversal(root)
