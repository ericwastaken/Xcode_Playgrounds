/**
 https://www.hackerrank.com/challenges/ctci-is-binary-search-tree
 
 
 For the purposes of this challenge, we define a binary search tree to be a binary tree with the following ordering properties:
 
 The data value of every node in a node's left subtree is less than the data value of that node.
 The data value of every node in a node's right subtree is greater than the data value of that node.
 Given the root node of a binary tree, can you determine if it's also a binary search tree?
 
 Note: A binary tree is not a binary search if there are duplicate values.
 
 */

import Foundation

class BinarySearchTree: CustomStringConvertible {
    var nodeValue: Int
    var leftTree: BinarySearchTree?
    var rightTree: BinarySearchTree?
    
    public var description: String {
        let leftTree = self.leftTree == nil ? "nil" : "\(self.leftTree!)"
        let rightTree = self.rightTree == nil ? "nil" : "\(self.rightTree!)"
        return "\(self.nodeValue): [\(leftTree), \(rightTree)]"
    }
    
    // initializers
    init(_ nodeValue:Int) {
        self.nodeValue = nodeValue
    }
    
    init(_ nodeValue:Int, leftTree:BinarySearchTree?, rightTree:BinarySearchTree) {
        self.nodeValue = nodeValue
        self.leftTree = leftTree
        self.rightTree = rightTree
    }
    
    public func getLeftChildNodeValue() -> Int? {
        return self.leftTree?.nodeValue
    }
    
    public func getRightChildNodeValue() -> Int? {
        return self.rightTree?.nodeValue
    }
    
    // Is it a BST?
    public func isBst() -> Bool {
        // Check that current node is leftNodeValue < currentNodeValue < rightNodeValue
    
        //print("checking: \(self.nodeValue)")
        
        // Left Node first
        if let leftNodeValue = getLeftChildNodeValue() {
            if leftNodeValue >= self.nodeValue {
                // problem, so we can already return false
                return false
            }
        }
        
        // Right node next
        if let rightNodeValue = getRightChildNodeValue() {
            if rightNodeValue <= self.nodeValue {
                // problem, so we can already return false
                return false
            }
        }
        
        // else, either the nodes followed the right order OR were nil (which we accept)
        
        // Recurse into left first, then right, but only if not nil
        
        let leftTreeIsBst:Bool
        if self.leftTree == nil {
            // is empty, so we call that "true"
            leftTreeIsBst = true
        } else {
            // not empty, so we recurse
            leftTreeIsBst = leftTree!.isBst()
        }
        let rightTreeIsBst:Bool
        if self.rightTree == nil {
            // is empty, so we call that "true"
            rightTreeIsBst = true
        } else {
            // not empty, so we recurse
            rightTreeIsBst = rightTree!.isBst()
        }
        
        return leftTreeIsBst && rightTreeIsBst
    }
    
}

/**
 
 Represent the following tree, which is a BST:
       5
    3     7
   2 4   6 8
 
 */

let e1_node2 = BinarySearchTree(2)
let e1_node4 = BinarySearchTree(4)
let e1_node3 = BinarySearchTree(3,leftTree:e1_node2,rightTree:e1_node4)
let e1_node6 = BinarySearchTree(6)
let e1_node8 = BinarySearchTree(8)
let e1_node7 = BinarySearchTree(7,leftTree:e1_node6,rightTree:e1_node8)
let e1_node5_root = BinarySearchTree(5,leftTree:e1_node3,rightTree:e1_node7)
print("e1: \(e1_node5_root)")
print("e1 isBst: \(e1_node5_root.isBst())")
print()

/**
 
 Represent the following tree, which is NOT a BST:
    5
  4     7
 2 4   6 8
 
 */

let e2_node2 = BinarySearchTree(2)
let e2_node4 = BinarySearchTree(4)
let e2_node4b = BinarySearchTree(4,leftTree:e2_node2,rightTree:e2_node4)
let e2_node6 = BinarySearchTree(6)
let e2_node8 = BinarySearchTree(8)
let e2_node7 = BinarySearchTree(7,leftTree:e2_node6,rightTree:e2_node8)
let e2_node5_root = BinarySearchTree(5,leftTree:e2_node4b,rightTree:e2_node7)
print("e2: \(e2_node5_root)")
print("e2 isBst: \(e2_node5_root.isBst())")


