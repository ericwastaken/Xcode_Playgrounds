let numbers = [1,7,6,13,5,19,10,2,4,3]


// search through a list, one each. big-o is O(n)
numbers.index(of: 5) // built in

// My implementation
private func linearSearch<T: Equatable>(list: [T], value: T) -> Int? {
    // loop
    for i in 0 ..< list.count {
        if list[i] == value {
            return i
        }
    }
    return nil
}

linearSearch(list: numbers, value: 7)
linearSearch(list: numbers, value: 3)
linearSearch(list: numbers, value: 25)

