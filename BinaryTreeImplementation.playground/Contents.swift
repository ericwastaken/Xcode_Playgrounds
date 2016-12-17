// Binary Tree
//  A node can contain at most 2 children

public class BinaryTree<T>: CustomStringConvertible {
    var value: T
    var leftTree: BinaryTree<T>?
    var rightTree: BinaryTree<T>?
    
    // Initializer with just the node
    init(value: T) {
        self.value = value
    }
    
    // Initializer with both the node and the two branches (which could be nil)
    init(value: T, _ leftTree: BinaryTree<T>?, _ rightTree: BinaryTree<T>?) {
        self.value = value
        self.leftTree = leftTree
        self.rightTree = rightTree
    }
    
    // Implements the CustomStringConvertible protocol, so we can pretty print the tree
    public var description: String {
        let value = "\(self.value)"
        let leftTree = self.leftTree == nil ? "nil" : "\(self.leftTree!)"
        let rightTree = self.rightTree == nil ? "nil" : "\(self.rightTree!)"
        return "\(value):[\(leftTree) , \(rightTree)]"
        
    }
    
    // Implements Deep Copy
    public func deepCopy() -> BinaryTree<T> {
        let newTree = BinaryTree<T>(value:self.value)
        newTree.leftTree = self.leftTree?.deepCopy()
        newTree.rightTree = self.rightTree?.deepCopy()
        return newTree
    }
    
    // To simplify the closure syntax for our node operations
    //   a closure that receives a nodeValue of type T and returns a result also T
    typealias nodeOperationClosure = (_ nodeValue:T) -> (T)
    
    // Applies the passed closure "in order", to each node, resetting the node (left depth first, then node, then right depth first)
    func applyClosureInOrder(operation: nodeOperationClosure) -> () {
        // Recurse into the left
        self.leftTree?.applyClosureInOrder(operation: operation)
        // to show the order
        print("apply to: \(self.value)")
        // Reassign the node to the result of the operation
        self.value = operation(self.value)
        // Recurse into the right
        self.rightTree?.applyClosureInOrder(operation: operation)
    }
    
    // To simplify the closure syntax for our node operations
    //   a closure that receives a nodeValue of type T and returns a result also T
    typealias nodeOperationWithParamClosure = (_ shiftValue:T, _ nodeValue:T) -> (T)
    
    // Applies the passed closure "in order", to each node, resetting the node (left depth first, then node, then right depth first)
    func applyClosureWithParamsInOrder(someParam: T, operation: nodeOperationWithParamClosure) -> () {
        // Recurse into the left
        self.leftTree?.applyClosureWithParamsInOrder(someParam: someParam, operation: operation)
        // to show the order
        print("apply to: \(self.value)")
        // Reassign the node to the result of the operation
        self.value = operation(someParam, self.value)
        // Recurse into the right
        self.rightTree?.applyClosureWithParamsInOrder(someParam: someParam, operation: operation)
    }
    
    // Pretty Print - Depth First = In-order, first look at the left child of a node, then at the node itself, and finally at its right child.
    public func ppDF() -> String {
        var output = ""
        if let leftTree = self.leftTree {
            output += leftTree.ppDF()
        }
        output += " \(self.value)"
        if let rightTree = self.rightTree {
            output += rightTree.ppDF()
        }
        return output
    }
    
    // Pretty Print - Post Order, first look at the left and right children and process the node itself last.
    public func ppPO() -> String {
        var output = ""
        
        if let leftTree = self.leftTree {
            output += leftTree.ppPO()
        }
        
        if let rightTree = self.rightTree {
            output += rightTree.ppPO()
        }
        
        output += " \(self.value)"
        
        return output
    }
    
    // Counts the nodes
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

// Example
//       2
//     3   4

let example1_node3 = BinaryTree<Int>(value: 3, nil, nil)
let example1_node4 = BinaryTree<Int>(value: 4, nil, nil)
let example1_root = BinaryTree<Int>(value: 2, example1_node3, example1_node4)
print("Example 1: \n\(example1_root)")
print(" has \(example1_root.count) nodes.")
print("  depth first: \(example1_root.ppDF())")
print("  post order: \(example1_root.ppPO())")
print("\n")

// Example
//       2
//     3   4
//    5 6
//   7

let example2_node7 = BinaryTree<Int>(value: 7, nil, nil)
let example2_node5 = BinaryTree<Int>(value: 5, example2_node7, nil)
let example2_node6 = BinaryTree<Int>(value: 6, nil, nil)
let example2_node3 = BinaryTree<Int>(value: 3, example2_node5, example2_node6)
let example2_node4 = BinaryTree<Int>(value: 4, nil, nil)
let example2_root = BinaryTree<Int>(value: 2, example2_node3, example2_node4)
print("Example 2: \n\(example2_root)")
print(" has \(example2_root.count) nodes.")
print("  depth first: \(example2_root.ppDF())")
print("  post order: \(example2_root.ppPO())")
print("\n")

// Copy the tree
let example2Copy = example2_root.deepCopy()
print("Example 2 Copy: \n\(example2Copy)")

// Apply a closure in order
example2Copy.applyClosureInOrder { (nodeValue: Int) -> Int in
    // Shift each node "up" by 1
    let newValue = nodeValue + 1
    return newValue
}

example2Copy.applyClosureWithParamsInOrder(someParam: 4,
    operation: {
        (shiftValue: Int, nodeValue: Int) -> Int in
        // Shift each node "up" by someParam
        let newValue = nodeValue + shiftValue
        return newValue
})

print("Example 2 Copy after 'Shift 1' closure: \n\(example2Copy)")



