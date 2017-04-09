// GCD Operations Queue Example

import Foundation

let myOpQ = OperationQueue()
myOpQ.name = "net.ericsoto.gcdoperationexample"
myOpQ.maxConcurrentOperationCount = 3
myOpQ.qualityOfService = .background

myOpQ.addOperation {
    // Some operation
}