import Foundation

/**
 A class for our LinkedList 
 
 Note: must be a class since we have a stored property that is ALSO a LinkedList - so we need the referenceType!
 
 */
public class LinkedList<T:Comparable>: CustomStringConvertible {
    var node: T
    var next: LinkedList?
    
    public init(_ node:T, next:LinkedList?) {
        self.node = node
        self.next = next
    }
    
    /**
     Implements the protocol CustomStringConvertible
     */
    public var description: String {
        var next = "nil"
        if let nextNode = self.next {
            next = "\(nextNode)"
        }
        return "\(self.node)->\(next)"
    }
    /**
     Implements deep copy
     */
    public func copied() -> LinkedList<T> {
        return LinkedList(self.node, next:self.next?.copied())
    }
    
    /**
     Implements the unary operator for equality (compare with "compareLists" below)
     */
    static public func ==(lhs:LinkedList<T>, rhs:LinkedList<T>) -> Bool {
        if lhs.node != rhs.node {
            return false
        } else if (lhs.next == nil && rhs.next != nil) || (lhs.next != nil && rhs.next == nil) {
            return false
        } else if lhs.next == nil && rhs.next == nil {
            return true
        } else {
            return lhs.next! == rhs.next!
        }
    }
}

/**
 A recursive sorted merge of 2 sorted LinkedLists
 */
public func mergeLists<T:Comparable>(headA:LinkedList<T>?, headB:LinkedList<T>?) -> LinkedList<T>?
{
    // If headB is empty, just return headA! (we will end recursion)
    if headB == nil {
        return headA
    }
    if headA == nil {
        return headB
    }
    
    // Both headA and headB have a "next" stored as nextA and nextB
    if headA!.node <= headB!.node {
        let newNode = LinkedList(headA!.node, next:mergeLists(headA:headA!.next,headB:headB))
        return newNode
    } else {
        let newNode = LinkedList(headB!.node, next:mergeLists(headA:headA,headB:headB!.next))
        return newNode
    }
    
}

/**
 Compare 2 linked lists and return true if they are equal (nodes are equal, not necessarily if the references to objects are the same!)
 Compare with the unary operator for equality defined in the class!
 */
public func compareLists<T:Comparable>(headA:LinkedList<T>?, headB:LinkedList<T>?) -> Bool {
    if headA == nil && headB == nil {
        return true
    }
    if headA == nil || headB == nil {
        return false
    }
    // Assert: Neither is nil
    if headA!.node != headB!.node {
        return false
    } else {
        return compareLists(headA:headA!.next,headB:headB!.next)
    }
}


// A few sample Linked Lists

// 0->2->4->nil
let nodeA4 = LinkedList(4,next:nil)
let nodeA2 = LinkedList(2,next:nodeA4)
let nodeA0 = LinkedList(0,next:nodeA2)

// 1->3->5->7->nil
let nodeB7 = LinkedList(7,next:nil)
let nodeB5 = LinkedList(5,next:nodeB7)
let nodeB3 = LinkedList(3,next:nodeB5)
let nodeB1 = LinkedList(1,next:nodeB3)

// Our merge
mergeLists(headA:nodeA0, headB:nodeB1)

// Compare, expecting non-equal
compareLists(headA:nodeA0, headB:nodeB1)
nodeA0==nodeB1

// Compare, expecting equal
let nodeA0copy = nodeA0.copied()
compareLists(headA:nodeA0, headB:nodeA0copy)
nodeA0==nodeA0copy


