# ⚙️ Functions in Swift

> Reusable blocks of code, closures, and enumerations.
> This guide covers function syntax, parameters (external/internal/`_`/default), return values, tuples, variadic params, `inout`, `guard`, closures, function types as variables, and basic enums — all from your code in this module.

---

## 📂 Files in This Module

| File | What It Covers |
|------|---------------|
| [functions.swift](file:///d:/Workspace/Desktop/Learning%20Swift/Functions/functions.swift) | All topics below |

---

## 1️⃣ What is a Function?

A **function** is a small, named piece of code that you can call any number of times. It helps **reduce redundancy** and keeps code **organized**.

### 🔸 Syntax

```swift
func identifier(parameters: Type, ...) -> ReturnType {
    // statements
    return value    // optional if Void
}
```

### 🔹 Simplest Function — No Parameters, No Return

```swift
func greet() {
    print("Hello from Swift function")
}

greet()    // → "Hello from Swift function"
```

---

## 2️⃣ Parameters & Return Values

### 🔸 Function with Parameters and Return Value

```swift
func addition(a: Int, b: Int) -> Int {
    return a + b
}

print(addition(a: 5, b: 10))    // → 15
```

> 💡 By default, the **external** (caller-facing) and **internal** (body-facing) parameter names are the **same**.

---

## 3️⃣ External vs Internal Parameters

Swift's **unique feature** — function parameters have **two names**:

| Name | Who Uses It | Where |
|------|------------|-------|
| **External** (argument label) | The **caller** | At the call site |
| **Internal** (parameter name) | The **body** | Inside the function |

### 🔸 Default — Same Name for Both

```swift
func addition(a: Int, b: Int) -> Int {    // a, b used internally
    return a + b
}
addition(a: 5, b: 10)                     // a, b used externally too
```

### 🔹 `_` Wildcard — No External Name

When the label would be redundant, use `_` to omit it:

```swift
func addtion2(_ a: Int, _ b: Int) -> Int {
    return a + b
}
print(addtion2(5, 10))    // → 15  (no labels needed!)
```

### 🔸 Custom External Name — Different from Internal

Give a more readable external name while keeping a shorter internal name:

```swift
func addtion3(first num1: Int, second num2: Int) -> Int {
    //          ↑ external   ↑ internal
    return num1 + num2           // uses internal names
}
print(addtion3(first: 5, second: 10))    // uses external names
```

### 🔑 Parameter Label Summary

| Declaration | Call Site | When to Use |
|-------------|-----------|-------------|
| `func f(name: String)` | `f(name: "Sonu")` | Default — clear and readable |
| `func f(for name: String)` | `f(for: "Sonu")` | More natural reading at call site |
| `func f(_ name: String)` | `f("Sonu")` | When the label would be redundant |

> 💡 **Swift's philosophy:** Function calls should read like English sentences.

---

## 4️⃣ Default Parameter Values

Give parameters a **fallback value** — the caller can omit them:

```swift
func namaste(greet: String = "namaste") {
    print(greet)
}

namaste()                                  // → "namaste" (uses default)
namaste(greet: "My very Greetings to you") // → "My very Greetings to you"
```

> 💡 Parameters with default values become **optional** at the call site. Non-default parameters are still required.

---

## 5️⃣ Returning Tuples from Functions

Functions can return **multiple values** using tuples — no need to create a struct for simple grouped data:

```swift
let arr = [1, 2, 3, 0, 559, 89, 56]

func getMinMaxFromArray(arr: [Int]) -> (min: Int, max: Int) {
    return (min: arr.min()!, max: arr.max()!)
}

print(getMinMaxFromArray(arr: arr))    // → (min: 0, max: 559)
```

> 💡 **Named tuple elements** like `min:` and `max:` let you access results by name: `result.min`, `result.max`.

---

## 6️⃣ Variadic Parameters (`Type...`)

Accept **multiple values** of the same type without using an array. Internally, Swift converts them into an array:

```swift
func avg(nums: Double...) -> Double {
    let total = nums.reduce(0, +)
    return total / Double(nums.count)
}

print(avg(nums: 1, 2, 3, 8, 9, 9, 5))    // → 5.285714285714286
```

> 💡 `nums` is treated as `[Double]` inside the function, so you can use array methods like `.reduce()` and `.count` on it.

### 🔸 `reduce(0, +)` Explained

| Part | Meaning |
|------|---------|
| `reduce` | Combines all elements into a single value |
| `0` | Starting value (initial accumulator) |
| `+` | The operation to apply — adds each element to the accumulator |

So `[1, 2, 3].reduce(0, +)` = `0 + 1 + 2 + 3` = `6`

---

## 7️⃣ `inout` Parameters — Pass by Reference

By default, Swift function parameters are **constants** — you can't modify them, and changes don't affect the original. Use `inout` to pass by **reference**:

```swift
var x = 10, y = 20
print("Before: x:\(x), y:\(y)")    // → Before: x:10, y:20

func swapValues(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

swapValues(&x, &y)    // ← Pass with & to indicate address
print("After: x:\(x), y:\(y)")     // → After: x:20, y:10
```

### 🔑 Key Rules for `inout`

| Rule | Explanation |
|------|-------------|
| Use `inout` in declaration | `func f(_ a: inout Int)` |
| Use `&` when calling | `f(&variable)` |
| Must pass a `var` | Cannot pass `let` constants — they can't be modified |
| Changes the original | The original variable is modified, not a copy |

> 💡 This is like **pointers** in C — you're passing the address of the variable, so changes inside the function affect the original.

---

## 8️⃣ `guard` in Functions

`guard` provides **early exit** — if the condition fails, you must leave the scope:

```swift
func printSqr(numInStr: String) {
    guard let n = Int(numInStr) else {
        print("Failed to convert String to number")
        return
    }
    print(n * n)    // n is safe to use here ✅
}

printSqr(numInStr: "8")      // → 64
printSqr(numInStr: "Hello")  // → "Failed to convert..."
```

### 🔸 `guard` vs `if let`

| Feature | `if let` | `guard let` |
|---------|----------|-------------|
| Value lives | Inside `if` block only | After `guard` (rest of function) |
| Block contains | Success code | Failure code |
| Must exit? | ❌ No | ✅ Yes — `return`, `break`, `throw` |
| Best for | Brief use of the value | Rest of function needs the value |

---

## 9️⃣ Function Types as Variables

In Swift, functions are **first-class citizens** — you can assign them to variables, pass them as arguments, and return them from other functions:

```swift
let addOperation: (Int, Int) -> Int = addition

print("Addition:", addOperation(5, 11))    // → 16
```

### 🔑 Function Type Syntax

| Function | Its Type |
|----------|---------|
| `func add(a: Int, b: Int) -> Int` | `(Int, Int) -> Int` |
| `func greet()` | `() -> Void` |
| `func makeCount() -> () -> Int` | `() -> (() -> Int)` |

> 💡 The type `(Int, Int) -> Int` means "a function that takes two Ints and returns an Int."

---

## 🔟 Closures (Anonymous Functions)

A **closure** is a function without a name — a block of code you can store, pass around, and execute later. Closures **capture** variables from their surrounding scope.

### 🔸 Your Example — Counter Closure

```swift
func makeCount() -> () -> Int {
    var count = 0
    let counter = {
        count += 1
        return count
    }
    return counter
}

let counter = makeCount()

print(counter())    // → 1
print(counter())    // → 2
print(counter())    // → 3
print(counter())    // → 4
```

### 🔹 How This Works Step by Step

```
1. makeCount() creates a variable `count = 0`
2. It creates a closure that captures `count`
3. It returns that closure
4. Each call to counter() increments the captured `count`
5. The closure "remembers" count between calls — this is called "capturing"
```

### 🔑 Key Closure Concepts

| Concept | Explanation |
|---------|-------------|
| **Anonymous** | No `func` keyword, no name |
| **Captures variables** | Can access and modify variables from the outer scope |
| **Retains state** | Captured variables persist between calls |
| **First-class** | Can be assigned to variables, passed as arguments, returned from functions |
| **Return type** | `() -> Int` means "a closure that takes nothing and returns an Int" |

> 💡 You've already used closures without realizing it! In `arr.map({ $0 * 2 })`, the `{ $0 * 2 }` is a closure.

### 🔸 Closure Syntax Variations

```swift
// Full closure syntax
let multiply = { (a: Int, b: Int) -> Int in
    return a * b
}

// Shorthand with $0, $1
let multiply2: (Int, Int) -> Int = { $0 * $1 }

// As function argument
arr.map({ val in val * 2 })    // Named parameter
arr.map({ $0 * 2 })            // Shorthand parameter
```

---

## 1️⃣1️⃣ Basic Enumerations (Enums)

An **enum** defines a group of related values as a type. You've used this with `switch`:

### 🔸 Defining an Enum

```swift
enum Direction {
    case north
    case south
    case east
    case west
}
```

### 🔹 Using with `switch`

```swift
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

> 💡 Inside the `switch`, you can use the shorthand `.south` instead of `Direction.south` because Swift **infers the type**.

> 💡 When switching on an enum, Swift knows all possible cases — so you **don't need `default:`** if you cover every case!

---

## 📋 Quick Reference Cheat Sheet

### Function Basics
```swift
func greet() { }                              // No params, no return
func add(a: Int, b: Int) -> Int { a + b }     // Params + return
```

### Parameter Labels
```swift
func f(name: String)                    // Default: same label
func f(_ name: String)                  // No label
func f(for name: String)               // Custom label
```

### Default Values
```swift
func f(x: Int = 10) { }               // x is optional at call site
```

### Tuple Returns
```swift
func f() -> (min: Int, max: Int) { (1, 100) }
```

### Variadic Parameters
```swift
func f(nums: Int...) { }              // nums is [Int] internally
```

### inout (Pass by Reference)
```swift
func f(_ a: inout Int) { a += 1 }
f(&variable)                           // Must use &
```

### Closures
```swift
let closure = { (a: Int) -> Int in a * 2 }
let short: (Int) -> Int = { $0 * 2 }
```

### Function Types
```swift
let operation: (Int, Int) -> Int = addition
```

### Enums
```swift
enum Color { case red, green, blue }
let c = Color.red
```

---

## ✅ What You've Learned in This Module

- [x] Defining functions with `func`
- [x] Functions with parameters and return values (`-> Type`)
- [x] External vs internal parameter names
- [x] `_` wildcard to omit argument labels
- [x] Default parameter values
- [x] Returning tuples from functions
- [x] Variadic parameters (`Type...`) with `reduce`
- [x] `inout` parameters — pass by reference with `&`
- [x] `guard let` — early exit with safe unwrapping
- [x] Function types as variables — `(Int, Int) -> Int`
- [x] Closures — anonymous functions that capture state
- [x] Basic enums — defining and using with `switch`

## 🔜 What's Coming Next

- [ ] Trailing closure syntax — cleaner closure calls
- [ ] `@escaping` closures — closures that outlive the function
- [ ] `@autoclosure` — lazy evaluation
- [ ] Higher-order functions — functions that take/return functions
- [ ] Enum raw values and associated values
- [ ] Enum methods and computed properties

---

> 💬 *"Functions are the building blocks of clean code — they turn chaos into structure."*
