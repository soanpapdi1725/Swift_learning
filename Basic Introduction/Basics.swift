import Foundation

// Var & Let are two keywords which defines your identifier will be variable or constant

// var --> for variable ones
// let --> for Constant ones


// Examples for var
var message = "learning" 
print(message) // output -> learning
message = "learning variables" //value changed
print(message) // output -> learning variables


// Examples for let(constant)

let statusCode = 20
print(statusCode)
// statusCode = 25 --> //giving error
// print(statusCode)

// --> Ways to tell datatype of program

// DataTypes in Swift -> Int, Float, Double, String, Character, Bool

//Inference --> when compiler itself understand what is the datatype of the identifier while initialization of the program

// Example of Inference
var autoInference = "While Initialization" //autoInference is String and compiler itself got to know when the idenifier is first assigned(initialization)

//Annotation --> when compiler we as programmer tell the code that the type of identifier is String or Int or double or whatever

// Example of Annotation

var manualAnnotation:Int = 50 // we told the program that treat this as Int
print(manualAnnotation)

var boolInfered = true
var boolAnnotation:Bool = false

// Operators 

var a = 5 // assignment operator
a = a + 2 //addition
// works with all Subtraction(-), multiplication(*), modulo(%), division(/)

print(a) //output 7

// Logical Operators -> && (AND)

var mybool:Bool = true

print("Logical Operators -> && (AND)",mybool && true) //true

// Logical Operators -> || (OR)

print("Logical Operators -> || (OR)",mybool || false) //true

// Logical Operator -> ! (NOT) or (Compliment) or (Invert)

print("Logical Operators -> ! (NOT)",!mybool) //false


// Two Logical Operator Examples

print("Logical Operators -> Combine",!mybool || true) //true


