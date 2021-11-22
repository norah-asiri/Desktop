import UIKit

var greeting = "Hello, playground"
greeting += " Norah"

// Variables are used to store data. We declare a variable using the "var" keyword.
// We also have to specify the type of that variable.
var name: String = "Anakin"
// Every variable declaration follows the same format:
// var variable_name: variable_type = variable_value
var number: Int = -42                      // "Int" type stores whole numbers both positive and negative
var dubs: Double = 4.2                     // "Double" type stores numbers with decimals (allocates 64 bits)
var dec: Float = 4.2                       // "Float" type also stores numbers with decimals (allocates 32 bits)
var isTrue: Bool = true
print("The maximum value \(Int.max)")
print("The minimum value \(Int.min)")

print("The maximum value \(Int32.max)")
print("The minimum value \(Int32.min)")

print("Addition \(1 + 3)")
print("Subtraction \(1 - 3)")
print("Multiplication \(1 * 3)")
print("Division \(1 / 3)")
