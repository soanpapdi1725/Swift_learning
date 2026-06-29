# 🔀 Control Flow in Swift

> Making decisions and directing your program's execution path.
> This guide covers `if/else`, `switch` statements, and type checking — all from your code in this module.

---

## 📂 Files in This Module

| File | What It Covers |
|------|---------------|
| [ControlFlow.swift](file:///d:/Workspace/Desktop/Learning%20Swift/Control%20Flow/ControlFlow.swift) | `if/else if/else`, `switch` with ranges and `where` clauses, type checking with `is` and `if let` |

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

The `is` keyword checks whether a value is of a certain type. Returns `Bool`.

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

> 💡 Useful for debugging — when you're not sure what type a variable is, `type(of:)` tells you.

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

> 💡 **How `if let` works here:**
> 1. `Int(num)` tries to convert the string to an `Int`
> 2. If it succeeds → the value is stored in `numInt` and the `if` block runs
> 3. If it fails → `numInt` is `nil` and the `else` block runs
> 
> This is called **Optional Binding** — one of Swift's most important patterns!

### 🔑 Type Checking Summary

| Tool | Purpose | Returns | Example |
|------|---------|---------|---------|
| `is` | Check if value is a type | `Bool` | `val is Int` |
| `type(of:)` | Get the actual type | `Type` | `type(of: num)` → `String` |
| `Int(string)` | Convert String → Int | `Int?` (Optional) | `Int("42")` → `42` |
| `if let` | Safely unwrap the result | Unwrapped value or `nil` | `if let n = Int(str) { }` |

---

## 3️⃣ `switch` Statements

Swift's `switch` is **far more powerful** than in most languages. It supports ranges, pattern matching, and `where` clauses.

### 🔸 Key Differences from Other Languages

| Feature | Swift | C / Java / JS |
|---------|-------|---------------|
| Fall-through | ❌ No (by default) | ✅ Yes (needs `break`) |
| Must be exhaustive | ✅ Yes (needs `default`) | ❌ No |
| Supports ranges | ✅ Yes (`0..<10`) | ❌ No |
| Supports `where` clauses | ✅ Yes | ❌ No |
| Multiple values per case | ✅ Yes (`case 1, 2, 3:`) | ❌ No |

### 🔹 Switch with Ranges

When you have defined boundaries, use ranges directly in `case`:

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

> 💡 Each `case` uses **half-open range** (`..<`) so there's no overlap between cases. `0..<10` means 0–9, `10..<20` means 10–19, etc.

### 🔸 Switch with `where` Clauses

When you don't have clean ranges or need custom conditions, use `case let` with `where`:

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

> 💡 **How `case let x where` works:**
> 1. `case let x` → binds the matched value to a variable `x`
> 2. `where x < 10` → adds a condition that must be true for this case to match
> 3. Think of it as: *"match this case **where** the condition is true"*

### 🔹 How Swift Evaluates `switch`

```
┌──────────────┐
│  temp = 25   │
└──────┬───────┘
       │
       ▼
  case 0..<10?  ─── NO ──▶ case 10..<20?  ─── NO ──▶ case 20..<30?  ─── YES!
                                                           │
                                                           ▼
                                                    print("Normal")
                                                    ✅ STOPS HERE
                                                    (no fall-through)
```

### 🔑 Key Points About `switch`

- **Must be exhaustive** — every possible value must be covered. Use `default:` as a catch-all.
- **No fall-through** — once a case matches, Swift exits the switch. No need for `break`.
- **If you WANT fall-through** — use the `fallthrough` keyword (rare).
- **Each case must have at least one statement** — use `break` for empty cases.

---

## 📋 Quick Reference Cheat Sheet

### If / Else
```swift
if condition {
    // ...
} else if otherCondition {
    // ...
} else {
    // ...
}
```

### Type Checking
```swift
val is Int                         // Check type → Bool
type(of: val)                      // Get type
if let n = Int("42") { print(n) }  // Safe conversion
```

### Switch with Ranges
```swift
switch value {
case 0..<10:   print("Low")
case 10..<20:  print("Medium")
default:       print("High")
}
```

### Switch with `where`
```swift
switch value {
case let x where x < 0:   print("Negative")
case let x where x == 0:  print("Zero")
default:                   print("Positive")
}
```

---

## ✅ What You've Learned in This Module

- [x] `if` / `else if` / `else` — basic conditional branching
- [x] Type checking with `is` keyword
- [x] `type(of:)` to inspect types at runtime
- [x] `if let` for safe type casting (Optional Binding)
- [x] `switch` with ranges (`0..<10`)
- [x] `switch` with `where` clauses and value binding (`case let x where`)
- [x] Swift's `switch` is exhaustive and has no fall-through

## 🔜 What's Coming Next

- [ ] `guard` statements — early exit pattern
- [ ] `while` and `repeat-while` loops
- [ ] `switch` with tuples — matching multiple values at once
- [ ] `switch` with enums — the most natural pairing

---

> 💬 *"Control flow is the steering wheel of your program — it decides where you go next."*
