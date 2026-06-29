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