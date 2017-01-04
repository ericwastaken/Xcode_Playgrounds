// number of elements
var n = Int(readLine()!)!

// read array and map the elements to integer
var arr = readLine()!.characters.split(separator:" ").map{Int(String($0))!}

// variable to hold the sum of the array elements
var sum = 0

for element in arr {
    // sum the array elements
    sum += element
}

// print the array elements
print(sum)


