let numbers = [1,7,6,13,5,19,10,2,4,3]
let numbersSorted = numbers.sorted()

// search through a list, better than one each O(log n)
// important assumption: the list is sorted

// My implementation using recursion
func binarySearch<T: Comparable>(list: [T], value: T, range: Range<Int>) -> Int? {

    print("looking for \(value) in \(range)")
    
    // Are we already in a hopless case?
    if range.lowerBound >= range.upperBound {
        // search key not found
        return nil
    }
    
    // Find the midpoint
    let midIdx = range.lowerBound + ((range.upperBound - range.lowerBound) / 2)
    print(midIdx)
    let valueForIdx = list[midIdx]
    
    // keep going
    if value < valueForIdx {
        // left hand side
        return binarySearch(list: list, value: value, range: range.lowerBound ..< midIdx)
    } else if value > valueForIdx {
        // right hand side
        return binarySearch(list: list, value: value, range: midIdx+1 ..< range.upperBound)
    }
    
    // value == valueForIdx
    // it's a midpoint, so return it
    return midIdx
    
}

binarySearch(list: numbersSorted, value: 11, range: 0 ..< numbersSorted.count)
binarySearch(list: numbersSorted, value: 19, range: 0 ..< numbersSorted.count)




