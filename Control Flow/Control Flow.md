# 🔀 Control Flow in Swift

> Making decisions, directing execution, and controlling loops.
> This guide covers `if/else`, `switch` (ranges, tuples, `where`, `fallthrough`), `guard`, `while`, `repeat-while`, `break`, `continue`, labeled statements, `where` in loops, and `defer` — all from your code in this module.

---

## 📂 Files in This Module

| File | What It Covers |
|------|---------------|
| [ControlFlow.swift](file:///d:/Workspace/Desktop/Learning%20Swift/Control%20Flow/ControlFlow.swift) | All control flow topics below |

---

## 1️⃣ `if` / `else if` / `else`

The most basic way to make decisions in Swift. **No parentheses required** around the condition (unlike C/Java).

### 🔸 Basic Syntax

```swift
if condition {
    // runs if condition is true
} else if anotherCondition {
    // runs if first was false, but this is true
} else {
    // runs if everything above was false
}
```

### 🔹 Your Example — Temperature Checker

```swift
var temp = Int.random(in: 1...40)

if temp < 16 {
    print("Cold", temp)
} else if temp < 25 {
    print("Room Temperature", temp)
} else {
    print("Hot", temp)
}
```

> 💡 `Int.random(in: 1...40)` generates a random integer between 1 and 40 (inclusive). Each run gives a different result!

### 🔑 Key Points

| Feature | Swift | Other Languages |
|---------|-------|----------------|
| Parentheses around condition | ❌ Not required | ✅ Required in C/Java |
| Curly braces `{}` | ✅ Always required | Sometimes optional for one-liners |
| Condition must be `Bool` | ✅ Strictly `Bool` | Some languages allow `0`/`1` |

> ⚠️ In Swift, `if 1 { }` is an **error** — you must write `if 1 == 1 { }`. Swift doesn't treat numbers as booleans.

---

## 2️⃣ Type Checking & Type Casting

Swift is **type-safe**, which means you often need to check or convert types explicitly.

### 🔸 `is` Keyword — Check the Type

```swift
var val = "String"

if val is Int {
    print("It is Int")
} else {
    print("It is not Int")    // ← This prints
}
```

### 🔹 `type(of:)` — See the Type at Runtime

```swift
var num = "42"
print(type(of: num))    // → String
```

### 🔸 `if let` — Safe Type Casting (Optional Binding)

When you want to **convert** a value from one type to another (e.g., `String` → `Int`), the conversion might fail. Use `if let` to handle both cases safely.

```swift
var num = "42"
if let numInt = Int(num) {
    print("Typecasted to Num")       // ✅ Runs — "42" converts to 42
} else {
    print("Typecasted Failed")
}

num = "Hello"
if let numInt = Int(num) {
    print("Typecasted to Num")
} else {
    print("Typecasted Failed")       // ✅ Runs — "Hello" can't become an Int
}
```

> 💡 **How `if let` works:**
> 1. `Int(num)` tries to convert the string to an `Int`
> 2. If it succeeds → the value is stored in `numInt` and the `if` block runs
> 3. If it fails → `numInt` is `nil` and the `else` block runs

### 🔑 Type Checking Summary

| Tool | Purpose | Returns | Example |
|------|---------|---------|---------|
| `is` | Check if value is a type | `Bool` | `val is Int` |
| `type(of:)` | Get the actual type | `Type` | `type(of: num)` → `String` |
| `Int(string)` | Convert String → Int | `Int?` (Optional) | `Int("42")` → `42` |
| `if let` | Safely unwrap the result | Unwrapped value or `nil` | `if let n = Int(str) { }` |

---

## 3️⃣ `switch` Statements

Swift's `switch` is **far more powerful** than in most languages. It supports ranges, tuples, `where` clauses, value binding, and `fallthrough`.

### 🔸 Key Differences from Other Languages

| Feature | Swift | C / Java / JS |
|---------|-------|---------------|
| Fall-through | ❌ No (by default) | ✅ Yes (needs `break`) |
| Must be exhaustive | ✅ Yes (needs `default`) | ❌ No |
| Supports ranges | ✅ Yes (`0..<10`) | ❌ No |
| Supports tuples | ✅ Yes | ❌ No |
| Supports `where` clauses | ✅ Yes | ❌ No |

### 🔹 Switch with Ranges

```swift
var temp = Int.random(in: 0...51)

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
    print("Very Hot", temp)
}
```

### 🔸 Switch with `where` Clauses

When you don't have clean ranges or need custom conditions:

```swift
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
    print("Very Hot", temp)
}
```

> 💡 `case let x` binds the value to `x`, then `where x < 10` adds a condition.

### 🔹 Switch with Tuples — Pattern Matching

Match **multiple values at once** using tuples. Your quadrant example is a perfect use case:

```swift
let quadrantValues = (Int.random(in: -1...1), Int.random(in: -1...1))

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
```

> 💡 **Tuples in switch** let you match combinations of values — super useful for coordinate systems, state machines, etc.

### 🔸 `fallthrough` — Force Execution of the Next Case

By default, Swift **does NOT** fall through to the next case. Use `fallthrough` when you explicitly want it:

```swift
let dayNumber = Int.random(in: 1...7)

switch dayNumber {
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
```

> 💡 When `fallthrough` is used, the **next case executes regardless of its condition**. If `dayNumber` is 1, it prints "Weekday" five times because it falls through cases 1→2→3→4→5.

> ⚠️ `fallthrough` does **not** check the next case's condition — it blindly falls through. Use with caution!

### 🔑 How Swift Evaluates `switch`

```
┌──────────────┐
│  temp = 25   │
└──────┬───────┘
       │
       ▼
  case 0..<10?  ─ NO ─▶ case 10..<20?  ─ NO ─▶ case 20..<30?  ─ YES!
                                                      │
                                                      ▼
                                               print("Normal")
                                               ✅ STOPS HERE
                                               (no fall-through)
```

---

## 4️⃣ `guard` Statement

`guard` is Swift's **early exit** pattern. It checks a condition — if the condition is **false**, you must exit the current scope.

### 🔸 `guard let` — Safe Unwrapping with Early Exit

```swift
func printSqr(numInStr: String) {
    guard let n = Int(numInStr) else {
        print("Failed to convert String to number")
        return    // ← MUST exit if conversion fails
    }
    // If we reach here, `n` is guaranteed to be a valid Int ✅
    print(n * n)
}
```

### 🔹 `guard` vs `if let`

| Feature | `if let` | `guard let` |
|---------|----------|-------------|
| Where the value lives | Inside the `if` block only | Available **after** the guard (rest of function) |
| What's in the block | The **success** code | The **failure** code |
| Must exit in block? | ❌ No | ✅ Yes — must `return`, `break`, `continue`, or `throw` |
| Best for | Short operations with the unwrapped value | Functions where you need the value for the rest of the code |

> 💡 **Rule of thumb:** Use `guard` when you need the unwrapped value for the **rest of the function**. Use `if let` when you only need it **briefly**.

---

## 5️⃣ `while` & `repeat-while` Loops

Use these when you **don't know** how many times you need to loop.

### 🔸 `while` Loop — Check First, Then Run

The condition is checked **before** each iteration. If false from the start, the body **never runs**.

```swift
var i = 0

while i <= 10 {
    print("Iterator i:", i)
    i = i + 1
}
// Prints: 0, 1, 2, 3, ... 10
```

### 🔹 `repeat-while` Loop — Run First, Then Check

The body runs **at least once**, then the condition is checked.

```swift
var j = 10

repeat {
    print("iterator:", j)
    j = j + 1
} while j < 0
// Prints: 10 (runs once even though j=10 is NOT < 0)
```

### 🔸 Comparison Table

| Feature | `while` | `repeat-while` | `for-in` |
|---------|---------|----------------|----------|
| Checks condition | **Before** each run | **After** each run | N/A (iterates collection/range) |
| Minimum runs | 0 | 1 | Depends on collection |
| Use when | Unknown iterations, might not run | Unknown iterations, must run at least once | Known range or collection |
| Other languages | `while` | `do-while` | `for...of` / `foreach` |

---

## 6️⃣ `where` Clause in Loops

Add a **filter condition** directly to a `for` loop using `where`:

```swift
for i in 1...100 where i % 2 == 0 {
    print("Even Number:", i)
}
// Prints: 2, 4, 6, 8, ... 100
```

> 💡 `where` acts as a **built-in filter** — only iterations that satisfy the condition execute the loop body. Cleaner than putting `if` inside the loop!

---

## 7️⃣ `break` & `continue` with Labeled Statements

### 🔸 The Problem with Nested Loops

In nested loops, `break` and `continue` only affect the **innermost** loop by default. To control an **outer** loop, use **labels**.

### 🔹 `break` with Label — Exit Outer Loop

```swift
outer: for i in 1...3 {
    for j in 1...3 {
        if i == 2 && j == 2 {
            print("found (\(i), \(j))")
            break outer    // ← Exits BOTH loops
        }
        print("\(i) \(j)")
    }
}
```

**Output:**
```
1 1
1 2
1 3
2 1
found (2, 2)          ← Stops completely here
```

> 💡 Without `outer`, only the inner loop would break, and the outer loop would continue with `i = 3`.

### 🔸 `continue` with Label — Skip to Next Outer Iteration

```swift
outer: for i in 1...3 {
    for j in 1...3 {
        if i == 2 && j == 2 {
            continue outer    // ← Skips rest of OUTER iteration
        }
        print("\(i) \(j)")
    }
    print("i", i)
}
```

**Output:**
```
1 1
1 2
1 3
i 1
2 1                   ← When j==2, skips to i=3
3 1
3 2
3 3
i 3
```

> 💡 Notice `i 2` and `2 2`, `2 3` are all missing — `continue outer` jumped directly to the next value of `i`.

### 🔑 Label Summary

| Statement | Without Label | With Label (`outer:`) |
|-----------|--------------|----------------------|
| `break` | Exits **inner** loop only | Exits **outer** loop (and inner) |
| `continue` | Skips to next **inner** iteration | Skips to next **outer** iteration |

---

## 8️⃣ `defer` — Execute Code on Scope Exit

`defer` schedules code to run **when the current scope exits** — regardless of how it exits (normal return, error, etc.).

### 🔸 Basic Behavior

```swift
func demonstrateDefer() {
    defer { print("This will be lastly executed") }
    defer { print("This will be 3rd executed") }
    defer { print("This will be 2nd executed") }
    print("first executed")
}
```

**Output:**
```
first executed
This will be 2nd executed
This will be 3rd executed
This will be lastly executed
```

### 🔹 Key Rules of `defer`

| Rule | Explanation |
|------|-------------|
| **Executes on scope exit** | Runs when the function/block ends, not when declared |
| **LIFO order (stack)** | Multiple defers run in **reverse order** — last declared runs first |
| **Non-deferred code runs first** | All normal statements execute before any `defer` blocks |
| **Guaranteed execution** | Runs even if the function exits early via `return` or an error |

> 💡 **Think of `defer` like a stack of sticky notes:**
> - Each `defer` adds a note to the stack
> - When the function ends, Swift peels them off **top to bottom** (LIFO — Last In, First Out)
> - The last `defer` written runs first

### 🔸 When to Use `defer`

- **Cleanup code** — close files, release resources, stop timers
- **Paired operations** — if you open something, `defer` the close immediately
- **Logging** — track when a function exits regardless of the exit path

```swift
func readFile() {
    let file = openFile()
    defer { closeFile(file) }    // ← Guaranteed to close!
    
    // ... do work with file ...
    // Even if this throws an error, file gets closed
}
```

---

## 📋 Quick Reference Cheat Sheet

### If / Else
```swift
if condition { } else if other { } else { }
```

### Type Checking
```swift
val is Int                         // Check type → Bool
type(of: val)                      // Get type
if let n = Int("42") { print(n) }  // Safe conversion
```

### Switch
```swift
// Ranges
switch value {
case 0..<10:  print("Low")
case 10..<20: print("Med")
default:      print("High")
}

// Tuples
switch (x, y) {
case (0, 0):  print("Origin")
case (_, 0):  print("On X axis")
default:      print("Somewhere")
}

// Where
switch value {
case let x where x < 0: print("Negative")
default:                 print("Non-negative")
}
```

### Guard
```swift
guard let n = Int(str) else { return }
```

### While & Repeat-While
```swift
while condition { }
repeat { } while condition
```

### Where in Loops
```swift
for i in 1...100 where i % 2 == 0 { }
```

### Labeled Statements
```swift
outer: for i in 1...3 {
    for j in 1...3 {
        if condition { break outer }
        if condition { continue outer }
    }
}
```

### Defer
```swift
defer { print("Runs last") }       // LIFO order
```

---

## ✅ What You've Learned in This Module

- [x] `if` / `else if` / `else` — conditional branching
- [x] Type checking — `is`, `type(of:)`, `if let` for safe casting
- [x] `switch` with ranges — `0..<10`
- [x] `switch` with `where` clauses — `case let x where`
- [x] `switch` with tuples — matching `(x, y)` coordinate pairs
- [x] `fallthrough` — forcing execution of the next case
- [x] `guard let` — early exit with safe unwrapping
- [x] `while` loop — condition checked before each iteration
- [x] `repeat-while` loop — runs at least once
- [x] `where` in loops — inline filtering
- [x] `break` and `continue` with labeled statements (`outer:`)
- [x] `defer` — LIFO execution on scope exit

## 🔜 What's Coming Next

- [ ] `switch` with enums — the most natural pairing (you started this in Functions!)
- [ ] `#available` — checking OS version at runtime

---

> 💬 *"Control flow is the steering wheel of your program — it decides where you go next."*
