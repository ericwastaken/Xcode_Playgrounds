//: Playground - noun: a place where people can play

import Foundation

protocol CarPainterDelegate {
    func myCarWasPainted(color:String)
}

protocol Car {
    var color: String {get}
    var brand: String {get}
    var model: String {get set}
}

class CarMaintenance {
    var carDelegate: CarPainterDelegate?
    
    func paintCar(color:String) {
        carDelegate?.myCarWasPainted(color: color)
    }
}

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

myCar.color
myCarShop.paintCar(color: "red")
myCar.color
