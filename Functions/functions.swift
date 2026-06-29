
// Functions -> Small piece of code which has a name which can be called any number of times 
// helps to reduce redundancy and also help to write organized code

// syntax
/*
func identifier(Parameters -> type, ...) -> returnType {
  Statements
  return Type -> optional
}

*/

func greet(){
    print("Hello from Swift function")
}

greet()
// by Default External and internal parameter name is same
func addition(a: Int, b: Int) -> Int{
    return a + b
}

let addOperation: (Int, Int) -> Int = addition

print("Addition Operation on Variable", addOperation(5,11))

print(addtion(a: 5, b: 10)) //output -> 15

// If you don't want any external parameter name use _
func addtion2(_ a: Int, _ b: Int) -> Int{
    return a + b
}
print(addtion2(5,10)) //output -> 15


// If you  want any external parameter name different then put something on the place of _
func addtion3(first num1: Int, second num2: Int) -> Int{
    return num1 + num2
}
print(addtion3(first: 5, second: 10)) //output -> 15


// Default Values in Parameters

func namaste(greet: String = "namaste"){
  print(greet)
}

namaste()
namaste(greet: "My very Greetings to you")



// To return a Tuple using Functions

let arr = [1,2,3,0,559,89,56]
func getMinMaxFromArray(arr: [Int]) -> (min: Int, max: Int){
  return (min: arr.min()!,max: arr.max()!)
}

print(getMinMaxFromArray(arr: arr))


// When you want to accept multiple values of same datatype but not array

// you can use dataType...

// Internally it converts it in array then executes it

func avg(nums: Double...) -> Double {
   let total =  nums.reduce(0, +)
    return total/Double(nums.count)
}


print(avg(nums: 1,2,3,8,9,9,5))


// Pass by reference means Passing the address of the variables
// If you change any value of it, The original Value will also be changed

// It is done using inout while writing parameters
// In arguments pass address of variable using &
var x = 10, y = 20
print("Before swapping original Values x:\(x), y:\(y)")
func swapValues(_ a: inout Int, _ b: inout Int){
    let temp = a;
    a = b;
    b = temp;
}

swapValues(&x, &y) 
print("After swapping original Values x:\(x), y:\(y)")








// Swift has external and Internal Parameters which means internally on what name they are getting called and outside they are called by some other name

// External Parameters are like positional Arguments on function call

func  printSqr(numInStr: String){
    guard let n = Int(numInStr) else {
        print("Failed to convert String to number make sure to pass number only")
        return;
    }
    print(n*n);
}

printSqr(numInStr: "8")
printSqr(numInStr: "8")
printSqr(numInStr:"Hello")

// Swift has external and Internal Parameters which means internally on what name they are getting called and outside they are called by some other name

// If you don't want external parameter just put _ and it will not be required

func  printSqr2(_ numInStr: String){
    guard let n = Int(numInStr) else {
        print("Failed to convert String to number make sure to pass number only")
        return;
    }
    print(n*n);
}

printSqr2("8")
printSqr2("8")
printSqr2("Hello")





// Closures (Annonymous Function)
// In this Function i am returning a function which returning a Int value

// on Call of makeCount() -> calls Annoymous Function which has return type Int 

// Annoymous Function Returns counter closure means a function which returns and  value gets saves in counter variable

func makeCount() -> () -> Int {
  var count = 0;
  let counter = {
    count += 1
    return count
  }
  return counter

}


let counter = makeCount();

print(counter());
print(counter());
print(counter());
print(counter());
/*
output
1
2
3
4
*/


// Enumerations 

enum Direction {
    case north
    case south
    case east
    case west
}

let move = Direction.south

switch move{
  case .north:
  print("Moving North")
  case .south:
  print("Moving south")
  case .east:
  print("Moving east")
  case .west:
  print("Moving west")
}