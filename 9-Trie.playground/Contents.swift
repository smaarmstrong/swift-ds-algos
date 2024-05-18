// TRIE DATA STRUCTURE

// tree-based data structure that organizes information in a hierarchy
// used primarily with strings to enable finding stored words quickly

// WHY A TRIE?

// why use trie instead of hash
// - better worst-case time complexity
// - no key collisions
// - no hashing algorithm
// - it is alphabetically ordered

// with arrays time complexity is O(k*n)
// k = longest string
// n = number of words that need to be checked

// tries sidestep this issue by making each node represent a character

// HOW IT WORKS

// "she sells sea shells

//         root (no value)
//        /
//       s
//     / |
//    e  h
//   /|  |
//  a l  e
//    |  |
//    l  l
//    |  |
//    s  l
//       |
//       s

// IMPLEMENTATION

// the node
public class TrieNode<K: Hashable> {
    var value: K? // root does not hold a value hence it being declared optional
    weak var parent: TrieNode?
    var children: [K: TrieNode] = [:]
    var isFinal = false
    init(value: K? = nil, parent: TrieNode? = nil) {
        self.value = value
        self.parent = parent
    }
}

public class Trie {
    private let rootNode: TrieNode<Character>
    
    init() {
        rootNode = TrieNode<Character>() // char for an alphabetical written system
    }
    
    // INSERT
    func insert(word: String) {
        guard !word.isEmpty else { return }
        var curNode = rootNode
        let characters = Array(word.lowercased())
        var curIndex = 0
        while curIndex < characters.count {
            let character = characters[curIndex]
            if let child = curNode.children[character] {
                curNode = child
            } else {
                curNode.children[character] = TrieNode(value: character, parent: curNode)
                curNode = curNode.children[character]!
            }
            
            curIndex += 1
            
            if curIndex == characters.count {
                curNode.isFinal = true
            }
        }
    }
    
    // QUERY
    func query(word: String) -> Bool {
        let characters = Array(word.lowercased())
        var node : TrieNode? = rootNode
        for character in characters {
            node = node?.children[character]
            if node == nil {
                return false
            }
        }
        return node!.isFinal
    }
    
    // REMOVE
    func remove(word: String) {
        let characters = Array(word.lowercased())
        var node : TrieNode? = rootNode
        for character in characters {
            node = node?.children[character]
            if node == nil {
                return
            }
        }
        return node!.isFinal = false
    }
}

// TRYING IT OUT
var myTrie = Trie()
myTrie.insert(word: "code")
myTrie.insert(word: "comb")
print(myTrie.query(word: "code"))
myTrie.remove(word: "code")
print(myTrie.query(word: "code"))
