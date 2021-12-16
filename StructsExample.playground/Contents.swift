import UIKit
//
//struct Rectangle {
//  var width = 10
//  var height = 20
//    func printDesc() {
//      print("I have a width of \(width) and a height of \(height)")
//    }
//    mutating func doubleWidth() {                // Why do we need the mutating keyword here?
//      width *= 2
//    }
//  }
//
//struct Rectangle {
//    var width = 200
//    var height = 400
//}
//let rectangle = Rectangle()

//struct Rectangle {
//    var width: Int
//    var height: Int
//}
//let rectangle = Rectangle(width : 20 , height : 20)

//class Person {
//  var fullName: String
//  init(name: String) {
//    self.fullName = name
//  }
//  func introduce() {
//    print("Hi my name is \(self.fullName)")
//  }
//}
//var j = Person(name: "Ketul Patel") // Initialize a Person object and assign it to the j variable
//var k = j                           // Create a k variable and set its value to be the j variable
//                                    // (remember classes are reference types)
//j.introduce()                       // Prints "Hi my name is Ketul Patel"
//k.fullName = "Ketul J Patel"        // We are changing the name through the k variable.
//j.introduce()                       // Prints "Hi my name is Ketul J Patel" since both
//struct Rectangle {
//  var width: Int
//  var height: Int
//}
//var square1 = Rectangle(width: 10, height: 10)
//var square2 = square1                         // Here the val inside square 1 (an instance of Rectangle)
//                                              // is copied and passed rather than just pointed to.
//print("square1's width: \(square1.width), square2's width \(square2.width)")
//                                              // They are the same because square2 is a copy of square1
//square2.width = 20                            // This only changes square2 because there are
//                                              // 2 separate instances of rectangle in memory
//square2.height = 20
//print("square1's width: \(square1.width), square2's width \(square2.width)")
//                                              // They are different now: changing square2 changed a
//                                              // completely separate instance from square1.
//                                    // j and k refer to the same instance in memory
class Person {
  var species = "H. Sapiens"
  var name: String
  init(name: String) {         // Note: this function doesn't get called explicitly.  It is called
                               // when creating an instance using the initialization syntax -- "Person()"
    self.name = name           // Note: the use of "self.name" here to refer to the name property
    // instead of the name parameter
  }
    func speak() {
    print("Hello! I am a \(self.species) and my name is \(self.name) ")
                               // Note how we refer to the properties using "self"
  }
}
class Developer: Person {      // Note how we are specifying that Developer will inherit from Person
  var favoriteLanguage: String
    init(name: String, favoriteLanguage: String) {    // Note there is no override keyword on init because it has
        // different parameter names then the Person init method
    self.favoriteLanguage = favoriteLanguage
    super.init(name: name)
  }
    override func speak() {  // must be same header (from me)                         // Note there is an override keyword on speak because it is
        // identical to the Person speak method
    print("Hello! I am a Developer! My name is \(self.name)")
  }
}
var myDeveloper: Developer = Developer(name: "Jay", favoriteLanguage: "Swift")
myDeveloper.speak()


