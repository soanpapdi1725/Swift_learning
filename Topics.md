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
| 6 | **Basic Data Types (`Int`, `Float`, `Double`, `String`, `Character`, `Bool`)** | ✅ | The 6 fundamental types — covered with examples comparing `Double` (15 digits) vs `Float` (6 digits). |
| 7 | **Operators** | ✅ | Arithmetic (`+`, `-`, `*`, `/`, `%`), comparison (`==`, `!=`, `>`, `<`), logical (`&&`, `\|\|`, `!`), and ternary (`? :`). |
| 8 | **Compound Assignment Operators** | ✅ | `+=`, `-=`, `*=`, `/=`, `%=`. Note: `i++` and `i--` do NOT exist in Swift! |
| 9 | **String Interpolation** | ✅ | Embed variables directly in strings: `"Hello, \(name)!"`. Cleaner than concatenation. |
| 10 | **Strings — Creation & Multi-line** | ✅ | Single-line `"text"` and multi-line `"""text"""` strings. Spaces and line breaks are preserved exactly. |
| 11 | **String Methods & Properties** | ✅ | `.count`, `.first`, `.last`, `.uppercased()`, `.lowercased()`, `.hasPrefix()`, `.hasSuffix()`, `.append()`, `.split()`, `.contains()`, `.removeFirst()`, `.removeLast()`, `.replacingOccurrences()` |
| 12 | **Comments & Documentation** | ✅ | Single-line `//` and multi-line `/* */` comments. Use `///` for documentation comments. |

**📂 Your code:**
- [Basics.swift](file:///d:/Workspace/Desktop/Learning%20Swift/Basic%20Introduction/Basics.swift) — Variables, constants, operators, loops
- [Types.swift](file:///d:/Workspace/Desktop/Learning%20Swift/Basic%20Introduction/Types.swift) — All 6 data types with examples
- [String.swift](file:///d:/Workspace/Desktop/Learning%20Swift/Collections/String.swift) — String interpolation & 14+ string methods *(moved to Collections)*
- 📖 [Basic.md](file:///d:/Workspace/Desktop/Learning%20Swift/Basic%20Introduction/Basic.md) — **Complete reading guide for this level**

---

## 🔵 Level 2 — Control Flow

> *Branching, looping, and directing program execution.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 13 | **`for-in` Loops** | ✅ | Iterate over ranges (`1...5`), arrays, dictionaries, and strings. Supports closed range (`...`) and half-open range (`..<`). |
| 14 | **`stride` Function** | ✅ | Fine-grained loop control — set start, end, and step. Use `to:` (exclusive) or `through:` (inclusive). |
| 15 | **Reversed Loops** | ✅ | Count backwards using `.reversed()` on a range or `stride` with negative `by:` value. |
| 16 | **Looping Over Collections** | ✅ | Iterate arrays directly with `for item in array` and dictionaries with `for (key, value) in dict`. |
| 17 | **`while` & `repeat-while` Loops** | ✅ | `while` checks condition first; `repeat-while` runs at least once (like `do-while` in other languages). |
| 18 | **`if` / `else if` / `else`** | ✅ | Standard conditional branching. No parentheses required around conditions. |
| 19 | **`switch` Statements** | ✅ | Powerful pattern matching — no fall-through by default, supports ranges and `where` clauses. |
| 20 | **`switch` with Tuples** | ✅ | Match multiple values at once — used for quadrant detection with `(x, y)` coordinates. |
| 21 | **`fallthrough`** | ✅ | Force execution of the next `switch` case — used for weekday/weekend grouping. |
| 22 | **`guard` Statements** | ✅ | Early exit when conditions aren't met. Keeps your code's "happy path" un-indented and readable. |
| 23 | **Ternary Operator** | ✅ | `condition ? valueIfTrue : valueIfFalse` — a compact inline conditional. |
| 24 | **Type Checking (`is`, `type(of:)`)** | ✅ | Check types at runtime with `is` and `type(of:)`. Used for safe type validation. |
| 25 | **Type Casting (`if let` + `Int()`)** | ✅ | Safely convert between types — `if let n = Int(str)` for String→Int conversion. |
| 26 | **`where` Clause in Loops** | ✅ | Add inline filter to `for` loops — `for i in 1...100 where i % 2 == 0`. |
| 27 | **Labeled Statements (`break outer` / `continue outer`)** | ✅ | Control nested loops — `break outer` exits both loops, `continue outer` skips to next outer iteration. |
| 28 | **`defer`** | ✅ | Schedule cleanup code to run on scope exit. Multiple defers execute in LIFO (reverse) order. |

**📂 Your code:**
- [ControlFlow.swift](file:///d:/Workspace/Desktop/Learning%20Swift/Control%20Flow/ControlFlow.swift) — `if/else`, `switch` (ranges, tuples, `where`, `fallthrough`), `guard`, `while`, `repeat-while`, `where` in loops, labeled `break`/`continue`, `defer`
- [Basics.swift — Loops section](file:///d:/Workspace/Desktop/Learning%20Swift/Basic%20Introduction/Basics.swift#L81-L140) — `for-in`, `stride`, reversed loops
- 📖 [Control Flow.md](file:///d:/Workspace/Desktop/Learning%20Swift/Control%20Flow/Control%20Flow.md) — **Complete reading guide for this level**

---

## 🟡 Level 3 — Collections & Data Structures

> *Organizing and storing groups of data.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 29 | **Arrays** | ✅ | Ordered collections — `let fruits = ["Apple", "Banana", "Mango"]`. Properties, methods, and higher-order functions. |
| 30 | **Array Properties & Methods** | ✅ | `.count`, `.isEmpty`, `.first`, `.last`, `.append()`, `.insert()`, `.remove()`, `.contains()`, `.swapAt()`, `.min()`, `.max()` |
| 30b | **`Array()` Constructors** | ✅ | `Array()`, `Array(repeating:count:)`, `Array(1...5)`, `Array("Swift")`, `Array(dict.keys)`, 2D arrays — all initializer forms. |
| 31 | **Higher-Order Functions (`map`, `filter`, `reduce`)** | ✅ | `map` transforms every element, `filter` keeps matching elements, `reduce` combines all into one value. Supports `$0` shorthand. |
| 32 | **`joined(separator:)`** | ✅ | Combine array into a string. Use `map(String.init)` to convert `[Int]` → `[String]` first. |
| 33 | **Sorting & Reordering** | ✅ | `sort()` vs `sorted()`, `reverse()` vs `reversed()`, `shuffle()` vs `shuffled()` — mutating vs non-mutating. |
| 34 | **Dictionaries** | ✅ | Key-value pairs — `["name": "sonu", "age": 21]`. Unordered — print order varies each run. |
| 35 | **Dictionary Safe Access** | ✅ | Use `if let` (optional binding) to safely access dictionary values — `if let score = dict["key"]`. |
| 36 | **Sets** | ✅ | Unordered collections of unique values. Duplicates automatically removed. `.contains()` for membership testing. |
| 37 | **Tuples** | ✅ | Used in function return values — `(min: Int, max: Int)` — and `switch` tuple matching. |
| 38 | **Collection Operations** | 🔲 | `compactMap`, `flatMap` — remaining functional programming essentials. |
| 38b | **`Array()` Constructors** | ✅ | `Array()`, `Array(repeating:count:)`, `Array(1...5)`, `Array("Swift")`, `Array(dict.keys)`, 2D array initialization. |

**📂 Your code:**
- [Arrays.swift](file:///d:/Workspace/Desktop/Learning%20Swift/Collections/Arrays.swift) — Array properties, methods, map, filter, joined
- [String.swift](file:///d:/Workspace/Desktop/Learning%20Swift/Collections/String.swift) — String methods and properties
- [Sets_and_Dict.Swift](file:///d:/Workspace/Desktop/Learning%20Swift/Collections/Sets_and_Dict.Swift) — Sets and Dictionaries
- 📖 [Collections.md](file:///d:/Workspace/Desktop/Learning%20Swift/Collections/Collections.md) — **Complete reading guide for this level** (includes full properties & methods tables)

---

## 🟠 Level 4 — Functions & Closures

> *Reusable blocks of code and functional programming patterns.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 39 | **Functions (`func`)** | ✅ | Define with `func`. Covered basic syntax, parameters, and return values. |
| 40 | **Return Values (`-> Type`)** | ✅ | Functions can return values — `func add(a: Int, b: Int) -> Int`. |
| 41 | **External vs Internal Parameters** | ✅ | Swift's unique feature — parameters have an external label (for the caller) and internal name (for the body). |
| 42 | **`_` Wildcard Parameter** | ✅ | Omit the argument label at call site — `func f(_ param: Type)` lets you call `f(value)` without a label. |
| 43 | **Default Parameter Values** | ✅ | Set fallback values — `func greet(name: String = "World")`. Caller can omit the parameter. |
| 44 | **Returning Tuples** | ✅ | Return multiple values — `func f() -> (min: Int, max: Int)`. Named tuple elements for clarity. |
| 45 | **Variadic Parameters (`Type...`)** | ✅ | Accept multiple values — `func avg(nums: Double...)`. Internally converted to an array. |
| 46 | **`inout` Parameters** | ✅ | Pass by reference — `func swap(_ a: inout Int, _ b: inout Int)`. Changes affect the original with `&`. |
| 47 | **`guard` in Functions** | ✅ | Early exit pattern — `guard let n = Int(str) else { return }`. Keeps happy path un-indented. |
| 48 | **Function Types as Variables** | ✅ | Assign functions to variables — `let op: (Int, Int) -> Int = addition`. First-class functions. |
| 49 | **Closures (Anonymous Functions)** | ✅ | `{ (params) -> Type in body }`. Capture variables from surrounding scope. Used in counter example with state retention. |
| 50 | **Basic Enumerations** | ✅ | `enum Direction { case north, south, east, west }`. Used with `switch` for exhaustive matching. |
| 51 | **Trailing Closure Syntax** | 🔲 | When the last parameter is a closure, you can write it outside the parentheses for cleaner code. |
| 52 | **`@escaping` & `@autoclosure`** | 🔲 | `@escaping` for closures that outlive the function call. `@autoclosure` for lazy evaluation. |

**📂 Your code:**
- [functions.swift](file:///d:/Workspace/Desktop/Learning%20Swift/Functions/functions.swift) — `func`, return values, params (external/internal/`_`/default), tuples, variadic, `inout`, `guard`, closures, function types, enums
- 📖 [Functions.md](file:///d:/Workspace/Desktop/Learning%20Swift/Functions/Functions.md) — **Complete reading guide for this level**

---

## 🔴 Level 5 — Optionals & Safety

> *Swift's killer feature — handling the absence of a value safely.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 53 | **Optionals (`?`)** | 🔲 | A variable that might hold a value or `nil`. Declared as `var name: String?`. Forces you to handle the nil case. |
| 54 | **Optional Binding (`if let` / `guard let`)** | ✅ | Safely unwrap optionals — `if let value = optional { ... }`. You've used this extensively in type casting and `guard`! |
| 55 | **Nil-Coalescing (`??`)** | 🔲 | Provide a default value — `let name = optionalName ?? "Guest"`. |
| 56 | **Optional Chaining (`?.`)** | 🔲 | Access properties/methods on an optional — `user?.address?.city`. Returns `nil` if any link is nil. |
| 57 | **Force Unwrapping (`!`)** | ✅ | Access the value directly — crashes if nil. You've used this with `.first!`, `.last!`, `.min()!`, `.max()!`. |
| 58 | **Implicitly Unwrapped Optionals** | 🔲 | `var name: String!` — used when a value is guaranteed after initialization (e.g., `@IBOutlet`). |

---

## 🟣 Level 6 — Object-Oriented Programming

> *Modeling real-world entities with types.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 59 | **Structs** | ✅ | Value types — copied on assignment. Memberwise init, `mutating` methods, `static` members, subscripts. |
| 60 | **Classes** | ✅ | Reference types — shared on assignment. `init`, `deinit`, optional chaining, method overloading. |
| 61 | **Structs vs Classes** | ✅ | Key differences: value vs reference semantics, inheritance, deinitializers, memory (stack vs heap). |
| 62 | **Properties (Stored & Computed)** | 🔲 | Stored: hold a value. Computed: calculate a value on the fly. Also: `lazy`, `willSet`, `didSet`. |
| 63 | **Methods** | ✅ | Instance and type (`static`) methods. `mutating` for struct methods, method overloading in classes. |
| 64 | **Initializers** | ✅ | Designated `init()`, `convenience init`, failable `init?`, `deinit` — all covered with examples. |
| 65 | **Inheritance** | ✅ | `override`, `super`, `final`, type checking with `is`, type casting with `as?`. Multi-level inheritance chain. |
| 66 | **Access Control** | 🔲 | `public`, `internal`, `fileprivate`, `private` — control what's visible to other code. |

**📂 Your code:**
- [Struct_Classes.swift](file:///d:/Workspace/Desktop/Learning%20Swift/Objects/Struct_Classes.swift) — Structs (value types, `mutating`, `static`, subscripts, Matrix), Classes (reference types, init, inheritance, `override`, `final`, `deinit`, optional chaining, method overloading)
- [Enums.swift](file:///d:/Workspace/Desktop/Learning%20Swift/Objects/Enums.swift) — Enumerations — basic, raw values, associated values, methods
- 📖 [Objects.md](file:///d:/Workspace/Desktop/Learning%20Swift/Objects/Objects.md) — **Complete reading guide for this level**

---

## 🟤 Level 7 — Protocols & Generics

> *Writing flexible, reusable, and composable code.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 67 | **Protocols** | 🔲 | Define a contract (blueprint) that types must conform to. Swift's answer to interfaces. |
| 68 | **Protocol Extensions** | 🔲 | Add default implementations to protocols — enables "mix-in" style code sharing. |
| 69 | **Protocol-Oriented Programming** | 🔲 | Swift's preferred paradigm. Compose behaviors through protocols instead of class hierarchies. |
| 70 | **Generics** | 🔲 | Write type-flexible code — `func swap<T>(_ a: inout T, _ b: inout T)`. Powers most of Swift's standard library. |
| 71 | **Associated Types** | 🔲 | Placeholder types in protocols — `associatedtype Element`. Makes protocols generic. |
| 72 | **`some` & `any` Keywords** | 🔲 | Opaque types (`some Protocol`) and existential types (`any Protocol`) — key for SwiftUI and modern APIs. |

---

## ⚫ Level 8 — Enums & Pattern Matching

> *Swift's enums are far more powerful than in most languages.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 73 | **Basic Enums** | ✅ | Define a group of related values — `enum Direction { case north, south, east, west }`. Used with `switch`. |
| 74 | **Raw Values** | ✅ | Back enums with a type — `enum Week: String { case monday = "Monday" }`. Access with `.rawValue`, create with `init(rawValue:)`. |
| 75 | **Associated Values** | ✅ | Attach data to cases — `case success(data: String)`, `case failed(error: String)`. Used for API response handling. |
| 76 | **Pattern Matching (`switch` + `case let`)** | ✅ | Value binding with `case let x where` — used for temperature ranges and quadrant detection. |

---

## 🔷 Level 9 — Error Handling

> *Writing robust code that handles failure gracefully.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 77 | **`throw` / `throws` / `rethrows`** | 🔲 | Functions that can fail are marked `throws`. Errors are Swift values conforming to the `Error` protocol. |
| 78 | **`do-try-catch`** | 🔲 | The standard error handling pattern — `do { try riskyOp() } catch { handle(error) }`. |
| 79 | **`try?` and `try!`** | 🔲 | `try?` converts errors to nil. `try!` asserts success (crashes on error). Choose wisely. |
| 80 | **Custom Error Types** | 🔲 | Define your own error types with `enum MyError: Error { ... }` for descriptive, typed errors. |
| 81 | **`Result` Type** | 🔲 | `Result<Success, Failure>` — encapsulates either a success value or an error. Great for async code. |

---

## 🔶 Level 10 — Memory Management

> *Understanding how Swift manages object lifetimes behind the scenes.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 82 | **Automatic Reference Counting (ARC)** | 🔲 | Swift automatically tracks and frees memory for class instances. No garbage collector needed. |
| 83 | **Strong, Weak & Unowned References** | 🔲 | `strong` (default) keeps objects alive. `weak` and `unowned` break retain cycles. |
| 84 | **Retain Cycles & Memory Leaks** | 🔲 | Mutual strong references prevent deallocation. Use `weak`/`unowned` and capture lists to fix. |
| 85 | **Value Types vs Reference Types** | 🔲 | Structs/enums are value types (copied). Classes are reference types (shared). Huge implications for safety. |

---

## 💜 Level 11 — Concurrency

> *Modern async programming in Swift.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 86 | **`async` / `await`** | 🔲 | Write asynchronous code that reads like synchronous code. No more nested callbacks. |
| 87 | **`Task` & `TaskGroup`** | 🔲 | Structured concurrency — spawn concurrent work and manage its lifecycle. |
| 88 | **Actors** | 🔲 | Reference types that protect their mutable state from data races. Thread-safe by design. |
| 89 | **`@Sendable` & Data Race Safety** | 🔲 | Compiler-enforced thread safety. Mark closures and types that are safe to pass across concurrency boundaries. |
| 90 | **`MainActor`** | 🔲 | Ensures code runs on the main thread — essential for UI updates. |

---

## 💎 Level 12 — Advanced Swift

> *Deep features for power users and library authors.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 91 | **Extensions** | 🔲 | Add new methods, computed properties, and protocol conformances to *any* type — even types you don't own. |
| 92 | **Subscripts** | 🔲 | Custom index-based access — `myCollection[index]`. Define with the `subscript` keyword. |
| 93 | **Property Wrappers** | 🔲 | `@Published`, `@State`, `@AppStorage` — encapsulate common property patterns behind a reusable wrapper. |
| 94 | **Result Builders** | 🔲 | The magic behind SwiftUI's declarative syntax — `@ViewBuilder`, `@resultBuilder`. |
| 95 | **Keypaths** | 🔲 | Type-safe references to properties — `\Person.name`. Enables powerful functional patterns. |
| 96 | **Macros** (Swift 5.9+) | 🔲 | Compile-time code generation — `#Predicate`, `@Observable`. A modern metaprogramming tool. |

---

## 🌍 Level 13 — Ecosystem & Tooling

> *Beyond the language itself — the tools and platforms.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 97 | **Xcode & Playgrounds** | 🔲 | Apple's IDE for Swift development. Playgrounds allow interactive experimentation. |
| 98 | **Swift Package Manager (SPM)** | 🔲 | The official dependency manager. Define packages with `Package.swift`. |
| 99 | **REPL & Swift CLI** | 🔲 | Run Swift interactively from the command line or compile standalone scripts. |
| 100 | **Interoperability with Objective-C** | 🔲 | Bridging headers, `@objc` annotations — work with legacy Objective-C codebases seamlessly. |
| 101 | **Cross-Platform Support** | 🔲 | Swift runs on iOS, macOS, watchOS, tvOS, visionOS, Linux, and Windows. |
| 102 | **Open Source Community** | 🔲 | Swift is [open source on GitHub](https://github.com/apple/swift). Contributions from Apple and the community. |

---

## 📊 Progress Summary

```
Level  1  — Language Basics          █████████████████ 12 / 12  🎉 COMPLETE!
Level  2  — Control Flow             █████████████████ 16 / 16  🎉 COMPLETE!
Level  3  — Collections              █████████████████ 10 / 10  🎉 COMPLETE!
Level  4  — Functions & Closures     █████████████████ 12 / 14
Level  5  — Optionals & Safety       █████░░░░░░░░░░░░  2 / 6
Level  6  — OOP                      █████████████░░░░  6 / 8
Level  7  — Protocols & Generics     ░░░░░░░░░░░░░░░░░  0 / 6
Level  8  — Enums & Pattern Matching █████████████████  4 / 4   🎉 COMPLETE!
Level  9  — Error Handling           ░░░░░░░░░░░░░░░░░  0 / 5
Level 10  — Memory Management        ░░░░░░░░░░░░░░░░░  0 / 4
Level 11  — Concurrency              ░░░░░░░░░░░░░░░░░  0 / 5
Level 12  — Advanced Swift           ░░░░░░░░░░░░░░░░░  0 / 6
Level 13  — Ecosystem & Tooling      ░░░░░░░░░░░░░░░░░  0 / 6
─────────────────────────────────────────────────────────────
Total                                                 62 / 102
```

---

## 📂 Folder Structure

```
Learning Swift/
├── 📖 Topics.md                     ← You are here
├── Basic Introduction/
│   ├── 📖 Basic.md
│   ├── Basics.swift
│   └── Types.swift
├── Collections/
│   ├── 📖 Collections.md           ← Full properties & methods tables + Array() constructors
│   ├── Arrays.swift
│   ├── String.swift
│   └── Sets_and_Dict.Swift
├── Control Flow/
│   ├── 📖 Control Flow.md
│   └── ControlFlow.swift
├── Functions/
│   ├── 📖 Functions.md
│   └── functions.swift
├── Objects/
│   ├── 📖 Objects.md               ← Complete guide: Structs, Classes, Enums
│   ├── Struct_Classes.swift
│   └── Enums.swift
└── Error Screenshots/
    ├── 📖 Error Screenshots.md
    └── let(Constant)_Cannot_Changed.png
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
