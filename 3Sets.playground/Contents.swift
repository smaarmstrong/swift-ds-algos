// SETS

// An unordered collection of unique, non-nil elements that must conform to the Hashable protocol. Sets are always O(1).

// Full syntax declaration
var intSet = Set<Int>()

// Initialize a set from an array literal
var stringSet: Set = ["One", "Two", "Three"]

// ACCESSING, ADDING, AND REMOVING AN ELEMENT OF A SET
// ACCESSING AN ELEMENT

// accessing an element with for-in
for num in stringSet {
    print(num)
}

// ordered iteration
for num in stringSet.sorted() {
    print(num)
}

// check if an element exists
if stringSet.contains("One") {
    print("Element found")
} else {
    print("Element not found")
}

// ADDING AN ELEMENT

// Insert a new element
stringSet.insert("Four")
print(stringSet)

// REMOVING ELEMENTS

// remove an element
stringSet.remove("Four")

// remove an element in an index
if let idx = stringSet.firstIndex(of: "One") {
    stringSet.remove(at: idx)
}

// remove first
stringSet.removeFirst()

// remove all
stringSet.removeAll()

// SET OPERATIONS

// COMPARISON OPERATIONS
// UNION

// union(_:) and formUnion(_:) are methods for unions
// formUnion(_:) requires a set to be declared with var because it deletes all members of the first set when merging it into the second set

// union
let A: Set = [1, 3, 5, 7]
let B: Set = [0, 2, 4, 6]
print(A.union(B))

// INTERSECTION

// intersection(_:) and formIntersection(_:) are methods for creating new sets based on elements shared in common
// formIntersection(_:) is similar to formUnion(_:)

// intersect...
let C: Set = [1, 2, 3, 4, 5]
let D: Set = [0, 2, 4, 6, 8]
print(C.intersection(D))

// SUBTRACTING
// subtracting(_:) and subtract(_:) are methods for substraction

// subtract
var E: Set = [1, 3, 5, 7, 9]
var F: Set = [0, 3, 7, 6, 8]
print(A.subtracting(B))

// SYMMETRIC DIFFERENCE
// all the elements that sets have except those in common

// symmetricDifference(_:) and formSymmetricDifference(_:) are the methods for symmetric difference
var G: Set = [1, 2, 3, 4, 5]
var H: Set = [0, 2, 4, 6, 8]
print(A.symmetricDifference(B))

// MEMBERSHIP AND EQUALITY OPERATIONS

// SET EQUALITY
// sets are considered to be equal if they have exactly the same values; order does not matter

// set equality
let I: Set = [2, 4, 6, 8, 10]
let J: Set = [0, 3, 7, 6, 8]
let K: Set = [10, 8, 6, 4, 2, 6]

if I == J {
    print("I and J are equal")
} else {
    print("I and J are different")
}

if I == K {
    print("I and K are equal")
} else {
    print("I and K are different")
}

// SET MEMBERSHIP
// we can determine the relationship between two sets through five methods
// isSubset(of:) - are the values of a set contained in a specific set?
// isStrictSubset(of:) - is a set a subset but not equal to the specified set?
// isSuperset(of:) - does a set contain all the values of the specified set?
// isStrictSuperset(of:) - is a set a superset, but not equal to the specified set?
// isDisjoint(with:) do the two sets have the same values in common?

// set membership
let L: Set = [2, 4, 6, 8, 10]
let M: Set = [0, 4, 2, 6, 7, 9, 10, 8]

print("isSubset:", L.isSubset(of: M))
print("isSuperset:", L.isSuperset(of: M))
print("isStrictSubset:", L.isStrictSubset(of: M))
print("isDisjointWith", L.isDisjoint(with: M))
