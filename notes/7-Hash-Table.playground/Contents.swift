// HASH TABLE

// Hash tables are like dictionaries but better i.e. they have O(1) efficiency, which is better than linear search operations at O(n). This efficiency makes hash tables ideal for databases with a growing set of data.

// Hash tables have two parts: index and value.

// CREATING A HASH TABLE

// ensure K conforms to hashable type
class HashElement<K: Hashable, V> {
    var key: K
    var value: V?
    
    init(key: K, value: V?) {
        self.key = key
        self.value = value
    }
}

// define a buck structure for using our tables
// buckets are a group of values, therefore we must define the size for our collection
class HashTable<K: Hashable, V> {
    typealias Bucket = [HashElement<K, V>]
    var buckets: [Bucket]
    
    init(capacity: Int) {
        assert(capacity > 0)
        buckets = Array<Bucket>(repeatElement([], count: capacity))
    }
    
    // function for calculating index
    func index(for key: K) -> Int {
        var divisor: Int = 0
        for key in String(describing: key).unicodeScalars {
            divisor += abs(Int(key.value.hashValue))
        }
        return abs(divisor) % buckets.count
    }

    // RETRIEVING DATA FROM A HASH TABLE
    func retrieveValue(for key: K) -> V? {
        let index = self.index(for: key)
        for element in buckets[index] {
            if element.key == key {
                return element.value
            }
        }
        // return nil if there is no value for our key
        return nil
    }
    
    // UPDATING A VALUE IN A HASH TABLE
    func updateValue(_ value: V, forKey key: K) -> V? {
        var itemIndex: Int
        itemIndex = self.index(for: key)
        for (i, element) in buckets[itemIndex].enumerated() {
            if element.key == key {
                let oldValue = element.value
                buckets[itemIndex][i].value = value
                return oldValue
            }
        }
        buckets[itemIndex].append(HashElement(key: key, value: value))
        return nil
    }
    
    // REMOVING A VALUE FROM A HASH TABLE
    func removeValue(forKey key: K) -> V? {
        let index = self.index(for: key)
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                buckets[index].remove(at: i)
                return element.value
            }
        }
        return nil
    }
}

