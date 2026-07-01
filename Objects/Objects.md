# 🏗️ Objects in Swift

> Object-Oriented Programming in Swift — Structs, Classes, Enumerations, and everything that models real-world entities.
> This guide covers everything from the "Objects" module — written in simple, easy-to-understand language.

---

## 📂 Files in This Module

| File | What It Covers |
|------|---------------|
| [Struct_Classes.swift](file:///d:/Workspace/Desktop/Learning%20Swift/Objects/Struct_Classes.swift) | Structs (value types, mutating, static, subscript, Matrix, nested, extensions), Classes (reference types, init, inheritance, override, final, deinit, optional chaining, method overloading), Generics, Access Modifiers |
| [Enums.swift](file:///d:/Workspace/Desktop/Learning%20Swift/Objects/Enums.swift) | Enumerations — basic, raw values, associated values, methods |

---

## 1️⃣ Structs (Value Types 📦)

A **Struct** is a value type — when you assign or pass a struct, a **copy** is made. Both exist independently in memory.

### 🔸 Key Characteristics

| Feature | Struct |
|---------|--------|
| Type | **Value type** — copied on assignment |
| Inheritance | ❌ Cannot inherit |
| `init` | ✅ Auto-generated memberwise initializer |
| `deinit` | ❌ No destructor — Swift handles cleanup |
| Memory | Stack (faster) |

### 🔹 Basic Struct

```swift
struct Student {
    var name: String
    var age: Int
}

var s1 = Student(name: "Sonu", age: 21)
var s2 = s1              // s2 is a COPY
s2.name = "Rahul kumar"

print(s1.name)           // → "Sonu" (unchanged!)
print(s2.name)           // → "Rahul kumar"
```

> 💡 Changing `s2` does **not** affect `s1` — they are independent copies. This is what "value type" means.

---

## 2️⃣ `mutating` Methods in Structs

By default, methods inside a struct **cannot change** the struct's properties because structs are value types. To allow modification, mark the method with `mutating`.

```swift
struct Point {
    var x: Int
    var y: Int
    
    mutating func moveBy(_ dx: Int, _ dy: Int) {
        x += dx
        y += dy
    }
}

var p1 = Point(x: 2, y: 2)
p1.moveBy(5, 5)
print("x:\(p1.x) y:\(p1.y)")    // → x:7 y:7
```

> 💡 Without `mutating`, trying to modify `x` or `y` inside a method gives a compile error. Think of `mutating` as a permission slip for the method to modify `self`.

### 🔑 When Do You Need `mutating`?

| Scenario | Need `mutating`? |
|----------|-----------------|
| Method reads properties only | ❌ No |
| Method changes a property | ✅ Yes |
| Method reassigns `self` | ✅ Yes |
| Calling from a `let` instance | ❌ Not allowed — must be `var` |

---

## 3️⃣ Static Members

`static` members belong to the **type itself**, not to any instance. Access them directly on the struct/class name — no object creation needed.

```swift
struct MathUtility {
    static var pi = 3.14
    
    static func square(_ number: Int) -> Int {
        return number * number
    }
}

print(MathUtility.square(5))    // → 25
print(MathUtility.pi)           // → 3.14
```

> 💡 Use `static` for utility functions and shared constants that don't need an instance.

### 🔑 Static vs Instance Members

| Feature | Instance | Static |
|---------|----------|--------|
| Belongs to | Each object | The type itself |
| Access | `instance.property` | `TypeName.property` |
| Can use `self` | ✅ Yes (refers to instance) | ❌ No (no instance) |
| Shared across instances | ❌ No | ✅ Yes |

---

## 4️⃣ Subscripts

A **subscript** lets you access data using square brackets `[]`, just like arrays and dictionaries. You can define custom subscripts in your own types.

### 🔸 Basic Subscript — Week Days

```swift
struct Week {
    private var weekdays = ["mon", "tue", "wed", "thurs", "fri", "sat", "sun"]

    subscript(index: Int) -> String {
        get {
            return weekdays[index]
        }
        set(newValue) {
            weekdays[index] = newValue
        }
    }
}

var day = Week()
print(day[5])       // → "sat" (getter)
day[6] = "Sunday"   // setter
print(day[6])       // → "Sunday"
```

### 🔹 Advanced Subscript — Matrix

A 2D Matrix represented internally as a 1D array, accessed with `matrix[row, col]`:

```swift
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Int]

    init(r: Int, c: Int) {
        self.rows = r
        self.columns = c
        self.grid = Array(repeating: 0, count: rows * columns)
    }

    subscript(r: Int, c: Int) -> Int {
        get {
            return grid[(r * columns) + c]
        }
        set(newValue) {
            grid[(r * columns) + c] = newValue
        }
    }
}

var m1 = Matrix(r: 3, c: 4)
m1[0, 2] = 5
m1[2, 3] = 15
print(m1[0, 2])     // → 5
```

> 💡 The formula `(r * columns) + c` converts a 2D `(row, col)` coordinate into a 1D array index. This is how 2D arrays are stored in memory behind the scenes!

### 🔑 Subscript Rules

| Feature | Explanation |
|---------|-------------|
| `get { }` | Called when reading — `matrix[0, 2]` |
| `set(newValue) { }` | Called when writing — `matrix[0, 2] = 5` |
| Multiple parameters | ✅ Supported — `subscript(r: Int, c: Int)` |
| Read-only subscript | Omit `set` — just provide `get` |

---

## 5️⃣ Classes (Reference Types 🔗)

A **Class** is a reference type — when you assign or pass a class instance, both variables **point to the same object** in memory.

### 🔸 Key Characteristics

| Feature | Class |
|---------|-------|
| Type | **Reference type** — shared on assignment |
| Inheritance | ✅ Can inherit other classes |
| `init` | ❌ Must define manually (or provide defaults) |
| `deinit` | ✅ Has destructor — runs on deallocation |
| Memory | Heap (ARC managed) |

### 🔹 Basic Class

```swift
class Person {
    var name: String
    var hobby: String
    
    init(name: String, hobby: String) {
        self.name = name
        self.hobby = hobby
    }
}

var p1 = Person(name: "Sonu", hobby: "Cricket")
var p2 = p1                    // p2 points to SAME object

p2.hobby = "Chess"

print(p1.hobby)                // → "Chess" (changed!)
print(p2.hobby)                // → "Chess"
```

> ⚠️ Both `p1` and `p2` refer to the **same object**. Changing one changes the other — this is reference semantics.

---

## 6️⃣ Structs vs Classes — Key Differences

| Feature | Struct 📦 | Class 🔗 |
|---------|-----------|----------|
| Type | Value type (copied) | Reference type (shared) |
| Assignment | Creates a **copy** | Creates a **reference** |
| Inheritance | ❌ No | ✅ Yes |
| Deinitializer (`deinit`) | ❌ No | ✅ Yes |
| Memberwise init | ✅ Auto-generated | ❌ Must write manually |
| Identity check (`===`) | ❌ No | ✅ Yes |
| Memory | Stack (faster) | Heap (slower, ARC managed) |
| `mutating` keyword | ✅ Needed for modifying methods | ❌ Not needed |
| Nesting | Can contain classes | Can contain structs |

> 💡 **Swift's recommendation:** Use **structs by default**. Only use classes when you need inheritance or reference semantics.

---

## 7️⃣ Inheritance

**Inheritance** is a class-only feature — a child class inherits all properties and methods from its parent class.

### 🔸 Basic Inheritance

```swift
class Animal {
    var name: String
    init(n: String) {
        self.name = n
    }
    func hunting() {
        print("Animal is Hunting")
    }
}

class Buffalo: Animal {
    override func hunting() {
        super.hunting()          // Call parent's version first
        print("buffalo is only out for eating grass")
    }
    func fetch() {
        print("\(name) is getting...")
    }
}

var buffalo = Buffalo(n: "munni")
buffalo.hunting()     // → "Animal is Hunting" then "buffalo is only out for eating grass"
buffalo.fetch()       // → "munni is getting..."
```

### 🔑 Key Inheritance Keywords

| Keyword | What It Does | Example |
|---------|-------------|---------|
| `: ParentClass` | Inherits from parent | `class Dog: Animal { }` |
| `override` | Redefine parent's method in child | `override func hunting() { }` |
| `super` | Call parent's implementation | `super.hunting()` |
| `final` | Prevent further subclassing | `final class Bird: Animal { }` |

### 🔹 `final` Class — No More Inheriting

```swift
final class Bird: Buffalo {
    override func hunting() {
        super.hunting()
        print("Bird is hunting")
    }
}

// class Peacock: Bird { }  // ❌ ERROR! Cannot inherit from a final class
```

> 💡 Use `final` when a class is complete and should not be extended further. It also gives the compiler a performance optimization hint.

---

## 8️⃣ Type Checking with Inheritance (`is`)

Check if an instance is of a certain class (including its parents):

```swift
if buffalo is Animal {
    print("Buffalo is child of Animal class")       // ✅ true
}

if eagle is Animal {
    print("Eagle is child of Animal class")         // ✅ true (Bird → Buffalo → Animal)
}

if eagle is Whale {
    print("Eagle is child of Whale class")
} else {
    print("Eagle is NOT child of Whale class")      // ✅ This runs
}
```

> 💡 `is` checks the entire inheritance chain, not just the direct parent.

---

## 9️⃣ Type Casting (`as`, `as?`)

Cast an instance to a parent or child class type:

```swift
class Cat: Animal {
    func catMeows() {
        print("Cat is meowing")
    }
}

let cat = Cat(n: "Black cat")
if let animal = cat as? Animal {
    animal.hunting()        // ✅ Works — Animal's method
    // animal.catMeows()    // ❌ Error — Animal doesn't have catMeows()
}
```

### 🔑 Casting Summary

| Operator | What It Does | Safe? |
|----------|-------------|-------|
| `as` | Guaranteed upcast (child → parent) | ✅ Always works |
| `as?` | Conditional downcast (parent → child) | ✅ Returns Optional |
| `as!` | Forced downcast | ⚠️ Crashes if wrong |

> 💡 When you cast a `Cat` to an `Animal`, the cat-specific methods are **hidden** — you can only call `Animal` methods on it.

---

## 🔟 Initializer Types

### 🔸 Designated Init (Standard)

The main initializer — sets all stored properties:

```swift
class Person {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
```

### 🔹 Convenience Init — Helper Initializer

A **convenience init** calls the designated init with default values, giving an alternative way to create objects:

```swift
class Person {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    convenience init(name: String) {
        self.init(name: name, age: 18)    // Calls designated init
    }
}

let p1 = Person(name: "Sonu", age: 21)
let p2 = Person(name: "Sweety")

print(p1.age)    // → 21
print(p2.age)    // → 18 (default from convenience init)
```

> 💡 A convenience init **must** call `self.init(...)` — it can't set properties directly.

### 🔸 Failable Init (`init?`)

An initializer that can **fail** — returns `nil` if the inputs are invalid:

```swift
class Car {
    var carName: String
    var seats: Int

    init?(carName: String, seats: Int) {
        if carName.isEmpty || seats == 0 {
            print(carName.isEmpty ? "carName is empty" : "Seats cannot be 0")
            return nil
        }
        self.carName = carName
        self.seats = seats
    }
}

if let car = Car(carName: "Honda", seats: 4) {
    print("car Name is \(car.carName) has seats \(car.seats)")
}
```

### 🔑 Init Types Summary

| Init Type | Syntax | Purpose |
|-----------|--------|---------|
| **Designated** | `init(...)` | Main init — sets all properties |
| **Convenience** | `convenience init(...)` | Helper init — calls `self.init` with defaults |
| **Failable** | `init?(...)` | Can return `nil` on bad input |
| **Required** | `required init(...)` | All subclasses must implement this |

---

## 1️⃣1️⃣ Deinitializer (`deinit`)

A **deinit** runs automatically when a class instance is **freed from memory** (goes out of scope). Only classes have `deinit` — not structs.

```swift
class Laptop {
    var companyName: String

    init(companyName: String) {
        self.companyName = companyName
    }

    deinit {
        print("Deinit called for " + companyName)
    }
}

func createLaptop() {
    let lappy = Laptop(companyName: "Asus")
    print("lappy has been initialized")
}   // ← lappy goes out of scope here, deinit runs!

createLaptop()
// Output:
// lappy has been initialized
// Deinit called for Asus
```

> 💡 Think of `deinit` like React's `useEffect` cleanup return — code that runs when the "component" is removed. Perfect for closing connections, releasing resources, etc.

---

## 1️⃣2️⃣ Optional Chaining (`?.`)

Access properties or methods on an optional value — if any link is `nil`, the entire chain returns `nil` safely:

```swift
class Residence {
    var rooms: Int = 1
}

class Person {
    var name: String
    var residence: Residence?      // Optional — might not have one

    init(name: String) {
        self.name = name
    }
}

let john = Person(name: "John")
john.residence = Residence()
john.residence?.rooms = 4

if let roomCount = john.residence?.rooms {
    print("John has \(roomCount) rooms")      // → "John has 4 rooms"
} else {
    print("John does not have residence")
}
```

> 💡 The `?` in `john.residence?.rooms` means: "If `residence` exists, access `rooms`. If it's `nil`, return `nil` instead of crashing."

---

## 1️⃣3️⃣ Method Overloading

**Method overloading** means having methods with the **same name** but **different parameters** or **return types**:

```swift
class Counter {
    var count: Int = 0

    func Increment() {
        self.count += 1
    }

    func Increment(count: Int) {
        self.count += count
    }
}

var partyCounter = Counter()
partyCounter.Increment()              // count → 1
partyCounter.Increment()              // count → 2
partyCounter.Increment(count: 5)      // count → 7
```

> 💡 Swift decides which method to call based on the **arguments** you pass. Same name, different behavior!

---

## 1️⃣4️⃣ Nested Structs

You can define a struct **inside** another struct. Access the inner type using `Outer.Inner`:

```swift
struct House {
    struct Room {
        var rooms: Int
    }
}

var rooms = House.Room(rooms: 4)
print(rooms.rooms)    // → 4
```

> 💡 Nested types keep related types organized together. The inner type is namespaced under the outer type — `House.Room` won't conflict with any other `Room` type.

---

## 1️⃣5️⃣ Extensions

**Extensions** let you add new functionality to an existing type — even types you didn't create (like `Int`, `String`, `Array`). You can add methods, computed properties, and protocol conformances.

```swift
struct Circle {
    var radius: Double
}

extension Circle {
    func areaOfCircle() -> Double {
        return 3.14 * radius * radius
    }
}

let c = Circle(radius: 70)
print("area of circle:", c.areaOfCircle())    // → 15386.0
```

### 🔑 Extension Rules

| Can Add | Cannot Add |
|---------|------------|
| ✅ Instance & type methods | ❌ Stored properties |
| ✅ Computed properties | ❌ Property observers to existing properties |
| ✅ New initializers | ❌ Designated initializers (class only) |
| ✅ Subscripts | ❌ Override existing methods |
| ✅ Nested types | |
| ✅ Protocol conformances | |

> 💡 Extensions are like **attaching a new room to your house** — you can add functionality without modifying the original blueprint.

---

## 1️⃣6️⃣ Generics

**Generics** let you write flexible, reusable functions and types that work with **any data type**. The placeholder type is conventionally named `T`.

```swift
func identity<T>(_ val: T) -> T {
    return val
}

print(identity(100))                 // → 100 (T = Int)
print(identity("my name is sonu"))   // → "my name is sonu" (T = String)
```

### 🔑 Generics Summary

| Feature | Syntax | Example |
|---------|--------|---------|
| Generic function | `func f<T>(_ val: T) -> T` | `identity(42)` |
| Generic struct | `struct Stack<Element> { }` | `Stack<Int>()` |
| Generic class | `class Box<T> { var value: T }` | `Box<String>()` |
| Multiple type params | `func f<T, U>(_ a: T, _ b: U)` | `f(1, "hello")` |
| Type constraints | `func f<T: Comparable>(_ a: T)` | Only types conforming to `Comparable` |

> 💡 `T` can be **anything** — even your own custom types. Generics power most of Swift's standard library (`Array<Element>`, `Dictionary<Key, Value>`, `Optional<Wrapped>`).

---

## 1️⃣7️⃣ Access Modifiers

Access modifiers control **who can see and use** your properties and methods.

| Modifier | Visibility | Use Case |
|----------|-----------|----------|
| `open` | Anywhere + can be subclassed/overridden from other modules | Frameworks/libraries you want others to extend |
| `public` | Anywhere, but **cannot** be subclassed from other modules | Public API |
| `internal` | Same **module** only (default) | Normal app code |
| `fileprivate` | Same **file** only | Helper functions used only in one file |
| `private` | Same **scope** (class/struct) only | Implementation details |

### 🔸 Visibility from most open → most restrictive:

```
open  →  public  →  internal  →  fileprivate  →  private
 👁️          👁️          👁️              👁️              🔒
```

```swift
class BankAccount {
    public var ownerName: String           // Anyone can see
    private var balance: Double = 0        // Only this class can see
    fileprivate var accountId: String      // Only this file can see
    
    internal init(owner: String, id: String) {    // Same module
        self.ownerName = owner
        self.accountId = id
    }
}
```

> 💡 **Default is `internal`** — visible within the same module. For app development, you rarely need `open` or `public` unless building a framework.

---

## 1️⃣8️⃣ Enumerations (Enums)

An **enum** defines a group of related values as a type. Swift's enums are **far more powerful** than in most languages.

### 🔸 Basic Enum

```swift
enum Direction {
    case north
    case south
    case east
    case west
}

let move = Direction.south

switch move {
case .north:
    print("Moving North")
case .south:
    print("Moving south")
case .east:
    print("Moving east")
case .west:
    print("Moving west")
}
```

### 🔹 Enums with Raw Values

Back each case with a real value (String, Int, etc.):

```swift
enum Week: String {
    case monday = "Monday"
    case tuesday = "Tuesday"
    case wednesday = "Wednesday"
    case thursday = "Thursday"
    case friday = "Friday"
    case saturday = "Saturday"
    case sunday = "Sunday"
}

let today = Week.monday
print(today)                      // → monday
print(today.rawValue)             // → "Monday"

if let day = Week(rawValue: "Sunday") {
    print(day)                    // → sunday
}
```

> 💡 Use `rawValue` to get the backing value. Use `init(rawValue:)` to create from a raw value (returns Optional since it might not match any case).

### 🔸 Enums with Associated Values

Attach **data** to each case — different cases can have different associated data:

```swift
enum Result {
    case success(data: String)
    case failed(error: String)
}

let apiResponse = Result.success(data: "User is Loaded")

switch apiResponse {
case .success(let data):
    print("user data is:", data)       // → "user data is: User is Loaded"
case .failed(let error):
    print("Log the error:", error)
}
```

> 💡 Associated values make enums incredibly expressive — they can carry payloads of different types for each case!

### 🔹 Enums with Methods

You can define methods inside enums that use `switch self`:

```swift
enum TrafficLight {
    case red, green, yellow

    func action() {
        switch self {
        case .red:
            print("Traffic light is red — STOP")
        case .yellow:
            print("Traffic light is yellow — SLOW DOWN")
        case .green:
            print("Traffic light is green — GO")
        }
    }
}

let light = TrafficLight.red
light.action()    // → "Traffic light is red — STOP"
```

### 🔑 Enum Feature Summary

| Feature | Syntax | Example |
|---------|--------|---------|
| Basic cases | `case north, south` | `Direction.north` |
| Raw values | `enum Week: String` | `Week.monday.rawValue` → `"Monday"` |
| Associated values | `case success(data: String)` | `Result.success(data: "OK")` |
| Methods | `func action() { switch self { } }` | `light.action()` |
| Init from raw | `Week(rawValue: "Sunday")` | Returns `Week?` |

---

## 📋 Quick Reference Cheat Sheet

### Structs
```swift
struct Point {
    var x: Int
    var y: Int
    mutating func moveBy(_ dx: Int, _ dy: Int) { x += dx; y += dy }
    static func origin() -> Point { Point(x: 0, y: 0) }
}
```

### Classes
```swift
class Animal {
    var name: String
    init(name: String) { self.name = name }
    deinit { print("Freed") }
}
class Dog: Animal {
    override init(name: String) { super.init(name: name) }
}
```

### Inheritance
```swift
class Parent { func speak() { } }
class Child: Parent { override func speak() { super.speak() } }
final class Leaf: Child { }       // No more subclassing
```

### Init Types
```swift
init(name: String, age: Int) { }              // Designated
convenience init(name: String) { self.init(name: name, age: 0) }  // Convenience
init?(value: Int) { if value < 0 { return nil } }  // Failable
```

### Subscripts
```swift
subscript(index: Int) -> String {
    get { return items[index] }
    set { items[index] = newValue }
}
```

### Type Checking & Casting
```swift
obj is Animal              // true/false
obj as? Dog                // conditional downcast → Dog?
obj as! Dog                // forced downcast — crashes if wrong
type(of: obj)              // get runtime type
```

### Nested Structs & Extensions
```swift
struct Outer { struct Inner { var x: Int } }  // Nested
extension Circle { func area() -> Double { 3.14 * r * r } }  // Extension
```

### Generics
```swift
func identity<T>(_ val: T) -> T { return val }
identity(42)              // T = Int
identity("hello")         // T = String
```

### Access Modifiers
```swift
open class A { }           // Subclass from anywhere
public var x = 0           // Visible anywhere
internal var y = 0         // Same module (default)
fileprivate var z = 0      // Same file
private var w = 0          // Same scope
```

### Enums
```swift
enum Direction { case north, south, east, west }
enum Week: String { case monday = "Monday" }    // Raw values
enum Result { case success(data: String) }      // Associated values
```

---

## ✅ What You've Learned in This Module

- [x] Structs — value types, automatic memberwise init, copying behavior
- [x] `mutating` — allowing struct methods to modify properties
- [x] Static members — type-level properties and methods
- [x] Subscripts — custom `[]` access with `get` and `set`
- [x] Matrix with subscript — 2D grid stored as 1D array
- [x] Nested structs — `Outer.Inner` namespacing
- [x] Extensions — adding methods to existing types
- [x] Classes — reference types, shared on assignment
- [x] Designated init — standard initializer
- [x] Convenience init — helper init with `self.init`
- [x] Failable init (`init?`) — returns `nil` on invalid input
- [x] Deinit — cleanup code on deallocation
- [x] Inheritance — `: ParentClass`
- [x] `override` — redefine parent methods
- [x] `super` — call parent implementation
- [x] `final` — prevent subclassing
- [x] Type checking with `is` in inheritance
- [x] Type casting with `as?` and `as`
- [x] Optional chaining (`?.`) — safe property access
- [x] Method overloading — same name, different parameters
- [x] Generics — `func identity<T>(_ val: T) -> T`
- [x] Access modifiers — `open`, `public`, `internal`, `fileprivate`, `private`
- [x] Enums — basic, raw values, associated values, methods
- [x] Structs inside classes & classes inside structs

## 🔜 What's Coming Next

- [ ] Computed properties — `var fullName: String { return "\(first) \(last)" }`
- [ ] Property observers — `willSet` and `didSet`
- [ ] `lazy` properties — initialized on first access
- [ ] Protocols — contracts that types conform to

---

> 💬 *"Objects turn your code from a flat script into a living model of the world."*
