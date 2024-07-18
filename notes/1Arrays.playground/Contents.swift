import UIKit

// INTRODUCTION

// one-dimensional array
// a = [a_0, a_1, ..., a_n]
// element can be accessed using a[i] where i is an index between 0 and n

// multi-dimensional array
// a = [ a_00, a_01, a_02
//       a_10, a_11, a_12 ]

// MAIN FEATURES

// arrays increase in size exponentially when adding a new element above the array's original capacity size, reflecting a geometric growth pattern
// manually increasing capacity size AKA "reserve capacity" is more efficient like so

var intArrayReserveCapacityIncreased = Array<Int>()

// Shows the array capacity
intArrayReserveCapacityIncreased.capacity
intArrayReserveCapacityIncreased.reserveCapacity(500)
intArrayReserveCapacityIncreased.capacity

// Create an array using full array syntax
var intArrayFull = Array<Int>()

// Create an array using shorthand syntax
var intArrayShort = [Int]()

// Use array literal declaration
var intLiteralArray: [Int] = [1, 2, 3]

// Use shorthand literal declaration
var intLiteralArrayShort = [1, 2, 3]

// Create an array with a default value i.e. [2, 2, 2, 2, 2]
var intLiteralArrayDefaultValue = [Int](repeating: 2, count: 5)

// RETRIEVING ELEMENTS FROM AN ARRAY

// Retrieval by index
var myIntArrayRetrieval = [1, 2, 3, 4, 5]
var retrievedNumber = myIntArrayRetrieval[2]
print(retrievedNumber)

// Retrieval through loop iteration
for element in myIntArrayRetrieval {
    print(element)
}

// ADDING ELEMENTS TO AN ARRAY

// Appending
var myIntArrayAddedElement = [1, 2, 3, 4, 5]
myIntArrayAddedElement.append(11)
print(myIntArrayAddedElement)

// Insertion
myIntArrayAddedElement.insert(12, at: 3)
print(myIntArrayAddedElement)

// REMOVING ELEMENTS FROM AN ARRAY

// 4 methods of removal
var intArrayRemoval = [Int](repeating: 7, count: 7)
intArrayRemoval.removeLast()
intArrayRemoval.removeFirst()
intArrayRemoval.remove(at: 1)
intArrayRemoval.removeAll()

// BUILT-IN FUNCTIONS AND PROPERTIES

// isEmpty
// This function returns true or false depending on whether the array is empty
let myIntArrayNotEmpty = [1, 3, 5, 6]
print(myIntArrayNotEmpty.isEmpty)

// First and Last
print(myIntArrayNotEmpty.first)
print(myIntArrayNotEmpty.last)
// "Optional(x)" because the array is not empty

// "nil" because it is an empty array from our removal functions earlier
print(intArrayRemoval.first)

// Reversed and Reverse

// use .reversed() to initialize new arrays with contents reversed
let reversedArray = Array(myIntArrayNotEmpty.reversed())
print(reversedArray)

var mutatedReversedArray = Array(myIntArrayNotEmpty.reversed())
print(mutatedReversedArray)

// print(mutatedReversedArray.reversed()) returns an object, so reverse() allows you reverse the contents itself
mutatedReversedArray.reverse()
print(mutatedReversedArray)

// Count
// return the total number of elements in an array
print(myIntArrayNotEmpty.count)
print(intArrayRemoval.count)

// AVOIDING INDEX ERRORS

var myIntArrayErrors = [1, 3, 5, 7]

// avoid the 'out of range' error thrown by this
// print(myIntArrayErrors[-1]

// if looking for a value without knowing the index, you can write something like this
if let index = myIntArrayErrors.firstIndex(of: 5) {
    print("found index: \(index)")
    let val = myIntArrayErrors.remove(at: index)
    print(val)
}
