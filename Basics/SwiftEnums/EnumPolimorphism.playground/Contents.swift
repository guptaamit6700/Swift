import UIKit
// Case - 1st
struct Car {
    let make: String
    let model: String
}
struct Truck {
    let wheels: Int
    let type: String
}
let car = Car(make: "", model: "")
let truck = Truck(wheels: 16, type: "garbageTruck")
let vehicles = [car, truck] as [Any]

for vehicle in vehicles {
    switch vehicle {
    case let car as Car:
        print("this is car \(car)")
    case let truck as Truck:
        print("this is truck \(truck)")
    default:
        print()
    }
}

// Polymorphism achive by Enum

enum Vehicle {
    case car(Car)
    case truck(Truck)
}

let vehiclesArr = [Vehicle.car(car), Vehicle.truck(truck)]
for vehicleType in vehiclesArr {
    switch vehicleType {
    case .car(let car):
        print(car.model)
    case .truck(let truck):
        print(truck.wheels)
    }
}

