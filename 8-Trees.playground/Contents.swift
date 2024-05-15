// TREES

// nonlinear data structure with hierarchy
// like an upside down tree where the top node called "root" is at the top
// the root is "level 0"
// every node must have a node or a leaf
// every dead end is a "leaf" i.e. a childless node

// level 0: root
// level 1: n1, n2
// level 2: n1_n1, n1_l1, n1_l2, n2_l1, n2_l2
// level 3: n1_n1_l1

// degree: total number of children in a node
// siblings: nodes with the same parents

// TREE APPLICATIONS

// manipulate hierarchical data
// make information easy to search
// manipulate sorted lists of data
// workflow for compositing digital images for visual effects
// router algorithms
// form of multi-stage decision making

// CREATION

class Node<T: Equatable> {
    var data: T
    weak var parent: Node?
    
    // needs to be array because nodes can have multiple children
    var children: [Node] = []
    
    init(data: T) {
        self.data = data
    }
    
    func printNodeData() -> [String] {
        return ["\(self.data)"] + self.children.flatMap{$0.printNodeData()}.map{"  "+$0}
    }
    
    func printTree() {
        let text = printNodeData().joined(separator: "\n")
        print(text)
    }
    
    // INSERTION
    func add(child: Node) {
        children.append(child)
        child.parent = self
    }
    
    // SEARCHING DATA
    func search(element: T) -> Node? {
        if element == self.data {
            return self
        }
        for child in children {
            if let result = child.search(element: element) {
                return result
            }
        }
        return nil
    }
}

// testing insertion
let drinks = Node(data: "Drinks")
let type1 = Node<String>(data: "Cold")
let type2 = Node<String>(data: "Hot")
drinks.add(child: type1)
drinks.add(child: type2)
type2.add(child: Node(data: "Latte"))
type1.add(child: Node(data: "Cola"))
type1.add(child: Node(data: "Fanta"))

drinks.printTree()

// testing searching
let latte = drinks.search(element: "Latte")

if let result = latte {
    result.printTree()
}
