import Foundation

public class BinaryTree<T: Equatable>: CustomStringConvertible {
    var value: T
    public var ln: BinaryTree<T>?
    var rn: BinaryTree<T>?
    
    public var description: String {
        return "(\(self.value)) -> [\(self.ln) - \(self.rn)]"
    }
    
    init (rootValue: T) {
        value = rootValue
    }
    
    // Implement Equatable
    
    static public func == (lhs:BinaryTree<T>, rhs:BinaryTree<T>) -> Bool {
        // Check the value
        if lhs.value != rhs.value {
            return false
        }
        // Check the left node and nil
        if (lhs.ln == nil && rhs.ln != nil) || (lhs.ln != nil && rhs.ln == nil) {
            return false
        }
        // Check the left node proper
        if let lhsnode = lhs.ln, let rhsnode = rhs.ln {
            if !(lhsnode == rhsnode) {
                return false
            }
        }
        
        // Check the right node and nil
        if (lhs.rn == nil && rhs.rn != nil) || (lhs.rn != nil && rhs.rn == nil) {
            return false
        }
        // Check the right node proper
        if let lhsnode = lhs.rn, let rhsnode = rhs.rn {
            if !(lhsnode == rhsnode) {
                return false
            }
        }
        
        return true
        
    }
    
    
}

func sibling<T>(tree: BinaryTree<T>, value:Int) {
    
}



let myTree = BinaryTree<Int>(rootValue: 10)
let leftNode = BinaryTree<Int>(rootValue: 11)
myTree.ln = leftNode

myTree == myTree







