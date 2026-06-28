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


// Relational Operators -> Used for comparison between two numeric values
// > greater than                                >= greator than or equals to
// < less than                                   <= less than or equals to

// Examples

var age: Int = 4;

print(age > 18 ? "Age greater than 18" : "age less than 18") //ternary operators


// Loops

// For loop -> for loops when you know the no. of iterations required
 print("Close Range")
// ... -> close range -> includes starting and ending values
for number in 1...5{ // start...end includes start & end values
  print(number)
}

 print("Half Range")
// ..< -> Half Open range -> includes starting stops before ending value
for n in 5..<10{ //will print from 5 to 9
  print(n)
}

// Another method
print("Stride way to use loop")
for n in stride(from: 1, to:10, by:+1){
  print(n)
}
//to include the last value also doesnot matter it's in forward direction or backward direction then use through
print("Stride way to use loop(using through to include 10 also in output)")
for n in stride(from: 1, through:10, by:+1){
  print(n)
}

// Loop on array

let fruits = ["Apple", "Banana", "Mango"]

for fruit in fruits {
    print(fruit)
}

// Dictionary is a type of array where index is key in it not 0,1,2,3 
// Dictionary is unordered means in every run the key-value pair will be printed in different order

let document: [String: Any] = [
    "name": "sonu yadav",
    "age": 21
]

for (key, value) in document {
    print("key:", key)
    print("value:", value)
}

// more examples

print("reverse of loop using Reversed")
// reverse of loop
for n in (1...10).reversed(){
  print(n)
}

print("reverse of loop using stride")
// reverse of loop
for n in stride (from: 10, to: 0, by:-1){
  print(n)
}

