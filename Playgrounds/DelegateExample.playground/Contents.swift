//: Playground - noun: a place where people can play

import Foundation

protocol CarPainterDelegate {
    func myCarWasPainted(color:String)
}

class CarMaintenance {
    var carDelegate: CarPainterDelegate?
    
    func paintCar(color:String) {
        carDelegate?.myCarWasPainted(color: color)
    }
}

class Car: CarPainterDelegate {
    var color: String?
    
    func myCarWasPainted(color: String) {
        self.color = color
    }
}

// Setup our classes and tie them together via the protocol/delegate
let myCarShop = CarMaintenance()
let myCar = Car()
myCarShop.carDelegate = myCar

myCar.color
myCarShop.paintCar(color: "red")
myCar.color
