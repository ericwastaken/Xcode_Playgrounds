import Foundation

// Stack Implementation
// Receives data to store, and holds it in order.
// Can only 'push' to the top, and 'pop/peek' also from the top.
// Internally we use an Array to represent the stack.

// Desired Operations
// myStack.push("something") // new item on the top - note we'll use a non-named parameter
// myStack.peek()            // have a peek at the item at the top
// myStack.pop()             // fetch the item at the top and remove it, the top becomes the prior item

/**
 A class to represent a stack
 */
private class Stack<T>: CustomStringConvertible {
    // We could shorten this to inferred Array<T> but we'll leave it for clarity
    private var stackStore: Array<T> = [T]()
    
    public var count: Int {
        return stackStore.count
    }
    
    public func push(_ value:T) {
        print("push: \(value)")
        stackStore.append(value)
    }
    
    public func peek() -> T? {
        return stackStore.last
    }
    
    public func pop() -> T? {
        return stackStore.popLast()
    }
    
    public var description: String {
        return "Stack: \(stackStore)"
    }
    
}


/**
 An inline func to test our class
 */
private func testTheClass() {
    
    let myStack = Stack<Any>()
    myStack.push(5)
    print(myStack)
    myStack.push("something")
    print(myStack)
    myStack.push(7)
    myStack.push(12)
    myStack.push("John")
    print("peek: \(myStack.peek())")
    print(myStack)
    print("pop: \(myStack.pop())")
    print("pop: \(myStack.pop())")
    print(myStack)
    
}

// Fire it off...
testTheClass()


