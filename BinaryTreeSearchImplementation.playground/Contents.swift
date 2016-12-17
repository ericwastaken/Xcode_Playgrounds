// Binary Search Tree
//  A node can contain at most 2 children
//  The tree is always in order

public class BinarySearchTree<T>: CustomStringConvertible {
    var value: T
    var leftTree: BinarySearchTree<T>?
    var rightTree: BinarySearchTree<T>?
    
    init(_ value: T) {
        self.value = value
    }
    
    public var description: String {
        let value = "\(self.value)"
        let leftTree = self.leftTree == nil ? "nil" : "\(self.leftTree!)"
        let rightTree = self.rightTree == nil ? "nil" : "\(self.rightTree!)"
        return "\(value): [\(leftTree) , \(rightTree)]"
        
    }
    
    public var count: Int {
        var counter = 0
        if let leftCount = self.leftTree?.count {
            counter += leftCount
        }
        if let rightCount = self.rightTree?.count {
            counter += rightCount
        }
        return counter + 1 // +1 for itself
    }
    
}


// Insert
public func insert<T: Comparable>(intoTree: BinarySearchTree<T>, value: T) -> BinarySearchTree<T> {
    // decide if we go left or right
    if value < intoTree.value {
        if let leftTree = intoTree.leftTree {
            // We replace the left tree, with a future left tree (recursively)
            intoTree.leftTree = insert(intoTree: leftTree, value: value)
        } else {
            // no left tree, so insert into left
            let newNode = BinarySearchTree<T>(value)
            intoTree.leftTree = newNode
            return intoTree
        }
    }
    
    // We replace the right tree, with a future right tree (recursively)
    if let rightTree = intoTree.rightTree {
        // We replace the left tree, with a future left tree (recursively)
        intoTree.rightTree = insert(intoTree: rightTree, value: value)
    } else {
        // no left tree, so insert into left
        let newNode = BinarySearchTree<T>(value)
        intoTree.rightTree = newNode
        return intoTree
    }
    
    return intoTree
    
}

var myTree = BinarySearchTree<Int>(5)
myTree = insert(intoTree: myTree, value: 7)
myTree = insert(intoTree: myTree, value: 3)
myTree = insert(intoTree: myTree, value: 13)
print("myTree: \(myTree)")

