// QuickSort
// Recursive split into 2 from a pivot
// Running time
// At all levels, you look at N (even in subtrees, you look at all the numbers)
// Splitting in half each time is logN (height of the tree also)
// So total is N * logN


import Foundation

public func quickSort(_ unsortedArray:[Int]) -> [Int] {
    // First, are we down to 1
    if unsortedArray.count <= 1 {
        return unsortedArray
    }
    
    // Now, find out pivot (the halfway point)
    let pivotPoint = unsortedArray.count / 2 // integer math
    let pivotValue = unsortedArray[pivotPoint]
    
    // Split off into less and greater arrays
    let lessArray = unsortedArray.filter { $0 < pivotValue }
    let equalArray = unsortedArray.filter { $0 == pivotValue }
    let greaterArray = unsortedArray.filter { $0 > pivotValue }
    
    // Now the sort is the sort("less") + equal + sort("greater")
    return quickSort(lessArray) + equalArray + quickSort(greaterArray)
    
}

let unsorted = [7,2,9,1,4,5,3,7]
let sorted = quickSort(unsorted)
