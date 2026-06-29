import Foundation

var temp = Int.random(in: 1...40)


if temp < 16 {
    print("Cold", temp)
} else if temp < 25 {
    print("Room Temperature", temp)
} else {
    print("Hot", temp)
}


// Type Checking
var num = "42"
if let numInt = Int(num){
  print("Typecasted to Num")
}else{
    print("Typecasted Failed")
}

num = "Hello"

if let numInt = Int(num){
  print("Typecasted to Num")
}else{
    print("Typecasted Failed")
}

var val = "String"

if val is Int {
  print("It is Int")
}else{
    print("It is not Int")
}

// to see the Type
print(type(of: num)) //String


// Switch Cases

var temp = Int.random(in: 0...51)

// if you have range
switch temp {
case 0..<10:
  print("Too Cold", temp)
case 10..<20:
  print("Cold", temp)
case 20..<30:
  print("Normal", temp)
case 30..<40:
  print("Too Hot", temp)
default:
  print("very Hot", temp)
}

// if you don't have range
switch temp {
case let x where x < 10:
  print("Too Cold", temp)
case let x where x < 20:
  print("Cold", temp)
case let x where x < 30:
  print("Normal", temp)
case let x where x < 40:
  print("Too Hot", temp)
default:
  print("very Hot", temp)
}

//                            x             ,          y
let quadrantValues = (Int.random(in: -1...1), Int.random(in: -1...1))

print(quadrantValues)
switch quadrantValues {
case (1, 1):
  print("Quadrant I")
case (-1, 1):
  print("Quadrant II")
case (-1, -1):
  print("Quadrant III")
case (1, -1):
  print("Quadrant IV")
case (0, 1):
  print("on Y axis")
case (1, 0):
  print("on X axis")
case (0, -1):
  print("on -Y axis")
case (-1, 0):
  print("on -X axis")
default:
  print("Origin")
}

// switch case fallthrough
// means if one condition on which fallthrough is written if it's true also execute the next condition to it

// switch

let dayNumber = Int.random(in: 1...7)

switch dayNumber{
  case 1:
   print("Weekday")
   fallthrough
   case 2:
   print("Weekday")
   fallthrough
   case 3:
   print("Weekday")
   fallthrough
   case 4:
   print("Weekday")
   fallthrough
   case 5:
   print("Weekday")

   case 6:
   print("Weekend")
   fallthrough
   case 7:
   print("Weekend")
   default:
   print("Not a weekday")
}


// guard check and Early access
func  printSqr(numInStr: String){
    guard let n = Int(numInStr) else {
        print("Failed to convert String to number make sure to pass number only")
        return;
    }
    print(n*n);
}





// while -> use when you don't know the number of iterations
var i = 0

while i<=10{
  print("Iterator i:", i)
  i = i + 1
}

var j = 10


// runs atleast ones -> use when you don't know the number of iterations
repeat{
  print("iterator: ", j);
  j = j+1
}while i < 0


// loop for even numbers combining where


for i in 1...100 where i%2 == 0{
  print("Even Number:", i)
}

// break with outer loop

// if you don't use outer it will only break inner loop not outer one

outer: for i in 1...3{
    for j in 1...3{
      if i == 2 && j == 2{
        print("found (\(i), \(j))")
        break outer
      }
      print("\(i) \(j)")
    }
}

// Continue with outer loop
// if you don't use outer it will only Continue(skip) inner loop not outer one

outer: for i in 1...3{
    for j in 1...3{
      if i == 2 && j == 2{
        continue outer
      }
      print("\(i) \(j)")
    }
    print("i", i)
}

// defer makes the statement inside it less valuable, so it executes statements other than defer first after that from bottom to top it starts executing defers

// between two or more defers the one which comes last will be executed first then goes in bottom to top direction for defer only
func demonstrateDefer(){
  defer {print("This will be lastly executed")}
  defer {print("This will be 3rd executed")}
  defer {print("This will be 2nd executed")}
  print("first executed")
}
/*
Output
first executed
This will be 2nd executed
This will be 3rd executed
This will be lastly executed

*/