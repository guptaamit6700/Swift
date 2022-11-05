import UIKit


// ==================== Breaking LSP =================
class Rectangle {
    var width: Double = 0
    var height: Double = 0
    
    var area: Double {
        return width * height
    }
}
class Square: Rectangle {
    override var width: Double {
        didSet {
         height = width
        }
    }
}
let areaOfRectangle = Rectangle()
areaOfRectangle.width = 10
areaOfRectangle.height = 5
print("Area of rectangle is ===== \(areaOfRectangle.area)")
let areaOfSquare = Square()
areaOfSquare.width = 5
print("Area of square is ===== \(areaOfSquare.area)")


//=================================================
// LSP states that the child types should be able to replace the object of the base types without modifying the behavior of the base type, let's discuss the code you wrote.

protocol Shape {
    var area: Double {get}
}

class NewRectangle: Shape {
    var width: Double = 0
    var height: Double = 0
    
    var area: Double {
        return width * height
    }
}
class NewSquare: Shape {
    var width: Double = 0
    var area: Double {
        return width * width
    }
}


areaOfRectangle.width = 10
areaOfRectangle.height = 5
print("Area of rectangle is ===== \(areaOfRectangle.area)")


areaOfSquare.width = 5
print("Area of square is ===== \(areaOfSquare.area)")
