# ⚡ Async, Error Handling & Observables in Swift

> Writing robust asynchronous code that handles errors gracefully and reacts to data changes.
> This guide covers error handling (`throw`/`throws`/`do-try-catch`), async/await, `Task` methods & properties, and Combine's `ObservableObject` — all from your code in this module.

---

## 📂 Files in This Module

| File | What It Covers |
|------|---------------|
| [Async.swift](file:///d:/Workspace/Desktop/Learning%20Swift/Async/Async.swift) | Error handling (`throws`, `do-try-catch`, `try?`), `async`/`await`, `Task`, `Task.sleep` |
| [Macro_and_Observables.swift](file:///d:/Workspace/Desktop/Learning%20Swift/Async/Macro_and_Observables.swift) | `@Observable` macro, `ObservableObject`, `@Published`, Combine (`sink`, `AnyCancellable`) |

---

## 1️⃣ Error Handling

### 🔸 Defining Custom Errors

In Swift, errors are values conforming to the `Error` protocol. Use an `enum` to define them:

```swift
enum ParseError: Error {
    case notNumber
}
```

> 💡 `Error` is a protocol (not a class). Any `enum`, `struct`, or `class` can conform to it.

### 🔹 `throws` — Mark a Function That Can Fail

```swift
func convertToInt(_ str: String) throws -> Int {
    guard let val = Int(str) else {
        throw ParseError.notNumber    // ← Throws an error
    }
    return val
}
```

### 🔸 `do-try-catch` — Handle the Error

```swift
do {
    let result = try convertToInt("44")
    print("\(result)")                    // → 44
} catch {
    print("Not a Number")
}
```

### 🔑 The Three `try` Variants

| Variant | What It Does | Returns | When to Use |
|---------|-------------|---------|-------------|
| `try` | Calls the function, error must be caught | The value | When you want to **handle** the error with `do-catch` |
| `try?` | Calls the function, converts error → `nil` | `Optional` | When you don't care **why** it failed, just that it did |
| `try!` | Calls the function, **crashes** on error | The value (force) | When you're **100% certain** it won't throw |

```swift
// try — handle the error
do {
    let n = try convertToInt("hello")
} catch {
    print("Error: \(error)")
}

// try? — nil on error
let n = try? convertToInt("hello")    // → nil (no crash)

// try! — crash on error (use with caution!)
let n = try! convertToInt("42")       // → 42 (crashes if "42" was invalid)
```

> ⚠️ **`try!` is dangerous** — only use it when failure is truly impossible. If it does fail, your app crashes.

---

## 2️⃣ `async` / `await`

Swift's modern concurrency model lets you write asynchronous code that **reads like synchronous code** — no callbacks, no pyramid of doom.

### 🔸 Declaring an `async` Function

```swift
func fetchData() async -> Int {
    try? await Task.sleep(for: .seconds(5))    // Wait 5 seconds
    return 5
}
```

### 🔹 Calling an `async` Function

You **must** use `await` when calling an `async` function. And `async` functions can only be called from an `async` context (like inside a `Task`):

```swift
Task {
    print("data function is called")
    let value = await fetchData()
    print("Data received \(value)")          // → After 5 seconds: "Data received 5"
}
```

### 🔑 `async` / `await` Rules

| Rule | Explanation |
|------|-------------|
| Mark function with `async` | `func f() async -> Type` |
| Call with `await` | `let val = await f()` |
| Must be in async context | Inside `Task { }`, another `async func`, etc. |
| Can combine with `throws` | `func f() async throws -> Type` — use `try await` |
| Order matters | `try await` (not `await try`) |

---

## 3️⃣ `Task` — Complete Reference

A `Task` is the **entry point** for running asynchronous code. It creates a new async context where you can use `await`.

### 🔸 Creating a Task

```swift
Task {
    print("Sleep")
    do {
        try await Task.sleep(for: .seconds(5))
    } catch {
        print("An error occurred")
    }
    print("again sleep")
}
```

### 🔹 `Task` — Static Methods (Type Methods)

These are called on the `Task` type itself — `Task.sleep(...)`, `Task.yield()`, etc.

| Method | What It Does | Throws? | Example |
|--------|-------------|---------|---------|
| `Task.sleep(for:)` | Suspends the task for a duration | ✅ Yes | `try await Task.sleep(for: .seconds(5))` |
| `Task.sleep(nanoseconds:)` | Suspends for nanoseconds (legacy) | ✅ Yes | `try await Task.sleep(nanoseconds: 1_000_000_000)` |
| `Task.sleep(until:clock:)` | Suspends until a specific instant | ✅ Yes | `try await Task.sleep(until: .now + .seconds(2), clock: .continuous)` |
| `Task.yield()` | Voluntarily gives up CPU time | ❌ No | `await Task.yield()` |
| `Task.checkCancellation()` | Throws `CancellationError` if cancelled | ✅ Yes | `try Task.checkCancellation()` |
| `Task.detached { }` | Creates a task NOT inheriting context | ❌ No | `Task.detached { await doWork() }` |
| `Task.detached(priority:) { }` | Detached with priority | ❌ No | `Task.detached(priority: .high) { }` |

### 🔸 `Task` — Instance Properties

When you store a `Task` in a variable, you can access these properties on it:

```swift
let task = Task {
    try await Task.sleep(for: .seconds(10))
    return 42
}
```

| Property | What It Does | Type | Example |
|----------|-------------|------|---------|
| `.value` | Awaits and returns the task's result | `async` | `let result = await task.value` |
| `.result` | Awaits and returns `Result<Success, Failure>` | `async` | `let r = await task.result` |
| `.isCancelled` | Whether the task has been cancelled | `Bool` | `if task.isCancelled { }` |

### 🔹 `Task` — Instance Methods

| Method | What It Does | Example |
|--------|-------------|---------|
| `.cancel()` | Requests cancellation of the task | `task.cancel()` |

### 🔸 `Task` — Static Properties (Checked Inside a Task)

These are checked **from within** a running task to inspect its own state:

| Property | What It Does | Type | Example |
|----------|-------------|------|---------|
| `Task.isCancelled` | Is the **current** task cancelled? | `Bool` | `if Task.isCancelled { return }` |
| `Task.currentPriority` | Priority of the current task | `TaskPriority` | `print(Task.currentPriority)` |

### 🔹 `Task` — Sleep Duration Options

`Task.sleep(for:)` accepts a `Duration` value. Here's how to specify durations:

| Duration | Syntax | Example |
|----------|--------|---------|
| Seconds | `.seconds(n)` | `Task.sleep(for: .seconds(5))` |
| Milliseconds | `.milliseconds(n)` | `Task.sleep(for: .milliseconds(500))` |
| Microseconds | `.microseconds(n)` | `Task.sleep(for: .microseconds(1000))` |
| Nanoseconds | `.nanoseconds(n)` | `Task.sleep(for: .nanoseconds(1_000_000))` |

### 🔸 `Task` Priorities

When creating a task, you can set a priority:

| Priority | Use Case |
|----------|----------|
| `.high` / `.userInitiated` | User is waiting for this result |
| `.medium` | Default priority |
| `.low` / `.utility` | Background work the user isn't waiting on |
| `.background` | Maintenance tasks, prefetching |

```swift
Task(priority: .high) {
    let data = await fetchData()
}
```

### 🔹 `Task` vs `Task.detached`

| Feature | `Task { }` | `Task.detached { }` |
|---------|-----------|---------------------|
| Inherits actor context | ✅ Yes | ❌ No |
| Inherits priority | ✅ Yes | ❌ No (must specify) |
| Inherits task-local values | ✅ Yes | ❌ No |
| Use when | Most cases | Need a completely independent task |

### 🔸 Cancellation Pattern

```swift
let task = Task {
    for i in 1...100 {
        // Check if someone cancelled us
        if Task.isCancelled {
            print("Cancelled at \(i)")
            return
        }
        // Or throw if cancelled:
        // try Task.checkCancellation()
        
        try await Task.sleep(for: .seconds(1))
        print("Working... \(i)")
    }
}

// Cancel after 3 seconds
Task {
    try await Task.sleep(for: .seconds(3))
    task.cancel()    // ← Request cancellation
}
```

> 💡 Cancellation is **cooperative** — calling `.cancel()` only sets a flag. The task must check `Task.isCancelled` or call `Task.checkCancellation()` to actually stop.

### 🔑 Complete `Task` Quick Reference

```swift
// Creating tasks
Task { }                                    // Standard task
Task(priority: .high) { }                  // With priority
Task.detached { }                          // Detached (no context)
Task.detached(priority: .low) { }          // Detached with priority

// Sleeping
try await Task.sleep(for: .seconds(5))     // Modern (Duration)
try await Task.sleep(nanoseconds: 5_000_000_000)  // Legacy

// Yielding
await Task.yield()                         // Give up CPU

// Cancellation
task.cancel()                              // Request cancel
Task.isCancelled                           // Check (Bool)
try Task.checkCancellation()               // Throws if cancelled

// Getting results
let value = await task.value               // Get return value
let result = await task.result             // Get Result<T, Error>
```

---

## 4️⃣ `RunLoop.main.run()`

In command-line Swift programs, the program exits when `main()` finishes. If you have `Task` blocks, they run **asynchronously** and the program might exit before they complete.

```swift
RunLoop.main.run()    // Keeps the program alive forever
```

> 💡 `RunLoop.main.run()` is only needed in **command-line** programs. In iOS/macOS apps, the run loop is already running.

---

## 5️⃣ Macros & `@Observable`

### 🔸 What is a Macro?

A **macro** is like C/C++ macros — it replaces code at **compile time**. Swift 5.9+ introduced macros like `@Observable` that generate boilerplate code for you.

### 🔹 `@Observable` (Modern — Swift 5.9+)

`@Observable` automatically tracks which properties a SwiftUI view reads, and refreshes only the affected parts when those properties change.

```
Before API call:        After API call:
count = 1               count = 2
Screen shows: 1         Screen auto-updates to: 2
```

> 💡 You don't need to manually tell the UI to refresh — Swift handles it.

---

## 6️⃣ `ObservableObject` & `@Published` (Combine Framework)

The **pre-Swift 5.9** way to observe changes, using the Combine framework:

### 🔸 `ObservableObject` Protocol

```swift
import Combine

class Person: ObservableObject {
    @Published var name: String
    @Published var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
```

| Annotation | What It Does |
|------------|-------------|
| `ObservableObject` | Protocol — marks a class as observable |
| `@Published` | Property wrapper — notifies subscribers when the value changes |

### 🔹 Subscribing with `sink`

```swift
let john = Person(name: "John", age: 25)
var cancellables = Set<AnyCancellable>()

john.$name.sink { newValue in
    print("Name changed to:", newValue)
}.store(in: &cancellables)

john.$age.sink { newAge in
    print("Age changed to:", newAge)
}.store(in: &cancellables)

john.name = "Sonu"     // → "Name changed to: Sonu"
john.age = 22          // → "Age changed to: 22"
```

### 🔑 Combine Key Concepts

| Concept | What It Does | Example |
|---------|-------------|---------|
| `$propertyName` | Access the **publisher** for a `@Published` property | `john.$name` |
| `.sink { }` | Subscribe to changes — runs closure on each new value | `.sink { print($0) }` |
| `.store(in:)` | Store the subscription to keep it alive | `.store(in: &cancellables)` |
| `Set<AnyCancellable>` | Collection to hold subscriptions (prevents deallocation) | `var cancellables = Set<AnyCancellable>()` |
| `AnyCancellable` | A type-erased cancellable — auto-cancels on dealloc | Returned by `.sink` |

### 🔸 `@Observable` vs `ObservableObject`

| Feature | `@Observable` (Swift 5.9+) | `ObservableObject` (Combine) |
|---------|---------------------------|------------------------------|
| Framework | Observation | Combine |
| Syntax | `@Observable class Model { }` | `class Model: ObservableObject { }` |
| Property marking | None needed (auto-tracked) | `@Published var prop` |
| Granularity | Tracks **which properties** each view reads | Refreshes on **any** `@Published` change |
| Performance | ✅ Better (fine-grained) | ⚠️ Less efficient (whole-object refresh) |
| Recommendation | ✅ Use for new projects | 🔧 Legacy — still widely used |

---

## 📋 Quick Reference Cheat Sheet

### Error Handling
```swift
enum MyError: Error { case badInput }
func f(_ s: String) throws -> Int { throw MyError.badInput }

do { let n = try f("x") } catch { print(error) }
let n = try? f("x")                // nil on error
let n = try! f("42")               // crash on error
```

### Async / Await
```swift
func fetchData() async -> Int { return 42 }
func riskyFetch() async throws -> Int { throw MyError.badInput }

Task {
    let val = await fetchData()
    let val2 = try await riskyFetch()    // try + await
}
```

### Task Methods
```swift
try await Task.sleep(for: .seconds(5))     // Sleep
await Task.yield()                          // Yield CPU
Task.isCancelled                            // Check cancellation
try Task.checkCancellation()                // Throw if cancelled
task.cancel()                               // Cancel a task
await task.value                            // Get result
```

### Observables (Combine)
```swift
class Model: ObservableObject {
    @Published var name = ""
}
model.$name.sink { print($0) }.store(in: &cancellables)
```

---

## ✅ What You've Learned in This Module

- [x] Custom error types with `enum MyError: Error`
- [x] `throws` / `throw` — functions that can fail
- [x] `do-try-catch` — standard error handling pattern
- [x] `try?` — convert errors to `nil`
- [x] `try!` — force unwrap (dangerous)
- [x] `async` / `await` — modern async functions
- [x] `Task { }` — creating async contexts
- [x] `Task.sleep(for:)` — async delay with durations
- [x] `Task` methods & properties — complete reference
- [x] `RunLoop.main.run()` — keeping CLI programs alive
- [x] `@Observable` macro — auto-tracking property changes (Swift 5.9+)
- [x] `ObservableObject` + `@Published` — Combine's observation
- [x] `.sink` and `AnyCancellable` — subscribing to changes

## 🔜 What's Coming Next

- [ ] `TaskGroup` — structured concurrency with multiple parallel tasks
- [ ] Actors — thread-safe reference types
- [ ] `@MainActor` — ensuring code runs on the main thread
- [ ] `@Sendable` — data race safety
- [ ] Advanced Combine — `map`, `filter`, `combineLatest`, `merge`

---

> 💬 *"Concurrency in Swift is designed to be safe, fast, and readable — no more callback hell."*
