# ⚙️ Functions in Swift

> Reusable blocks of code that perform specific tasks.
> This guide covers function basics, `guard` statements, external vs internal parameters, and the `_` wildcard — all from your code in this module.

---

## 📂 Files in This Module

| File | What It Covers |
|------|---------------|
| [functions.swift](file:///d:/Workspace/Desktop/Learning%20Swift/Functions/functions.swift) | Function definition, `guard let`, external & internal parameters, `_` wildcard |

---

## 1️⃣ Defining Functions

In Swift, functions are defined with the `func` keyword.

### 🔸 Basic Syntax

```swift
func functionName(parameterName: ParameterType) -> ReturnType {
    // body
    return value
}
```

### 🔹 Your First Function

```swift
func printSqr(numInStr: String) {
    guard let n = Int(numInStr) else {
        print("Failed to convert String to number make sure to pass number only")
        return
    }
    print(n * n)
}

printSqr(numInStr: "8")      // → 64
printSqr(numInStr: "Hello")  // → "Failed to convert..."
```

> 💡 This function takes a **String**, tries to convert it to an **Int**, and prints its square. If conversion fails, it prints an error and exits early.

---

## 2️⃣ `guard` Statement

`guard` is Swift's **early exit** pattern. It's the opposite of `if` — instead of checking "if something IS true, do this," guard checks "if something IS NOT true, bail out."

### 🔸 How `guard let` Works

```swift
guard let n = Int(numInStr) else {
    print("Failed to convert")
    return    // ← MUST exit the function/loop/scope
}
// If we reach here, `n` is guaranteed to be a valid Int ✅
print(n * n)
```

### 🔹 `guard` vs `if let` Comparison

| Feature | `if let` | `guard let` |
|---------|----------|-------------|
| Where the value lives | Inside the `if` block only | Available **after** the guard (rest of function) |
| What's in the block | The **success** code | The **failure** code |
| Must exit? | ❌ No | ✅ Yes — must `return`, `break`, `continue`, or `throw` |
| Best for | Short operations with the value | Functions where you need the value for the rest of the code |

### 🔸 Visual Comparison

```swift
// Using if let — value trapped inside {}
func example1(str: String) {
    if let n = Int(str) {
        // n exists here ✅
        print(n * n)
    }
    // n does NOT exist here ❌
}

// Using guard let — value available everywhere after
func example2(str: String) {
    guard let n = Int(str) else {
        print("Invalid")
        return
    }
    // n exists here ✅ and everywhere below
    print(n * n)
    print(n + 10)
    print("The number was \(n)")
}
```

> 💡 **Rule of thumb:** Use `guard` when you need the unwrapped value for the **rest of the function**. Use `if let` when you only need it **briefly**.

---

## 3️⃣ External vs Internal Parameters

This is one of Swift's **unique features** — function parameters have TWO names:

| Name | Who Uses It | Where |
|------|------------|-------|
| **External** (argument label) | The **caller** of the function | At the call site |
| **Internal** (parameter name) | The **body** of the function | Inside the function |

### 🔸 Default Behavior — Same Name for Both

By default, the parameter name serves as both external and internal:

```swift
func printSqr(numInStr: String) {
    //               ↑ internal name (used inside)
    print(Int(numInStr)!)
}

printSqr(numInStr: "8")
//       ↑ external name (used when calling)
```

### 🔹 Custom External Name

You can give a different external name by writing it **before** the internal name:

```swift
func greet(person name: String) {
    //       ↑ external   ↑ internal
    print("Hello, \(name)!")    // uses internal name
}

greet(person: "Sonu")           // uses external name
```

### 🔸 The `_` Wildcard — No External Name

If you put `_` as the external name, the caller **doesn't need to write the label** at all:

```swift
func printSqr2(_ numInStr: String) {
    //          ↑ no external name!
    guard let n = Int(numInStr) else {
        print("Failed to convert")
        return
    }
    print(n * n)
}

// Without _ → must write label:
printSqr(numInStr: "8")

// With _ → no label needed:
printSqr2("8")        // ✅ Cleaner!
printSqr2("Hello")
```

### 🔑 Parameter Label Summary

| Declaration | Call Site | When to Use |
|-------------|-----------|-------------|
| `func f(name: String)` | `f(name: "Sonu")` | Default — clear and readable |
| `func f(for name: String)` | `f(for: "Sonu")` | When you want a more natural reading at call site |
| `func f(_ name: String)` | `f("Sonu")` | When the label would be redundant |

> 💡 **Swift's philosophy:** Function calls should read like English sentences.
> - `greet(person: "Sonu")` reads like "greet person Sonu" ✅
> - `move(to: point)` reads like "move to point" ✅
> - `print("Hello")` — no label needed, it's obvious ✅

---

## 4️⃣ Functions Without Return Values

Your current functions don't return anything — they just `print`. In Swift, this means the return type is `Void` (which you can omit).

```swift
// These two are identical:
func sayHello() {
    print("Hello!")
}

func sayHello() -> Void {
    print("Hello!")
}
```

---

## 📋 Quick Reference Cheat Sheet

### Basic Function
```swift
func greet(name: String) {
    print("Hello, \(name)!")
}
greet(name: "Sonu")
```

### Function with Return Value
```swift
func square(of num: Int) -> Int {
    return num * num
}
let result = square(of: 5)    // → 25
```

### Guard Let
```swift
func process(input: String) {
    guard let number = Int(input) else {
        print("Invalid input")
        return
    }
    print(number)    // Safe to use here
}
```

### Parameter Labels
```swift
func f(external internal: Type)     // Custom label
func f(_ internal: Type)            // No label (wildcard)
func f(internal: Type)              // Same for both
```

---

## ✅ What You've Learned in This Module

- [x] Defining functions with `func`
- [x] `guard let` — early exit with safe unwrapping
- [x] `guard` vs `if let` — when to use each
- [x] External vs internal parameter names
- [x] The `_` wildcard to omit argument labels
- [x] Functions that don't return values (`Void`)

## 🔜 What's Coming Next

- [ ] Functions with return values (`-> ReturnType`)
- [ ] Functions with multiple return values (using tuples)
- [ ] Default parameter values
- [ ] Variadic parameters (`Int...`)
- [ ] `inout` parameters — modifying values passed to functions
- [ ] Closures — anonymous functions

---

> 💬 *"Functions are the building blocks of clean code — they turn chaos into structure."*
