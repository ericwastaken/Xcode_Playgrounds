import Foundation

// Linked list, doubly linked
// Each item 'points' to the next (and previous)
// 'head' points to the first item
// 'tail' points to the last item

/**
 A class to hold each node of our linked list
 */
public class Node<T>: CustomStringConvertible {
    
    private var value: T
    var next: Node?
    weak var previous: Node?
    
    public var description: String {
        
        return "\(self.value)"
        
    }
    
    public init(_ value: T) {
        
        self.value = value
        
    }
    
}

/**
 A class to hold our linked list
 */
public class LinkedList<T>: CustomStringConvertible {
    
    private var head: Node<T>? = nil
    private var tail: Node<T>? = nil
    
    /**
     A property that returns the last node.
     
     Note, this is THE technique we use to "walk" the list! Can be used for anything, count, etc.
     */
    public var lastNode: Node<T>? {
        
        var currentNode: Node? = self.head
        while currentNode != nil && currentNode!.next != nil {
            currentNode = currentNode!.next
        }
        return currentNode
        
    }
    
    public var firstNode: Node<T>? {
        return head
    }

    public var firstNodeString: String {
        if let first = head {
            return "\(first)"
        } else {
            return ""
        }
    }
    
    public func append(_ value:T) {
        
        print("append: \(value)")
        
        // Create our new object
        let newNode = Node<T>(value)
        
        // Find the last node, so we can append this one after!
        if let lastNode = lastNode {
            newNode.previous = lastNode
            newNode.next = tail
            lastNode.next = newNode
        } else {
            head = newNode
        }
        
    }
    
    public var description: String {
        
        var listStringChain = ""
        var currentNode = self.firstNode
        while currentNode != nil {
            if listStringChain != "" {
                listStringChain.append(", ")
            }
            listStringChain.append("\(currentNode!)")
            currentNode = currentNode!.next
        }
        return "LinkedList: -> \(listStringChain) <-"
        
    }
    
}

/**
 A tester func
 */
func testClass() {
    
    let myLL = LinkedList<Int>()
    print("firstNode: \(myLL.firstNodeString)")
    print(myLL)
    myLL.append(7)
    print("firstNode: \(myLL.firstNodeString)")
    print(myLL)
    myLL.append(9)
    print(myLL)
    print("firstNode: \(myLL.firstNodeString)")
    
}

testClass()
