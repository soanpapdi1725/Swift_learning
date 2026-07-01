// Struct & Classes


//* Struct = Value Type 📦 (a copy is made when you assign or pass it)
//* Class = Reference Type 🔗 (everyone refers to the same object)


//! Struct
// We can use init(Constructor) as well but swift automatically does this for us in case of Struct
// Here init means constructor and deinit means destructor
// Struct do not have any destructor, Swift automatically cleans up memory here for us
// Here if we do copy, both exist differently and both are allocated in different memory meaning changing values of one does not affect other

// Struct cannot perform inheritance or other things
// Struct cannot inherit other classes
struct Student {
  var name: String //no modification is allowed further
  var age: Int
}


var s1 = Student(name: "Sonu", age: 21)
var s2 = s1
s2.name = "Rahul kumar"

print("student 1 name:", s1.name) //Sonu
print("student 2 name:", s2.name) //Rahul Kumar


// This Proves that they both have copies and whatever changes you do won't affect other

//* Methods inside the struct
// ? mutating functions -> By default, methods inside a struct cannot change the struct's properties because structs are value types. To allow a method to modify the struct, you must mark it with mutating.
// ? which means self does not work inside the struct to make a function which can change value inside struct we must have to declare it with mutating which tells that i have now the access to do changes of data members of struct

struct Point{
  var x: Int
  var y: Int
  mutating func moveBy(_ dx: Int, _ dy: Int){ //mutating allowing this function to change the value of struct
    x += dx
    y += dy
  }
}

var p1 = Point(x: 2, y: 2)

p1.moveBy(5, 5)

print("put x:\(p1.x) y:\(p1.y)")

// ? Static Members -> these members can be accessed without creating the Struct or class instance in the code

struct MathUtility {
  static var pi = 3.14
  static func square(_ number: Int) -> Int {
    return number * number
  }
}

print("Calling Static function of math utility for square: ", MathUtility.square(5)) //25
print("Calling Static data  Member of math utility for Pi: ", MathUtility.pi) //3.14

// ? Subscript -> A subscript lets you access an object's data using square brackets [], just like arrays and dictionaries.

/*
let numbers = [10, 20, 30]

print(numbers[0]) // 10

! numbers[0] is actually calling the array's subscript.
*/

struct Week{
  private var weekdays = ["mon", "tue", "wed", "thurs", "fri", "sat", "sun"]

  subscript(index: Int) -> String {
    get{
      return weekdays[index]
    }
    set(newValue){
      weekdays[index] = newValue
    }
  }
}
var day = Week()
print("Weekday at index 5:",day[5]) //getter
day[6] = "Sunday"
print("Weekday at index 7:", day[6]) //setter

// ! Example 2

// Matrix using subscript
// Representing Matrix in 1D 

/*

[(1,0) (1,1) (1,2) (1,3)]  => [0,1,2,3,4,5,6,7,8,9,10,11]
[(2,0) (2,1) (2,2) (2,3)]
[(3,0) (3,1) (3,2) (3,3)]

*/
struct Matrix{
  let rows: Int, columns: Int
  var grid: [Int]

  init(r: Int, c: Int){
    self.rows = r
    self.columns = c
    self.grid = Array(repeating: 0, count: rows*columns)
  }
  subscript(r: Int, c: Int) -> Int{
    get{
      return grid[(r*columns) + c]
    }
    set(newValue){
      grid[(r*columns) + c] =  newValue
    }
  } 
}


var m1 = Matrix(r:3, c:4)
print("After intialization")
for r in 0..<3{
  for c in 0..<4{
    print("\(r) \(c): ", m1[r, c])
  }
}

m1[0,2] = 5
m1[2,2] = 3
m1[2,0] = 10
m1[2,3] = 15
print("after putting values")

for r in 0..<3{
  for c in 0..<4{
    print("\(r) \(c): ", m1[r, c])
  }
}

// Nested Struct

struct House{
  struct Room{
    var rooms: Int
  }
}

var rooms = House.Room(rooms: 4)

print(rooms.rooms)

// Extending the Struct using Extension means adding more properties to the same struct but later on

struct Circle{
  var radius: Double
}

extension Circle{
  func areaOfCircle()-> Double{
    return 3.14*radius*radius
  }
}


let c = Circle(radius: 70)

print("area of circle: ", c.areaOfCircle())




//! Class

// Because both are referencing to one object in the memory changing one affect other
// we have to use init else we have to provide Default values such as "" or 0 or false
// we can use Deinit for cleaning the memory
// Class can inherit other classes as well as  it is capable of exercising OOPs concept
class Person{
  var name: String
  var hobby: String
  init(name: String, hobby: String){
    self.name = name
    self.hobby = hobby
  }
}

var p1 = Person(name: "Sonu", hobby: "Cricket")

var p2 = p1

p2.hobby = "Chess"

print("Person 1 Hobby: ", p1.hobby)  // chess
print("Person 2 Hobby: ", p2.hobby)  //chess



// Inheritance in Classes


class Animal{
  var name: String
  init(n: String){
    self.name = n
  }
  func hunting(){
    print("Animal is Hunting")
  }
}


class Buffalo: Animal{
  override func hunting() { //override do function overloading in child class meaning helps u to change the definition of the function
    super.hunting(); //super helps to call methods or get members of public access modifer from child class
    print("buffalo is only out for eating grass")
  }
  func fetch(){
    print("\(name) is getting...")
  }
}

var buffalo = Buffalo(n: "munni")

buffalo.hunting();
buffalo.fetch()


// Final class means this is the end class and this class cannot be inherited

final class Bird: Buffalo{
  override func hunting(){
    super.hunting()
    print("Bird is hunting")
  }
}

class Whale {

}

let eagle = Bird(n: "Fighter")
eagle.hunting() // calling hunting of buffalo then animal then running our own
// Inheritance from a final class 'Bird' is error
// class peacock: Bird{
  
// }

// To Check Any Class is made by inherited  other class or not

// just do

if buffalo is Animal {
  print("Buffalo is Animal means Buffalo is child of animal class")
}

if eagle is Animal{
    print("eagle is Animal means eagle is child of animal class")
}

if eagle is Whale{
    print("eagle is Whale means eagle is child of Whale class")
}else{
      print("eagle is not Whale means eagle is not child of Whale class")

}

// Class casting to parent class using as means when you want to treat child class as parent class use as

// Example

class Cat : Animal {
  func catMeows(){
    print("Cat is meowing")
  }
  
}

let cat = Cat(n: "Black cat")
if let animal = cat as? Animal{
  animal.hunting()// working because animal is now treated as Animal
  animal.catMeows()// not working because animal has lost the properties of cat
}

// init types:
/*
1. Convenience init -> A convenience init is not a "VIP initializer." It's a helper initializer that makes object creation easier by supplying default values or offering an alternative way to initialize an object.
use self.init in convenience init to do that

*/
class Person{
  var name: String
  var age: Int

  init(name: String, age: Int){
    self.name = name
    self.age = age
  }

  // another way to initialize your object
  convenience init(name: String){
   self.init(name: name, age: 18)
  }
}

let p1 = Person(name: "Sonu", age: 21)
let p2 = Person(name: "Sweety")

print("person 1 age: ", p1.age)
print("person 2 age: ", p2.age)
/*
2. Failable Init -> if  init is failed other block of code will run
*/

class Car {
  var carName: String
  var seats: Int

  init?(carName: String, seats: Int){
    if carName.isEmpty || seats == 0{
      print(carName.isEmpty ? "carName is empty" : "Seats cannot be 0")
      return nil
    }
    self.carName = carName
    self.seats =  seats
  }
}

if let car = Car(carName: "Honda", seats: 4){
  print("car Name is \(car.carName) has seats \(car.seats)")
}


/*
Deinit(Destructor) -> runs the code while freeing the memory

runs when the object or instance of any class goes out of the scope

same as useEffect's callback's return call
*/


class Laptop {
  var companyName: String

  init(companyName: String){
    self.companyName = companyName
  }

  deinit{
    print("Deinit called for " + companyName)
  }
}


func createLaptop(){
  let lappy = Laptop(companyName: "Asus")
  print("lappy has been initialized")
}


createLaptop()

// Optional Chaining -> here we can make some members optional

class Residence{
  var rooms: Int = 1

}

class Person{
  var name: String
  var residence: Residence? //has a relationship
  init(name: String){
    self.name = name
  }
}

let john = Person(name: "John")
john.residence = Residence()
john.residence?.rooms = 4
if let roomCount = john.residence?.rooms{
  print("John has residence with some rooms: \(roomCount)")
}else{
    print("John does not have residence")

}


//* Methods in the classes
//? It can Perform method overloading means same method name but different functionality should different on the basis of parameters, return types


class Counter{
  var count: Int = 0

  func Increment(){
    self.count += 1
  }

  func Increment(count: Int){
    self.count += count
  }
}

var partyCounter = Counter()





partyCounter.Increment();
partyCounter.Increment();
print("Increments by  1, 2 times: ", partyCounter.count) //2
partyCounter.Increment(count: 5)
print("Increments by  5 directly: ", partyCounter.count)//7



// generics -> General Methods or classes which can work with all datatypes or satisfy all datatypes
func identity<T>(_ val: T) -> T {
return val
}

// now T here can be any thing even our defined object also
// if you provide it a generic type then


// Access modifers in Class
// 1. open -> Can be accessed from anywhere
// 2. public -> Can be accessed from anywhere 
// 3. internal -> Default -> Can be accessed within the same module
// 4. fileprivate -> Can be accessed within the same file
// 5. private -> Can be accessed within the same class

print(identity<Int>(100))
print(identity<String>("my name is sonu"))


// We can create class Inside the Struct
// we can also create struct inside the class

