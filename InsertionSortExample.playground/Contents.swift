// Insrtion Sort Example
// Given insertSort([3,2,7,4,5])
// Returns [2,3,4,5,7]
// How:
// Two piles - one sorted, one unsorted. Grab from unsorted and place in sorted in the right place by swapping as needed.

import Foundation

/**
 Swap to entries in the array!
 */
public func swapEntries(_ arrayToSwapWith: [Int], swap: Int, with: Int) -> [Int] {
    // TODO: Add some boundary protections (ensure array indexes within range)
    var mutableArray = arrayToSwapWith
    mutableArray[swap] = arrayToSwapWith[with]
    mutableArray[with] = arrayToSwapWith[swap]
    return mutableArray
}

public func insertSort(_ unsortedArray:[Int]) -> [Int] {
    // First, check if we have work to do
    if unsortedArray.count <= 1 {
        // not much to do, so just return it
        return unsortedArray
    }
    
    // ASSERT: We have 2 or more entries in unsortedArray!
    
    // Make a copy so we can modify it (we're going to popLast)
    var unsortedMutable = unsortedArray
    // Make an array to hold our sort - and we might as well start it with the "top" item in unsorted
    var sortedArray = [unsortedMutable.popLast()!]
    
    // ASSERT: sortedArray has 1 item and that same item is no longer in unsortedMutable
    
    // Now, let's begin our magic. For each item left in unsorted, let's do work
    while unsortedMutable.count > 0 {
        // Fetch the top item from unsorted (and also removes it)
        let sortCandidate = unsortedMutable.popLast()!
        // Add it to the top of the sorted
        sortedArray.append(sortCandidate)
        // Now, check our order in sorted and decide if we need to swap (why count-2 : because count-1 is the item we just added. No need to check it against what?
        for idx in (0...sortedArray.count-2).reversed() {
            // check to see if the current item is less than the one just after it
            if sortedArray[idx] > sortedArray[idx+1] {
                // yep, we need to swap
                sortedArray = swapEntries(sortedArray, swap: idx, with: idx+1)
            } else {
                // nope... so we don't need to keep going with the FOR LOOP
                break
            }
        }
    }
    
    return sortedArray
    
}

let unsorted = [3,2,7,4,5,5]
let testSwap = swapEntries(unsorted, swap:0, with: 1)
let sorted = insertSort(unsorted)


