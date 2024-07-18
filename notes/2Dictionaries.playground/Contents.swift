// INTRODUCTION

// dictionary with one key-value pair
var myDict1 = ["Mark Twain" : "An American novelist"]

// dictionary with an explicit data structure
var myDict2 : [String : String] = ["Mark Twain" : "An American novelist",
               "Novelist" : "someone who tells truthful lies"]

// dictionary with any type of value (useful for JSON payloads)
var myDict3 = [AnyHashable: Any]()

// three ways to declare dictionaries
var myDict4 = Dictionary<Int, String>()
var myDict5 = [Int: String]()
var myDict6:[Int: String] = [:]

// create a dictionary out of two arrays
let stateKeys = ["CA", "NV", "AZ"]
let stateValues = ["California", "Nevada", "Arizona"]
let stateDictionary = Dictionary(uniqueKeysWithValues:
                                    zip(stateKeys, stateValues))
print(stateDictionary)

// ACCESSING VALUES IN A DICTIONARY

// using optional wrapping for when absolutely sure a key exists
var myDict7 : [Int: String] = [1: "One", 2: "Two", 3: "Three"]
if let optValue = myDict7[4] {
    print(optValue)
} else {
    print("Key not found.")
}

// using forced unwrapping
let forcedValue = myDict7[3]!
print(forcedValue)

// iterate through a dictionary and return a key pair decomposed into named constants
for (key, value) in myDict7 {
    print("The value for \(key) is \(value)")
}

// Sort the dictionary by keys in ascending order
let sortedDict7 = myDict7.sorted(by: { $0.0 < $1.0 })

// $0.0 represents the key in each key-value pair.
for (key) in sortedDict7.map({ $0.0 }) {
    print("The key: \(key)")
}

// $0.1 represents the value in each key-value pair.
for (value) in sortedDict7.map({ $0.1 }) {
    print("The value: \(value)")
}

// ADD A VALUE TO A DICTIONARY

// Add a new element to a dictionary
myDict7.updateValue("Four", forKey: 4)

// Add a new element using subscript notation
myDict7[5] = "Five"

// REMOVE A VALUE FROM A DICTIOANRY

// Remove a value using the removeValue method
myDict7.removeValue(forKey: 1)

// Remove a value using subscript notation
myDict7[2] = nil

// BUILT-IN FUNCTIONS AND PROPERTIES

// isEmpty
// return boolean based on whether the dictionary is empty
print(myDict7.isEmpty)

// First
// return the first element of a dictionary
let myDict8 : [Int : String] = [1: "One", 2: "Two", 3: "Three"]
print(myDict8.first!)

// Count
// return the total number of elements in a dictionary
print(myDict7.count)

// Keys
// return all the keys inside a dictionary
print(Array(myDict7.keys))
let dict7Keys = Array(myDict7.keys)
print(dict7Keys)
