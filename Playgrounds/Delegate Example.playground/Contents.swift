//: Playground - noun: a place where people can play

import Foundation

// Define our first delegate (CarPainter)
protocol CarPainterDelegate {
    func myCarWasPainted(color:String)
}

// Define our Car protocol
protocol Car {
    var color: String {get}
    var brand: String {get}
    var model: String {get set}
}

// Create a Car Maintenance class
class CarMaintenance {
    var carDelegate: CarPainterDelegate?
    
    func paintCar(color:String) {
        carDelegate?.myCarWasPainted(color: color)
    }
}

// Create a specific Car's class that implements our protocols
class MazdaRX7: Car, CarPainterDelegate, CustomStringConvertible {
    
    internal var brand: String = "Mazda"
    internal var color: String = "White"
    internal var model: String = "RX7"
    
    var description: String {
        return "\(brand) \(model) \(color)"
    }
    
    func myCarWasPainted(color: String) {
        self.color = color
    }
}

// Setup our classes and tie them together via the protocol/delegate
let myCarShop = CarMaintenance()
let myCar = MazdaRX7()
myCarShop.carDelegate = myCar

// Show the initial car color = White
myCar.color
// Now, have the Shop associated with this car paint it Red
myCarShop.paintCar(color: "Red")
// Show that the car object now shows color = Red
myCar.color
