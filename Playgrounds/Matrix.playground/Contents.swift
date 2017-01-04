/**
 Matrix Example
 
 Solution by Eric A. Soto, eric@issfl.com
 2016-12-16
 
 */

import Foundation

/**
 The problem was, given a matrix, output a linear array equivalent in a specific order.

  Input: matrix A[N][M]
 Output: elements of A in the following order (provided)
         0,0
         1,0
         0,1
         0,2
         1,1
         2,0
         3,0
         2,1
         ... (sequence continues)
 */

/**
 Solution Comments:
 
 Sorry, I am not seeing the sequence/pattern in the above ordering!
 
 However, I still implemented:
    * a class to hold a Matrix 
    * methods in the class to output the matrix in useful ways, including a linear array output, albeit "in order".
    * a method linearArraySpecialOrder that uses a helper function to output in an "agorithmic" order (though not the sequence provided since I could not visualize it.)
 
 Please note the "running code" after the class definition!
 
 Also, note this is a playground that can be run in Xcode 8 (since I used Swift 3.0 syntax)
 
 */


/**
 A class to hold our Matrix, expected to be any dimension as per the initializer.
 */
public class Matrix<T>: CustomStringConvertible {
    // Set aside a two dimentional array to hold our values
    var matrixStore = Array<Array<T?>>()
    // var matrixStore = [[T?]]() // Alternate (short version) of the Array declaration
    
    // Hold our matrix size for easy recall later
    var n: Int
    var m: Int
    
    /**
     Implements CustomStringConvertible so we can output the Matrix easily!
     
     Will describe the matrix, but linearly
     */
    public var description: String {
        // Set aside a string to hold our values
        var arrayString: String = ""
        // Loop rows
        for x in 0..<matrixStore.count {
            arrayString += "Row \(x+1): "
            // Get each row
            let matrixRow = matrixStore[x]
            // Loop columns
            for y in 0..<matrixRow.count {
                // Output the slot value, in a "nice form" if nil (getting rid of optionals)
                var slotString = ""
                if let slotValue = matrixRow[y] {
                    slotString = "\(slotValue)"
                }
                arrayString += slotString + ","
            }
            arrayString += "\n"
        }
        // Finally, return the string that describes the matrix, linearly
        return "The Matrix has the following elements:\n" + arrayString
    }
    
    /**
     Initialize the Matrix to a certain size (rows x columns)
     */
    init(nMax:Int, mMax:Int) {
        // Hold our matrix size
        self.n = nMax
        self.m = mMax
        // Loop through rows
        for _ in 0..<nMax {
            // For each row, create and append the inner array with the right columns
            matrixStore.append(Array(repeating:nil, count:mMax))
        }
    }
    
    /**
     Add an entry to the matrix at a specific slot
    */
    public func add(value:T, n:Int, m:Int) {
        
        // TODO: Should check bounds!
        
        // Add to the right slot
        matrixStore[n][m] = value
    }
    
    /**
     Output the matrix in a linear array, in row/column order
     
     A matrix maps to an array as follows:
        if a matrix ix nXm, an entry matrix[x][y] = linearArray[x * m + y]
     */
    public func linearArray() -> [T?] {
        // Create the one dimensional array and initialize it, though empty
        var linearArray = [T?]()
        // Calculate our one dimensional size, which is n x m
        let size1d = self.n * self.m
        // We need the columns too, for the 1d conversion, so set it aside here too
        let columns = self.m
        // Now that we know the one dimensional size, actually allocate the slots in the 1d array
        linearArray = Array<T?>(repeating: nil, count: size1d)
        // And loop through our matrix, rows first...
        for x in 0..<matrixStore.count {
            // With a row...
            let matrixRow = matrixStore[x]
            // Loop through the columns
            for y in 0..<matrixRow.count {
                // For each entry, calculate the slotDimension in 1d
                let slotDimension = (x * columns) + y
                // Copy the value into the correct 1d slot
                linearArray[slotDimension] = matrixRow[y]
            }
        }
        // Return the 1d array
        return linearArray
    }
    
    /**
     A helper function that given an iteration index, tells us what the "next" number in the sequence should be.
     
     Desired Order Pattern: See the top of this file!
     
     This implementation passes but ignores "prior item", in case the logic ends up requiring that.
     
        Returns: - A tuple, (x,y) the x,y of the "next" item
     
     */
    func getNextItemInSequence(iteration:Int, priorItem:(n:Int, m:Int)?) -> (Int, Int) {
        // Since I was not able to visualize the provided sequence, I'll use this demo instead as a placeholder.
        
        // TODO: Replace this with the correct "sequence" logic as defined by the problem statement at the top of this file.
        
        // For this demo, it just uses the first column for each row, assuming the iteration is the row (and ignores priorItem)

        return (iteration - 1,0)
    }
    
    /**
     Output the matrix in a linear array, in a specific order as provided by the logic in getNextItemInSequence.
     
     */
    public func linearArraySpecialOrder() -> [T?] {
        // Set aside an array for our return
        var linearArray = [T?]()
        // Start out at iteration 1
        var iteration = 1
        // Set aside a variable/tuple to hold our "next item"
        var nextItem: (n:Int, m:Int)
        var priorItem: (n:Int, m:Int)?
        
        // Loop until nextItem does not make sense (until the sequence exceds our matrix size)
        while true {
            // Get the next item as per the logic in the helper function
            nextItem = getNextItemInSequence(iteration: iteration, priorItem: priorItem)
            // Check the next item. Out of bounds?
            if nextItem.n > self.n - 1 || nextItem.m > self.m - 1 {
                // Our next item is already out of bounds, so break out of our while-loop
                break
            }
            // ASSERT STATEMENT: Our next item is within bounds, so add to our output
            
            // Add it to our putput array
            linearArray.append(matrixStore[nextItem.n][nextItem.m])
            
            // And increment our iteration and loop
            iteration += 1
            // Plus store nextItem into priorItem for the next iteration
            priorItem = nextItem
        }
        
        return linearArray
    }
    
}

/**
 With the class and it's methods defined, let's test it out!
 */

// Create a 3x3 matrix
let myMatrix = Matrix<String>(nMax:3, mMax:3)
// Store arbitrary values in it
myMatrix.add(value:"A1", n:0, m:0)
myMatrix.add(value:"A2", n:0, m:1)
myMatrix.add(value:"A3", n:0, m:2)
myMatrix.add(value:"B1", n:1, m:0)
myMatrix.add(value:"B2", n:1, m:1)
myMatrix.add(value:"B3", n:1, m:2)
myMatrix.add(value:"C1", n:2, m:0)
myMatrix.add(value:"C2", n:2, m:1)
myMatrix.add(value:"C3", n:2, m:2)
// PrettyPrint it...
print("************************************")
print("Test Example 1: 3x3 matrix")
print(myMatrix)
// Output the 1d array for it
print("A linear array for this matrix is represented as:")
print(myMatrix.linearArray())
print("\n")
print("In special order:")
print(myMatrix.linearArraySpecialOrder())
print("\n")

// Create a 6x4 matrix
let myMatrix2 = Matrix<String>(nMax:6, mMax:4)
// Store arbitrary values in it
myMatrix2.add(value:"A1", n:0, m:0)
myMatrix2.add(value:"A2", n:0, m:1)
myMatrix2.add(value:"A3", n:0, m:2)
myMatrix2.add(value:"A4", n:0, m:3)
myMatrix2.add(value:"B1", n:1, m:0)
myMatrix2.add(value:"B2", n:1, m:1)
myMatrix2.add(value:"B3", n:1, m:2)
myMatrix2.add(value:"B4", n:1, m:3)
myMatrix2.add(value:"C1", n:2, m:0)
myMatrix2.add(value:"C2", n:2, m:1)
myMatrix2.add(value:"C3", n:2, m:2)
myMatrix2.add(value:"C4", n:2, m:3)
myMatrix2.add(value:"D1", n:3, m:0)
myMatrix2.add(value:"D2", n:3, m:1)
myMatrix2.add(value:"D3", n:3, m:2)
myMatrix2.add(value:"D4", n:3, m:3)
myMatrix2.add(value:"E1", n:4, m:0)
myMatrix2.add(value:"E2", n:4, m:1)
myMatrix2.add(value:"E3", n:4, m:2)
myMatrix2.add(value:"E4", n:4, m:3)
myMatrix2.add(value:"F1", n:5, m:0)
myMatrix2.add(value:"F2", n:5, m:1)
myMatrix2.add(value:"F3", n:5, m:2)
myMatrix2.add(value:"F4", n:5, m:3)

// PrettyPrint it...
print("************************************")
print("Test Example 1: 6x4 matrix")
print(myMatrix2)
// Output the 1d array for it
print(myMatrix2.linearArray())
print("\n")
print("In special order:")
print(myMatrix2.linearArraySpecialOrder())
print("\n")
