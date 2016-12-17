import Foundation

// Dictionary (Hash Table) implementation
// Uses an array to store values by key.
// Hashes the key to calculate the array index. Keys must conform to 'Hashable'.
// Collissions handled by using and itemBag (so in an array slot, we don't store items directly, we instead store an itemBag that can have multiple items).
// Collissions more likely the smaller the array.

// Desired Operations
// myDict["gamerName"] = "Joe"   // for a new item
// var g = myDict["gamerName"]   // fetch
// myDict["gamerName"] = "Pete"  // update
// myDict["gamerName"] = nil     // remove or clear

/**
 A Dictionary Implementation (using a hash table)
 */
public class Dict<Key: Hashable, Value>: CustomStringConvertible {
    // Create a 'storedItem' type to hold values
    private typealias StoredItem = (key: Key, value: Value)
    // And the itemBag to hold more than one item
    private typealias ItemBag = [StoredItem]
    // And the actual Dict (notice this is an actual var)!
    private var allItems: [ItemBag]
    
    // Let's keep a count property going
    private(set) public var count = 0
    
    // And a helper property for when we're empty
    public var isEmpty: Bool {
        return count == 0
    }
    
    // Pretty print for the class (shows the dictionary / hash table)
    public var description: String {
        let pairs = allItems.flatMap { b in b.map { e in "\(e.key) = \(e.value)" } }
        let pairsJoined = pairs.joined(separator: ", ")
        return "* * * * * * \nmyDict: \(pairsJoined)\n^ ^ ^ ^ ^ ^"
    }
    
    /**
     Calculates the index from a key (by hashing the key modulus the capacity - to keep the number within capacity!)
     */
    private func indexForKey(key:Key) -> Int {
        // Note this uses the "capacity" and not the count of items already saved!
        return abs(key.hashValue) % allItems.count
    }
    
    // Let's use a Swift subscript function for individual item access
    public subscript(key:Key) -> Value? {
        get {
            // we're reading
            return getValue(key:key)
        }
        set {
            if let value = newValue {
                // We're setting or updating
                setValue(key:key, value:value)
            } else {
                // We're clearing/deleting
                clearValue(key: key)
            }
        }
    }
    
    /**
     Gets an entry for the given 'key' and returns its value (or nil)
     */
    public func getValue(key:Key) -> Value? {
        let idx = self.indexForKey(key:key)
        let theItemBag = self.allItems[idx]
        // Loop through the matching bag looking for the item
        for storedItem in theItemBag {
            if storedItem.key == key {
                return storedItem.value
            }
        }
        // No match
        return nil
    }
    
    /**
     Set the value for a given 'key' (updating if the key is found already)
     */
    @discardableResult public func setValue(key:Key, value:Value) -> Value? {
        let idx = self.indexForKey(key:key)
        let theItemBag = self.allItems[idx]
        
        print("setValue: \(key)=\(value)")

        // Loop through the matching bag looking for the item
        for (itemIdx, storedItem) in theItemBag.enumerated() {
            print("Comparing with: \(storedItem.key)")
            if storedItem.key == key {
                // Found this key already, so we update
                allItems[idx][itemIdx].value = value
                return value
            }
        }
        
        // ASSERT: We did not find the key already
        
        // Add as a new item and increase the count
        allItems[idx].append((key,value))
        count += 1
        return value
    }
    
    /**
     Clear the value for a given 'key' (removes the key alltogether)
     */
    @discardableResult public func clearValue(key:Key) -> Value? {
        let idx = self.indexForKey(key:key)
        let theItemBag = self.allItems[idx]
        
        print("clearValue: \(key)")
        
        // Loop through the matching bag looking for the item
        for (itemIdx, storedItem) in theItemBag.enumerated() {
            print("Comparing with: \(storedItem.key)")
            if storedItem.key == key {
                // Found this key already, so we update
                allItems[idx].remove(at: itemIdx)
                count -= 1
                return storedItem.value
            }
        }
        
        // ASSERT: We did not find the key already, so nothing to clear!
        
        return nil
    }
    
    // And our initializer, note it can fail! (init?)
    public init?(capacity:Int) {
        if capacity <= 0 {
            return nil
        }
        // Initialize it, all values with an empty array to save us work!
        self.allItems = Array<ItemBag>(repeatElement([], count: capacity))
        
    }
    
}

/**
 An inline func to test our class
 */
private func testTheClass() {
    // Test the init at 0:
    if let _ = Dict<String, Int>(capacity:0) {
        // We'll never be here...
    } else {
        print("Initializing to 0 returns nil!")
    }
    
    print("Creating a good one...")
    
    guard let myDict = Dict<String, Any>(capacity:10) else {
        return
    }
    
    print("Initial count = \(myDict.count)")
    print("Are we empty? \(myDict.isEmpty ? "YES":"NO")")
    print("Testing add & update...")
    myDict["name"] = "Eric"
    myDict["age"] = 99
    print("Reading 'name' back -> \(myDict["name"])")
    print("Reading 'age' back -> \(myDict["age"])")
    print(myDict)
    myDict["name"] = "Bob"
    print("Reading 'name' back -> \(myDict["name"])")
    print("Reading 'age' back -> \(myDict["age"])")
    print(myDict)
    print("Clearing 'name'...")
    myDict["name"] = nil
    print("Reading 'name' back -> \(myDict["name"])")
    print("Reading 'age' back -> \(myDict["age"])")
    print(myDict)
    myDict["age"] = nil
    print(myDict)
    
}

// Fire it off...
testTheClass()


