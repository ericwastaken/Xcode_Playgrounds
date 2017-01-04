import Foundation
import PlaygroundSupport

// So that we can get to the background and async tasks (playground won't stop after the main run loop)
PlaygroundPage.current.needsIndefiniteExecution = true

var someValue: Int = 0

// After 10 seconds, run this block in the global background queue
DispatchQueue.global(qos:.background).asyncAfter(deadline: .now() + 5.0) {
    someValue = 10
    print("Global Background Queue -> someValue was set to: \(someValue)")
    // If we were doing some UI Operations, we'd jump back into the Main Queue
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
        someValue = 1
        print("Main Queue -> someValue was re-set to: \(someValue)")
    }
}

print("Run Loop at start -> someValue initialized to: \(someValue)")

