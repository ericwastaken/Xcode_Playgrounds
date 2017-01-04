//: Playground - noun: a place where people can play

import Foundation

protocol Car {
    var color: String {get}
    var brand: String {get}
    var model: String {get set}
    func paintCar(paintColor: String) -> String
}

class MazdaRX7: Car, CustomStringConvertible {

    internal var brand: String = "Mazda"
    internal var color: String = "White"
    internal var model: String = "RX7"
    
    internal func paintCar(paintColor: String) -> String {
        color = paintColor
        return color
    }
    
    public var description: String {
        return "\(brand) \(model) \(color)"
    }
    
}

let myCar = MazdaRX7()

