# 📘 Basic Introduction to Swift

> Your first steps into the world of Swift programming.
> This guide covers everything from the "Basic Introduction" module — written in simple, easy-to-understand language.

---

## 📂 Files in This Module

| File | What It Covers |
|------|---------------|
| [Basics.swift](file:///d:/Workspace/Desktop/Learning%20Swift/Basic%20Introduction/Basics.swift) | Variables, constants, operators, and loops |
| [Types.swift](file:///d:/Workspace/Desktop/Learning%20Swift/Basic%20Introduction/Types.swift) | All the basic data types in Swift |
| [String.swift](file:///d:/Workspace/Desktop/Learning%20Swift/Basic%20Introduction/String.swift) | Strings, string interpolation, and string methods |

---

## 1️⃣ Variables & Constants

In Swift, you store values using two keywords:

| Keyword | What It Does | Can You Change It Later? |
|---------|-------------|--------------------------|
| `var` | Creates a **variable** | ✅ Yes — you can change its value anytime |
| `let` | Creates a **constant** | ❌ No — once set, it stays forever |

### 🔸 Variable Example (`var`)

```swift
var message = "learning"
print(message)              // output → learning

message = "learning variables"   // ✅ value changed — this is allowed
print(message)              // output → learning variables
```

> 💡 Think of `var` like a **whiteboard** — you can erase and rewrite.

### 🔹 Constant Example (`let`)

```swift
let statusCode = 20
print(statusCode)           // output → 20

// statusCode = 25          // ❌ ERROR! You can't change a let
```

> 💡 Think of `let` like writing in **permanent marker** — once written, it's done.

### 🤔 When to Use Which?

- **Use `let` by default.** It's safer and tells readers "this value won't change."
- **Use `var` only when the value actually needs to change** (like a counter or user input).

---

## 2️⃣ Data Types

Swift has **6 basic data types** you'll use all the time:

| Type | What It Stores | Example | Notes |
|------|---------------|---------|-------|
| `String` | Text | `"my string"` | A sequence of characters |
| `Character` | A single letter/symbol | `"S"` | Just ONE character (still uses quotes) |
| `Int` | Whole numbers | `4`, `-10`, `100` | No decimal point |
| `Bool` | True or False | `true`, `false` | Only two possible values |
| `Double` | Decimal numbers (precise) | `3.142857142857143` | Up to **15 decimal places** — use this by default |
| `Float` | Decimal numbers (less precise) | `3.142857` | Up to **6 decimal places** — uses less memory |

### Code Examples

```swift
let str: String = "my string"
let char: Character = "S"
let integer: Int = 4
let isBool: Bool = true
let double: Double = 22/7    // → 3.142857142857143 (more precise)
let float: Float = 22/7     // → 3.142857 (less precise)
```

### 🔑 Key Difference: `Double` vs `Float`

| | `Double` | `Float` |
|--|---------|---------|
| Precision | ~15 digits after decimal | ~6 digits after decimal |
| Memory | 64-bit | 32-bit |
| When to use | ✅ Default choice | Only when memory is tight |

> 💡 **Rule of thumb:** Always use `Double` unless you have a specific reason to use `Float`.

---

## 3️⃣ Type Inference vs Type Annotation

Swift gives you **two ways** to declare the type of a variable:

### 🔸 Type Inference (Compiler figures it out)

The compiler looks at the value you assigned and **automatically knows** the type.

```swift
var autoInference = "While Initialization"
// Swift sees the quotes → knows it's a String ✅
// You don't need to write ": String"

var boolInferred = true
// Swift sees true → knows it's a Bool ✅
```

### 🔹 Type Annotation (You tell the compiler)

You explicitly write the type using a colon `:` after the variable name.

```swift
var manualAnnotation: Int = 50
// You told Swift: "this is an Int" 📝

var boolAnnotation: Bool = false
// You told Swift: "this is a Bool" 📝
```

### 🤔 When to Use Which?

| Situation | Use |
|-----------|-----|
| The type is obvious from the value | ✅ **Inference** — `var name = "Sonu"` |
| You want to be extra clear | ✅ **Annotation** — `var count: Int = 0` |
| The compiler can't figure it out | ✅ **Annotation** — you must specify |
| Empty variable declared first | ✅ **Annotation** — `var name: String` |

---

## 4️⃣ Operators

### 🔸 Arithmetic Operators

Used for math operations on numbers.

| Operator | What It Does | Example | Result |
|----------|-------------|---------|--------|
| `+` | Addition | `5 + 2` | `7` |
| `-` | Subtraction | `5 - 2` | `3` |
| `*` | Multiplication | `5 * 2` | `10` |
| `/` | Division | `5 / 2` | `2` (integer division) |
| `%` | Modulo (remainder) | `5 % 2` | `1` |

```swift
var a = 5
a = a + 2
print(a)    // output → 7
```

### 🔹 Logical Operators

Used to combine or flip `Bool` values (true/false).

| Operator | Name | What It Does | Example | Result |
|----------|------|-------------|---------|--------|
| `&&` | AND | Both must be true | `true && true` | `true` |
| `\|\|` | OR | At least one must be true | `true \|\| false` | `true` |
| `!` | NOT | Flips the value | `!true` | `false` |

```swift
var mybool: Bool = true

print(mybool && true)       // true  (both are true ✅)
print(mybool || false)      // true  (at least one is true ✅)
print(!mybool)              // false (flipped from true → false 🔄)
print(!mybool || true)      // true  (false || true = true ✅)
```

> 💡 **Memory trick:**
> - `&&` (AND) = **strict** — needs BOTH to be true
> - `||` (OR) = **chill** — just needs ONE to be true
> - `!` (NOT) = **rebel** — flips everything

### 🔸 Relational (Comparison) Operators

Used to compare two values. Always return a `Bool`.

| Operator | Meaning | Example | Result |
|----------|---------|---------|--------|
| `>` | Greater than | `5 > 3` | `true` |
| `<` | Less than | `5 < 3` | `false` |
| `>=` | Greater than or equal to | `5 >= 5` | `true` |
| `<=` | Less than or equal to | `5 <= 3` | `false` |
| `==` | Equal to | `5 == 5` | `true` |
| `!=` | Not equal to | `5 != 3` | `true` |

### 🔹 Ternary Operator

A one-line shortcut for `if-else`. Format: `condition ? valueIfTrue : valueIfFalse`

```swift
var age: Int = 4
print(age > 18 ? "Age greater than 18" : "Age less than 18")
// output → "Age less than 18" (because 4 is NOT > 18)
```

> 💡 Read it like: **"Is age > 18? If yes → first value. If no → second value."**

### 🔸 Compound Assignment Operators

Shorthand for modifying a variable's value:

| Operator | Equivalent To | Example |
|----------|--------------|---------|
| `+=` | `a = a + n` | `a += 1` |
| `-=` | `a = a - n` | `a -= 1` |
| `*=` | `a = a * n` | `a *= 2` |
| `/=` | `a = a / n` | `a /= 2` |
| `%=` | `a = a % n` | `a %= 3` |

> ⚠️ **Swift does NOT have `++` or `--` operators!** They were removed in Swift 3.
> - ❌ `i++` → **Error!**
> - ✅ `i += 1` → **Use this instead**
> - ✅ `i = i + 1` → **Also works**

---

## 5️⃣ Strings

### 🔸 Creating Strings

```swift
// Single-line string
let message = "Single Liner"

// Multi-line string (use triple quotes """)
let multiLineMessage = """
Roses are red,
          Violets are blue,
          Swift is awesome,
And so are you.
"""
```

> 💡 In multi-line strings, **spaces and line breaks are preserved exactly as you write them.**

### 🔹 String Interpolation

This is how you put variables **inside** a string. Use `\(variableName)`.

```swift
let name = "Sonu"
let age = 17

print("My name is \(name) and I am \(age) years old")
// output → My name is Sonu and I am 17 years old
```

You can also use commas in `print()`, but it automatically adds spaces:

```swift
print("My name is", name, "I am", age, "years old")
// output → My name is Sonu I am 17 years old
```

> 💡 **Interpolation `\()` is cleaner** — use it instead of commas when you want full control over spacing.

### 🔸 String Properties & Methods

Here's every string method you've learned, in a quick-reference table:

| Method / Property | What It Does | Example | Output |
|-------------------|-------------|---------|--------|
| `.isEmpty` | Checks if string is empty | `"Sonu".isEmpty` | `false` |
| `.count` | Returns the length | `"Sonu".count` | `4` |
| `.first!` | Returns first character | `"Sonu".first!` | `S` |
| `.last!` | Returns last character | `"Sonu".last!` | `u` |
| `.uppercased()` | Converts to UPPERCASE | `"Sonu".uppercased()` | `"SONU"` |
| `.lowercased()` | Converts to lowercase | `"SONU".lowercased()` | `"sonu"` |
| `.hasPrefix("So")` | Starts with "So"? | `"Sonu".hasPrefix("So")` | `true` |
| `.hasSuffix("nu")` | Ends with "nu"? | `"Sonu".hasSuffix("nu")` | `true` |
| `.append(" Yadav")` | Adds text to the end | `name.append(" Yadav")` | `"Sonu Yadav"` |
| `.split(separator: " ")` | Splits into array | `"Sonu Yadav".split(separator: " ")` | `["Sonu", "Yadav"]` |
| `.contains("is")` | Contains substring? | `"swift is awesome".contains("is")` | `true` |
| `.removeFirst()` | Removes & returns first char | `sentence.removeFirst()` | Removes `"s"` |
| `.removeLast()` | Removes & returns last char | `sentence.removeLast()` | Removes `"e"` |
| `.replacingOccurrences(of:with:)` | Find & replace | `"wift".replacingOccurrences(of: "wift", with: "swift")` | `"swift"` |

> ⚠️ **About the `!` after `.first` and `.last`:**
> These return an **Optional** (the value might not exist — like if the string is empty).
> The `!` is called **force unwrapping** — it tells Swift: *"Trust me, this value exists, just give it to me."*
> If the string IS empty and you use `!`, your program will **crash**. Be careful!

### 🔹 Methods That Change the String vs Return a New One

| Type | Methods | Need `var`? |
|------|---------|-------------|
| **Mutating** (changes original) | `.append()`, `.removeFirst()`, `.removeLast()` | ✅ Yes — must be `var` |
| **Non-mutating** (returns new) | `.uppercased()`, `.lowercased()`, `.replacingOccurrences()`, `.split()` | ❌ Can be `let` |

---

## 6️⃣ Loops

Loops let you **repeat** code multiple times.

### 🔸 `for-in` Loop

Use when you **know how many times** you want to repeat.

#### Closed Range (`...`) — Includes Start AND End

```swift
for number in 1...5 {
    print(number)
}
// output → 1, 2, 3, 4, 5
```

> 💡 `1...5` means **1 to 5, both included**.

#### Half-Open Range (`..<`) — Includes Start, Excludes End

```swift
for n in 5..<10 {
    print(n)
}
// output → 5, 6, 7, 8, 9  (10 is NOT included)
```

> 💡 `..<` is like saying **"up to but not including"**. Useful for array indices.

### 🔹 `stride` — Loop With Custom Steps

When you need more control over the step size or direction.

| Parameter | Meaning |
|-----------|---------|
| `from:` | Starting value |
| `to:` | End value (**excluded**) |
| `through:` | End value (**included**) |
| `by:` | Step size (+1, +2, -1, etc.) |

```swift
// Using `to:` (excludes 10)
for n in stride(from: 1, to: 10, by: 1) {
    print(n)    // → 1, 2, 3, ... 9
}

// Using `through:` (includes 10)
for n in stride(from: 1, through: 10, by: 1) {
    print(n)    // → 1, 2, 3, ... 10
}
```

> 💡 **Easy way to remember:**
> - `to:` → **"go TO the door but don't go through it"** (excludes end)
> - `through:` → **"go THROUGH the door"** (includes end)

### 🔸 Looping Over Arrays

```swift
let fruits = ["Apple", "Banana", "Mango"]

for fruit in fruits {
    print(fruit)
}
// output → Apple, Banana, Mango
```

### 🔹 Looping Over Dictionaries

A **dictionary** is like an array but instead of numbered indexes (0, 1, 2), it uses **custom keys**.

```swift
let document: [String: Any] = [
    "name": "sonu yadav",
    "age": 21
]

for (key, value) in document {
    print("key:", key)
    print("value:", value)
}
```

> ⚠️ **Dictionaries are unordered** — every time you run the code, the key-value pairs might print in a different order!

### 🔸 Reversing a Loop

Two ways to count backwards:

```swift
// Method 1: Using .reversed()
for n in (1...10).reversed() {
    print(n)    // → 10, 9, 8, ... 1
}

// Method 2: Using stride with negative step
for n in stride(from: 10, to: 0, by: -1) {
    print(n)    // → 10, 9, 8, ... 1
}
```

---

## 📋 Quick Reference Cheat Sheet

### Variables & Constants
```swift
var name = "Sonu"       // ✅ Can change later
let age = 21            // ❌ Cannot change
```

### Data Types
```swift
let str: String = "hello"      // Text
let char: Character = "A"      // Single character
let num: Int = 42              // Whole number
let flag: Bool = true          // True or False
let pi: Double = 3.14159       // Precise decimal
let approx: Float = 3.14      // Less precise decimal
```

### Type Declaration
```swift
var inferred = "Swift knows this is a String"     // Inference
var explicit: Int = 100                            // Annotation
```

### Operators
```swift
// Arithmetic:    +  -  *  /  %
// Comparison:    >  <  >=  <=  ==  !=
// Logical:       &&  ||  !
// Ternary:       condition ? yes : no
```

### String Methods
```swift
str.count                    // Length
str.isEmpty                  // Is empty?
str.first!                   // First character
str.last!                    // Last character
str.uppercased()             // "HELLO"
str.lowercased()             // "hello"
str.hasPrefix("he")          // true
str.hasSuffix("lo")          // true
str.contains("ell")          // true
str.append(" world")         // Mutates: "hello world"
str.split(separator: " ")   // ["hello", "world"]
str.removeFirst()            // Removes & returns "h"
str.removeLast()             // Removes & returns "o"
str.replacingOccurrences(of: "hello", with: "hi")  // "hi"
```

### Loops
```swift
for i in 1...5 { }                              // 1 to 5 (inclusive)
for i in 1..<5 { }                              // 1 to 4 (excludes 5)
for i in stride(from: 0, to: 10, by: 2) { }    // 0, 2, 4, 6, 8
for i in stride(from: 0, through: 10, by: 2) { } // 0, 2, 4, 6, 8, 10
for item in array { }                           // Loop over array
for (key, val) in dictionary { }                // Loop over dictionary
for i in (1...10).reversed() { }                // 10 to 1
```

---

## ✅ What You've Learned So Far

- [x] Declaring variables (`var`) and constants (`let`)
- [x] All 6 basic data types — `String`, `Character`, `Int`, `Bool`, `Double`, `Float`
- [x] Type Inference vs Type Annotation
- [x] Arithmetic, Logical, Relational, and Ternary operators
- [x] Compound assignment operators (`+=`, `-=`, etc.) — `i++` doesn't exist in Swift!
- [x] Strings — creation, interpolation, and 14+ string methods
- [x] For loops — closed range, half-open range, stride
- [x] Looping over arrays and dictionaries
- [x] Reversing loops

## ✅ You've Since Completed (in other modules)

- [x] `while` and `repeat-while` loops → [Control Flow](file:///d:/Workspace/Desktop/Learning%20Swift/Control%20Flow/Control%20Flow.md)
- [x] `if` / `else if` / `else` → [Control Flow](file:///d:/Workspace/Desktop/Learning%20Swift/Control%20Flow/Control%20Flow.md)
- [x] `switch` statements (ranges, tuples, `where`, `fallthrough`) → [Control Flow](file:///d:/Workspace/Desktop/Learning%20Swift/Control%20Flow/Control%20Flow.md)
- [x] `guard` statements → [Control Flow](file:///d:/Workspace/Desktop/Learning%20Swift/Control%20Flow/Control%20Flow.md)
- [x] Functions, closures, enums → [Functions](file:///d:/Workspace/Desktop/Learning%20Swift/Functions/Functions.md)

## 🔜 What's Coming Next

- [ ] Optionals deep dive (`?`, `??`, `?.`)
- [ ] Structs & Classes → [Objects](file:///d:/Workspace/Desktop/Learning%20Swift/Objects/Objects.md)

---

> 💬 *"The basics are the foundation. Master them, and everything else becomes easier."*

