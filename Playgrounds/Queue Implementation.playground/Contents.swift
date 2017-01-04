import Foundation

// Queue Implementation
// Receives data to store, adds to the bottom, pulls from the top.
// Internally we use an Array to represent the queue.

// Desired Operations
// myQ.enq("something") // new item on the top - note we'll use a non-named parameter
// myQ.deq()            // have a peek at the item at the top

/**
 A class to represent the queue
 */
public class Queue<T>: CustomStringConvertible {
    
    // A store for our queue data (we could abbreviate to inferred type, but will leave for clarity)
    private var queueStore: Array<T> = [T]()
    
    // Describes the Queue as a string!
    public var description: String {
        
        return "Queue: \(queueStore)"
        
    }
    
    // A method to add to the queue (enqueue)
    public func enq(_ value:T) {
        
        queueStore.append(value)
        
    }
    
    // A method to fetch the first item added (dequeue)
    public func deq() -> T? {
        // check for empty so we don't crash!
        if queueStore.isEmpty {
            return nil
        } else {
            return queueStore.removeFirst()
        }
    }
    
}


/**
 An inline func to test our class
 */
private func testTheClass() {
    
    let myQ = Queue<Any>()
    print(myQ)
    myQ.enq(5)
    myQ.enq(1)
    myQ.enq("something")
    print(myQ)
    print("deq: \(myQ.deq())")
    print(myQ)
    print("deq: \(myQ.deq())")
    print("deq: \(myQ.deq())")
    print("deq: \(myQ.deq())")
}

// Fire it off...
testTheClass()


