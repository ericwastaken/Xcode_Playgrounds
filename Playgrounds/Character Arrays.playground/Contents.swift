// Character arrays

public func indexOf(find: String, inString: String) -> Int {
    let findChars: [Character] = Array(find.lowercased().characters)
    let findString: [Character] = Array(inString.lowercased().characters)
    
    // If we have more characters to find than the string, then we can't match
    if findChars.count > findString.count {
        return -1
    }
    
    // ASSERT: We have a match count <= string count
    
    var stringPos = -1
    var found = false
    
    for stringIdx in 0..<findString.count {
        // Reset our position to 'next'
        stringPos = stringIdx
        // Optimistic match? Inner loop will set to false right away if not!
        found = true
        for patternIdx in 0..<findChars.count {
            if findChars[patternIdx] != findString[stringPos] {
                // No match, so we can't match. Move on.
                found = false
                break
            } else {
                // Increment string pos so we look at "next" for both arrays
                stringPos += 1
            }
        }
        // With the inner loop done, did we find the entire pattern? Did we loop through the entire findChars without a single mismatch?
        if found {
            return stringIdx // where the pattern match STARTED
        }
    }
    
    // Finally, no match... we're done checking the outer array!
    return -1
}

let aString = "Hello World"
let findString = "orl"
let match = indexOf(find:findString, inString:aString)
