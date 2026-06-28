# 🚀 Swift Learning Roadmap

> A comprehensive guide to mastering Swift — from the fundamentals to advanced patterns.
> Track your progress by checking off topics as you go!

---

## 📌 How to Use This Guide

- Topics are grouped into **progressive levels** — start from the top and work your way down.
- Each topic includes a brief explanation of *why* it matters.
- ✅ = Covered &nbsp;&nbsp; 🔲 = Not yet covered
- Links to your code files are provided where applicable.

---

## 🟢 Level 1 — Language Basics

> *The building blocks. Master these before moving on.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 1 | **Simple & Readable Syntax** | ✅ | Swift's clean syntax makes it approachable. No semicolons required, no header files, and code reads almost like English. |
| 2 | **Variables & Constants (`var` / `let`)** | ✅ | `var` for values that change, `let` for values that don't. Immutability by default makes code safer. |
| 3 | **Type Safety** | ✅ | The compiler catches type mismatches at compile time — no more "undefined is not a function" surprises. |
| 4 | **Type Inference** | ✅ | Swift is smart enough to figure out the type from the value you assign — `var name = "Sonu"` is automatically a `String`. |
| 5 | **Type Annotation** | ✅ | Explicitly declare types when needed — `var age: Int = 21`. Useful for clarity and when the compiler can't infer. |
| 6 | **Basic Data Types** | ✅ | `Int`, `Float`, `Double`, `String`, `Character`, `Bool` — the fundamental types you'll use everywhere. |
| 7 | **Operators** | ✅ | Arithmetic (`+`, `-`, `*`, `/`, `%`), comparison (`==`, `!=`, `>`, `<`), logical (`&&`, `\|\|`, `!`), and ternary (`? :`). |
| 8 | **String Interpolation** | 🔲 | Embed variables directly in strings: `"Hello, \(name)!"`. Cleaner than concatenation. |
| 9 | **Comments & Documentation** | ✅ | Single-line `//` and multi-line `/* */` comments. Use `///` for documentation comments. |

**📂 Your code:** [Basics.swift](file:///d:/Workspace/Desktop/Learning%20Swift/Basic%20Introduction/Basics.swift)

---

## 🔵 Level 2 — Control Flow

> *Branching and looping — the logic that drives your programs.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 10 | **`for-in` Loops** | ✅ | Iterate over ranges (`1...5`), arrays, dictionaries, and strings. Supports closed range (`...`) and half-open range (`..<`). |
| 11 | **`stride` Function** | ✅ | Fine-grained loop control — set start, end, and step. Use `to:` (exclusive) or `through:` (inclusive). |
| 12 | **`while` & `repeat-while` Loops** | 🔲 | `while` checks condition first; `repeat-while` runs at least once (like `do-while` in other languages). |
| 13 | **`if` / `else if` / `else`** | 🔲 | Standard conditional branching. No parentheses required around conditions. |
| 14 | **`switch` Statements** | 🔲 | Powerful pattern matching — no fall-through by default, supports ranges, tuples, and `where` clauses. |
| 15 | **`guard` Statements** | 🔲 | Early exit when conditions aren't met. Keeps your code's "happy path" un-indented and readable. |
| 16 | **Ternary Operator** | ✅ | `condition ? valueIfTrue : valueIfFalse` — a compact inline conditional. |

**📂 Your code:** [Basics.swift — Loops section](file:///d:/Workspace/Desktop/Learning%20Swift/Basic%20Introduction/Basics.swift#L81-L140)

---

## 🟡 Level 3 — Collections & Data Structures

> *Organizing and storing groups of data.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 17 | **Arrays** | ✅ | Ordered collections — `let fruits = ["Apple", "Banana", "Mango"]`. Supports map, filter, reduce. |
| 18 | **Dictionaries** | ✅ | Key-value pairs — `["name": "sonu", "age": 21]`. Keys must be `Hashable`. |
| 19 | **Sets** | 🔲 | Unordered collections of unique values. Great for membership testing and set operations (union, intersection). |
| 20 | **Tuples** | 🔲 | Group multiple values into a single compound value — `let http404 = (404, "Not Found")`. |
| 21 | **Collection Operations** | 🔲 | `map`, `filter`, `reduce`, `compactMap`, `flatMap`, `sorted`, `contains` — functional programming essentials. |

---

## 🟠 Level 4 — Functions & Closures

> *Reusable blocks of code and functional programming patterns.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 22 | **Functions** | 🔲 | Define with `func`. Supports argument labels, default values, variadic params, and multiple return values. |
| 23 | **Closures** | 🔲 | Anonymous functions — `{ (params) -> ReturnType in body }`. Used heavily in Swift APIs like `sort`, `map`, `completion handlers`. |
| 24 | **Trailing Closure Syntax** | 🔲 | When the last parameter is a closure, you can write it outside the parentheses for cleaner code. |
| 25 | **Higher-Order Functions** | 🔲 | Functions that take or return other functions — enables powerful composition patterns. |
| 26 | **`@escaping` & `@autoclosure`** | 🔲 | `@escaping` for closures that outlive the function call. `@autoclosure` for lazy evaluation. |

---

## 🔴 Level 5 — Optionals & Safety

> *Swift's killer feature — handling the absence of a value safely.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 27 | **Optionals (`?`)** | 🔲 | A variable that might hold a value or `nil`. Declared as `var name: String?`. Forces you to handle the nil case. |
| 28 | **Optional Binding (`if let` / `guard let`)** | 🔲 | Safely unwrap optionals — `if let value = optional { ... }`. The standard safe approach. |
| 29 | **Nil-Coalescing (`??`)** | 🔲 | Provide a default value — `let name = optionalName ?? "Guest"`. |
| 30 | **Optional Chaining (`?.`)** | 🔲 | Access properties/methods on an optional — `user?.address?.city`. Returns `nil` if any link is nil. |
| 31 | **Force Unwrapping (`!`)** | 🔲 | Access the value directly — crashes if nil. Use sparingly and only when you're 100% certain. |
| 32 | **Implicitly Unwrapped Optionals** | 🔲 | `var name: String!` — used when a value is guaranteed after initialization (e.g., `@IBOutlet`). |

---

## 🟣 Level 6 — Object-Oriented Programming

> *Modeling real-world entities with types.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 33 | **Structs** | 🔲 | Value types — copied on assignment. Preferred for most data models in Swift. |
| 34 | **Classes** | 🔲 | Reference types — shared on assignment. Needed for inheritance and identity. |
| 35 | **Structs vs Classes** | 🔲 | Key differences: value vs reference semantics, inheritance, deinitializers, ARC behavior. |
| 36 | **Properties (Stored & Computed)** | 🔲 | Stored: hold a value. Computed: calculate a value on the fly. Also: `lazy`, `willSet`, `didSet`. |
| 37 | **Methods** | 🔲 | Instance and type methods. Use `mutating` for methods that modify struct properties. |
| 38 | **Initializers** | 🔲 | `init()` methods to set up instances. Supports default, custom, failable (`init?`), and required initializers. |
| 39 | **Inheritance** | 🔲 | Class-only feature. Use `override` for customization, `final` to prevent subclassing. |
| 40 | **Access Control** | 🔲 | `public`, `internal`, `fileprivate`, `private` — control what's visible to other code. |

---

## 🟤 Level 7 — Protocols & Generics

> *Writing flexible, reusable, and composable code.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 41 | **Protocols** | 🔲 | Define a contract (blueprint) that types must conform to. Swift's answer to interfaces. |
| 42 | **Protocol Extensions** | 🔲 | Add default implementations to protocols — enables "mix-in" style code sharing. |
| 43 | **Protocol-Oriented Programming** | 🔲 | Swift's preferred paradigm. Compose behaviors through protocols instead of class hierarchies. |
| 44 | **Generics** | 🔲 | Write type-flexible code — `func swap<T>(_ a: inout T, _ b: inout T)`. Powers most of Swift's standard library. |
| 45 | **Associated Types** | 🔲 | Placeholder types in protocols — `associatedtype Element`. Makes protocols generic. |
| 46 | **`some` & `any` Keywords** | 🔲 | Opaque types (`some Protocol`) and existential types (`any Protocol`) — key for SwiftUI and modern APIs. |

---

## ⚫ Level 8 — Enums & Pattern Matching

> *Swift's enums are far more powerful than in most languages.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 47 | **Basic Enums** | 🔲 | Define a group of related values — `enum Direction { case north, south, east, west }`. |
| 48 | **Raw Values** | 🔲 | Back enums with a type — `enum Planet: Int { case mercury = 1, venus, earth }`. |
| 49 | **Associated Values** | 🔲 | Attach data to cases — `case success(Data)`, `case failure(Error)`. Makes enums incredibly expressive. |
| 50 | **Pattern Matching (`switch` + `case let`)** | 🔲 | Destructure and match complex data — supports value binding, `where` clauses, and tuple patterns. |

---

## 🔷 Level 9 — Error Handling

> *Writing robust code that handles failure gracefully.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 51 | **`throw` / `throws` / `rethrows`** | 🔲 | Functions that can fail are marked `throws`. Errors are Swift values conforming to the `Error` protocol. |
| 52 | **`do-try-catch`** | 🔲 | The standard error handling pattern — `do { try riskyOp() } catch { handle(error) }`. |
| 53 | **`try?` and `try!`** | 🔲 | `try?` converts errors to nil. `try!` asserts success (crashes on error). Choose wisely. |
| 54 | **Custom Error Types** | 🔲 | Define your own error types with `enum MyError: Error { ... }` for descriptive, typed errors. |
| 55 | **`Result` Type** | 🔲 | `Result<Success, Failure>` — encapsulates either a success value or an error. Great for async code. |

---

## 🔶 Level 10 — Memory Management

> *Understanding how Swift manages object lifetimes behind the scenes.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 56 | **Automatic Reference Counting (ARC)** | 🔲 | Swift automatically tracks and frees memory for class instances. No garbage collector needed. |
| 57 | **Strong, Weak & Unowned References** | 🔲 | `strong` (default) keeps objects alive. `weak` and `unowned` break retain cycles. |
| 58 | **Retain Cycles & Memory Leaks** | 🔲 | Mutual strong references prevent deallocation. Use `weak`/`unowned` and capture lists to fix. |
| 59 | **Value Types vs Reference Types** | 🔲 | Structs/enums are value types (copied). Classes are reference types (shared). Huge implications for safety. |

---

## 💜 Level 11 — Concurrency

> *Modern async programming in Swift.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 60 | **`async` / `await`** | 🔲 | Write asynchronous code that reads like synchronous code. No more nested callbacks. |
| 61 | **`Task` & `TaskGroup`** | 🔲 | Structured concurrency — spawn concurrent work and manage its lifecycle. |
| 62 | **Actors** | 🔲 | Reference types that protect their mutable state from data races. Thread-safe by design. |
| 63 | **`@Sendable` & Data Race Safety** | 🔲 | Compiler-enforced thread safety. Mark closures and types that are safe to pass across concurrency boundaries. |
| 64 | **`MainActor`** | 🔲 | Ensures code runs on the main thread — essential for UI updates. |

---

## 💎 Level 12 — Advanced Swift

> *Deep features for power users and library authors.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 65 | **Extensions** | 🔲 | Add new methods, computed properties, and protocol conformances to *any* type — even types you don't own. |
| 66 | **Subscripts** | 🔲 | Custom index-based access — `myCollection[index]`. Define with the `subscript` keyword. |
| 67 | **Property Wrappers** | 🔲 | `@Published`, `@State`, `@AppStorage` — encapsulate common property patterns behind a reusable wrapper. |
| 68 | **Result Builders** | 🔲 | The magic behind SwiftUI's declarative syntax — `@ViewBuilder`, `@resultBuilder`. |
| 69 | **Keypaths** | 🔲 | Type-safe references to properties — `\Person.name`. Enables powerful functional patterns. |
| 70 | **Macros** (Swift 5.9+) | 🔲 | Compile-time code generation — `#Predicate`, `@Observable`. A modern metaprogramming tool. |

---

## 🌍 Level 13 — Ecosystem & Tooling

> *Beyond the language itself — the tools and platforms.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 71 | **Xcode & Playgrounds** | 🔲 | Apple's IDE for Swift development. Playgrounds allow interactive experimentation. |
| 72 | **Swift Package Manager (SPM)** | 🔲 | The official dependency manager. Define packages with `Package.swift`. |
| 73 | **REPL & Swift CLI** | 🔲 | Run Swift interactively from the command line or compile standalone scripts. |
| 74 | **Interoperability with Objective-C** | 🔲 | Bridging headers, `@objc` annotations — work with legacy Objective-C codebases seamlessly. |
| 75 | **Cross-Platform Support** | 🔲 | Swift runs on iOS, macOS, watchOS, tvOS, visionOS, Linux, and Windows. |
| 76 | **Open Source Community** | 🔲 | Swift is [open source on GitHub](https://github.com/apple/swift). Contributions from Apple and the community. |

---

## 📊 Progress Summary

```
Level  1  — Language Basics          ██████████████░░░  7 / 9
Level  2  — Control Flow             ████░░░░░░░░░░░░░  3 / 7
Level  3  — Collections              ████░░░░░░░░░░░░░  2 / 5
Level  4  — Functions & Closures     ░░░░░░░░░░░░░░░░░  0 / 5
Level  5  — Optionals & Safety       ░░░░░░░░░░░░░░░░░  0 / 6
Level  6  — OOP                      ░░░░░░░░░░░░░░░░░  0 / 8
Level  7  — Protocols & Generics     ░░░░░░░░░░░░░░░░░  0 / 6
Level  8  — Enums & Pattern Matching ░░░░░░░░░░░░░░░░░  0 / 4
Level  9  — Error Handling           ░░░░░░░░░░░░░░░░░  0 / 5
Level 10  — Memory Management        ░░░░░░░░░░░░░░░░░  0 / 4
Level 11  — Concurrency              ░░░░░░░░░░░░░░░░░  0 / 5
Level 12  — Advanced Swift           ░░░░░░░░░░░░░░░░░  0 / 6
Level 13  — Ecosystem & Tooling      ░░░░░░░░░░░░░░░░░  0 / 6
─────────────────────────────────────────────────────────────
Total                                                 12 / 76
```

---

## 📚 Recommended Resources

| Resource | Link | Type |
|----------|------|------|
| The Swift Programming Language (Official) | [swift.org/documentation](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/) | 📖 Book |
| Swift by Sundell | [swiftbysundell.com](https://www.swiftbysundell.com) | 📝 Blog |
| Hacking with Swift — 100 Days | [hackingwithswift.com](https://www.hackingwithswift.com/100) | 🎓 Course |
| Ray Wenderlich (Kodeco) | [kodeco.com](https://www.kodeco.com) | 🎓 Tutorials |
| Apple WWDC Videos | [developer.apple.com/videos](https://developer.apple.com/videos/) | 🎥 Video |
| Swift Evolution Proposals | [swift.org/swift-evolution](https://www.swift.org/swift-evolution/) | 📜 Reference |

---

> *"Swift is designed to make writing and maintaining correct programs easier for the developer."*
> — Apple, The Swift Programming Language

