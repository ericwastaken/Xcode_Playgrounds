import Foundation

public class Node<T>: CustomStringConvertible {
    public var value: T
    public var next: Node? = nil
    // Prevent a retain cycle by making previous weak!
    public weak var previous: Node? = nil
    
    public var description: String {
        return "\(value)"
    }
    
    public init(_ value:T) {
        self.value = value
    }
    
}

public class LinkedList<T>: CustomStringConvertible {
    
    private var head: Node<T>? = nil
    private var tail: Node<T>? = nil
    
    public var lastNode: Node<T>? {
        var currentNode = head
        while currentNode != nil && currentNode?.next != nil {
            currentNode = currentNode!.next
        }
        return currentNode
    }
    
    // To append
    // Case 1 -> nothing yet. head=nil, tail=nil, lastNode=nil
    //    we want: head -> newNode -> tail
    // Case 2 -> something already. head=someNode tail=someNode or someOtherNode, lastNode=non nil the last node
    //    we want: head -> someNode aka lastNode -> newNode -> tail
    
    public func append(_ value: T) {
        let newNode = Node<T>(value)
        
        if let lastNode = self.lastNode {
            // lastNode=someNode, so not empty
            lastNode.next = newNode
            newNode.previous = lastNode
        } else {
            // lastNode=nil, so totally empty
            self.head = newNode
        }
    }
    
    public func findFirst(predicate: (T) -> Bool) -> Node<T>? {
        var currentNode = head
        while currentNode != nil {
            if predicate(currentNode!.value) {
                return currentNode
            } else {
                currentNode = currentNode!.next
            }
        }
        return nil
    }
    
    public var description: String {
        var currentNode = head
        var desc: String = ""
        while currentNode != nil {
            if desc != "" {
                desc.append(", ")
            }
            desc.append("\(currentNode!)")
            currentNode = currentNode!.next
        }
        return desc
    }
}

func tester() {
    // Test the Node class
    let myNode = Node<Int>(5)
    print("myNode: \(myNode)")
    
    // Test the Linked List
    let myLL = LinkedList<Int>()
    myLL.append(5)
    print("\(myLL)")
    myLL.append(9)
    print("\(myLL)")
    let found = myLL.findFirst(predicate:  { (nodeValue) -> Bool in
        nodeValue == 9
    })
    print("found: \(found)")
    let found2 = myLL.findFirst(predicate:  { (nodeValue) -> Bool in
        nodeValue == 6
    })
    print("found: \(found2)")
}

tester()
