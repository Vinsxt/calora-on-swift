//
//  ClassStructEnums.swift
//  Calora-swift
//
//  Created by Vincent Hartono on 22/08/26.
//
//  This code is written down to help me understand the difference
//  in using Class, Struct, and Enums.


import Playgrounds

#Playground {
    
    // Class are reference type. They are shared between instances, changes in one instance can impact others.
    // Class are great for data that needs to be shared and modified between instances.
    
    class Vehicle {
        var make: String
        var model: String
        
        init(make: String, model: String) { // basically a constructor
            self.make = make
            self.model = model
        }
    }
    
    let car1 = Vehicle(make: "Toyota", model: "Camry")
    let car2 = car1
    car2.model = "Corolla" // updating the value of car2.model affect car1.model as well.
    print(car1.model)
    
    // Structs are value types. Each instance has its own copy. Changing one instance doesn't affect the other ones.
    // Structs are used for lightweight independent data that doesn't need to be shared, like simple models or configuration data.
    
    struct Car{
        var make: String
        var model: String
        var type: VehicleType
    }
    
    var carA = Car(make: "Honda", model: "Civic", type: .car)
    var carB = carA
    carB.model = "Accord" // updating the value of carB.model doesn't affect carA model. They are not linked.
    print(carA.model)
    
    // EXAMPLE: User in social media app -> use Class (for their messages, profiles that change overtime through different operations)
    // EXAMPLE: Point location in a 2D game -> use Struct (because it is static and not so frequently updating)
    
    // Enums or Enumerations are used for categories or specific states.
    
    enum VehicleType {
        case car
        case motorcycle
        case bicycle
    }
    
    // Combine enums and structs to categorize data in apps. You could say enum is a data type itself that is specified to certain number of states.
    
    let myCar = Car(make: "Ford", model: "Mustang", type: .car)
    print("My vehicle is a \(myCar.type)")
    
    // Enums help categories remain consistent. That's it.
}
