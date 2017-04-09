import Foundation
import PlaygroundSupport

// So that we can get to the background and async tasks (playground won't stop after the main run loop)
PlaygroundPage.current.needsIndefiniteExecution = true

// Create a custom concurrent background queue
let myQ = DispatchQueue(label: "net.ericsoto.playgroundgcd",
                        qos: .background,
                        attributes: .concurrent,
                        autoreleaseFrequency: .inherit,
                        target: nil)

myQ.async {
    // something async in our custom queue
}

myQ.sync {
    // Something sync (blocking)
}
