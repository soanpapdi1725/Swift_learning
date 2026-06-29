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
| 8 | **String Interpolation** | ✅ | Embed variables directly in strings: `"Hello, \(name)!"`. Cleaner than concatenation. |
| 9 | **Strings — Creation & Multi-line** | ✅ | Single-line `"text"` and multi-line `"""text"""` strings. Spaces and line breaks are preserved exactly. |
| 10 | **String Methods & Properties** | ✅ | `.count`, `.first`, `.last`, `.uppercased()`, `.lowercased()`, `.hasPrefix()`, `.hasSuffix()`, `.append()`, `.split()`, `.contains()`, `.removeFirst()`, `.removeLast()`, `.replacingOccurrences()` |
| 11 | **Comments & Documentation** | ✅ | Single-line `//` and multi-line `/* */` comments. Use `///` for documentation comments. |

**📂 Your code:**
- [Basics.swift](file:///d:/Workspace/Desktop/Learning%20Swift/Basic%20Introduction/Basics.swift) — Variables, constants, operators, loops
- [Types.swift](file:///d:/Workspace/Desktop/Learning%20Swift/Basic%20Introduction/Types.swift) — All 6 data types with examples
- [String.swift](file:///d:/Workspace/Desktop/Learning%20Swift/Collections/String.swift) — String interpolation & 14+ string methods *(moved to Collections)*
- 📖 [Basic.md](file:///d:/Workspace/Desktop/Learning%20Swift/Basic%20Introduction/Basic.md) — **Complete reading guide for this level**

---

## 🔵 Level 2 — Control Flow

> *Branching and looping — the logic that drives your programs.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 12 | **`for-in` Loops** | ✅ | Iterate over ranges (`1...5`), arrays, dictionaries, and strings. Supports closed range (`...`) and half-open range (`..<`). |
| 13 | **`stride` Function** | ✅ | Fine-grained loop control — set start, end, and step. Use `to:` (exclusive) or `through:` (inclusive). |
| 14 | **Reversed Loops** | ✅ | Count backwards using `.reversed()` on a range or `stride` with negative `by:` value. |
| 15 | **Looping Over Collections** | ✅ | Iterate arrays directly with `for item in array` and dictionaries with `for (key, value) in dict`. |
| 16 | **`while` & `repeat-while` Loops** | ✅ | `while` checks condition first; `repeat-while` runs at least once (like `do-while` in other languages). |
| 17 | **`if` / `else if` / `else`** | ✅ | Standard conditional branching. No parentheses required around conditions. |
| 18 | **`switch` Statements** | ✅ | Powerful pattern matching — no fall-through by default, supports ranges, tuples, and `where` clauses. |
| 19 | **`guard` Statements** | ✅ | Early exit when conditions aren't met. Keeps your code's "happy path" un-indented and readable. |
| 20 | **Ternary Operator** | ✅ | `condition ? valueIfTrue : valueIfFalse` — a compact inline conditional. |
| 21 | **Type Checking (`is`, `type(of:)`)** | ✅ | Check types at runtime with `is` and `type(of:)`. Used for safe type validation. |
| 22 | **Type Casting (`if let` + `Int()`)** | ✅ | Safely convert between types — `if let n = Int(str)` for String→Int conversion. |

**📂 Your code:**
- [ControlFlow.swift](file:///d:/Workspace/Desktop/Learning%20Swift/Control%20Flow/ControlFlow.swift) — `if/else`, `switch`, `guard`, `while`, `repeat-while`, type checking
- [Basics.swift — Loops section](file:///d:/Workspace/Desktop/Learning%20Swift/Basic%20Introduction/Basics.swift#L81-L140) — `for-in`, `stride`, reversed loops
- 📖 [Control Flow.md](file:///d:/Workspace/Desktop/Learning%20Swift/Control%20Flow/Control%20Flow.md) — **Complete reading guide for this level**

---

## 🟡 Level 3 — Collections & Data Structures

> *Organizing and storing groups of data.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 23 | **Arrays** | ✅ | Ordered collections — `let fruits = ["Apple", "Banana", "Mango"]`. Properties, methods, and higher-order functions. |
| 24 | **Array Properties & Methods** | ✅ | `.count`, `.isEmpty`, `.first`, `.last`, `.append()`, `.insert()`, `.remove()`, `.contains()`, `.swapAt()`, `.min()`, `.max()` |
| 25 | **Higher-Order Functions (`map`, `filter`)** | ✅ | `map` transforms every element, `filter` keeps matching elements. Supports `$0` shorthand. |
| 26 | **`joined(separator:)`** | ✅ | Combine array into a string. Use `map(String.init)` to convert `[Int]` → `[String]` first. |
| 27 | **Sorting & Reordering** | ✅ | `sort()` vs `sorted()`, `reverse()` vs `reversed()`, `shuffle()` vs `shuffled()` — mutating vs non-mutating. |
| 28 | **Dictionaries** | ✅ | Key-value pairs — `["name": "sonu", "age": 21]`. Unordered — print order varies each run. |
| 29 | **Dictionary Safe Access** | ✅ | Use `if let` (optional binding) to safely access dictionary values — `if let score = dict["key"]`. |
| 30 | **Sets** | ✅ | Unordered collections of unique values. Duplicates automatically removed. `.contains()` for membership testing. |
| 31 | **Tuples** | 🔲 | Group multiple values into a single compound value — `let http404 = (404, "Not Found")`. |
| 32 | **Collection Operations** | 🔲 | `reduce`, `compactMap`, `flatMap` — remaining functional programming essentials. |

**📂 Your code:**
- [Arrays.swift](file:///d:/Workspace/Desktop/Learning%20Swift/Collections/Arrays.swift) — Array properties, methods, map, filter, joined
- [String.swift](file:///d:/Workspace/Desktop/Learning%20Swift/Collections/String.swift) — String methods and properties
- [Sets_and_Dict.Swift](file:///d:/Workspace/Desktop/Learning%20Swift/Collections/Sets_and_Dict.Swift) — Sets and Dictionaries
- 📖 [Collections.md](file:///d:/Workspace/Desktop/Learning%20Swift/Collections/Collections.md) — **Complete reading guide for this level**

---

## 🟠 Level 4 — Functions & Closures

> *Reusable blocks of code and functional programming patterns.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 33 | **Functions (`func`)** | ✅ | Define with `func`. Covered argument labels and basic function structure. |
| 34 | **External vs Internal Parameters** | ✅ | Swift's unique feature — parameters have an external label (for the caller) and internal name (for the body). |
| 35 | **`_` Wildcard Parameter** | ✅ | Omit the argument label at call site — `func f(_ param: Type)` lets you call `f(value)` without a label. |
| 36 | **`guard` in Functions** | ✅ | Early exit pattern — `guard let n = Int(str) else { return }`. Keeps happy path un-indented. |
| 37 | **Return Values** | 🔲 | Functions that return values — `func square(of n: Int) -> Int`. Supports multiple returns via tuples. |
| 38 | **Default Parameter Values** | 🔲 | Set fallback values — `func greet(name: String = "World")`. Caller can omit the parameter. |
| 39 | **Closures** | 🔲 | Anonymous functions — `{ (params) -> ReturnType in body }`. Used heavily in Swift APIs like `sort`, `map`, `completion handlers`. |
| 40 | **Trailing Closure Syntax** | 🔲 | When the last parameter is a closure, you can write it outside the parentheses for cleaner code. |
| 41 | **Higher-Order Functions** | 🔲 | Functions that take or return other functions — enables powerful composition patterns. |
| 42 | **`@escaping` & `@autoclosure`** | 🔲 | `@escaping` for closures that outlive the function call. `@autoclosure` for lazy evaluation. |

**📂 Your code:**
- [functions.swift](file:///d:/Workspace/Desktop/Learning%20Swift/Functions/functions.swift) — `func`, `guard let`, external/internal params, `_` wildcard
- 📖 [Functions.md](file:///d:/Workspace/Desktop/Learning%20Swift/Functions/Functions.md) — **Complete reading guide for this level**

---

## 🔴 Level 5 — Optionals & Safety

> *Swift's killer feature — handling the absence of a value safely.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 43 | **Optionals (`?`)** | 🔲 | A variable that might hold a value or `nil`. Declared as `var name: String?`. Forces you to handle the nil case. |
| 44 | **Optional Binding (`if let` / `guard let`)** | ✅ | Safely unwrap optionals — `if let value = optional { ... }`. You've already used this in type casting and `guard`! |
| 45 | **Nil-Coalescing (`??`)** | 🔲 | Provide a default value — `let name = optionalName ?? "Guest"`. |
| 46 | **Optional Chaining (`?.`)** | 🔲 | Access properties/methods on an optional — `user?.address?.city`. Returns `nil` if any link is nil. |
| 47 | **Force Unwrapping (`!`)** | ✅ | Access the value directly — crashes if nil. You've used this with `.first!` and `.last!` on arrays/strings. |
| 48 | **Implicitly Unwrapped Optionals** | 🔲 | `var name: String!` — used when a value is guaranteed after initialization (e.g., `@IBOutlet`). |

---

## 🟣 Level 6 — Object-Oriented Programming

> *Modeling real-world entities with types.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 49 | **Structs** | 🔲 | Value types — copied on assignment. Preferred for most data models in Swift. |
| 50 | **Classes** | 🔲 | Reference types — shared on assignment. Needed for inheritance and identity. |
| 51 | **Structs vs Classes** | 🔲 | Key differences: value vs reference semantics, inheritance, deinitializers, ARC behavior. |
| 52 | **Properties (Stored & Computed)** | 🔲 | Stored: hold a value. Computed: calculate a value on the fly. Also: `lazy`, `willSet`, `didSet`. |
| 53 | **Methods** | 🔲 | Instance and type methods. Use `mutating` for methods that modify struct properties. |
| 54 | **Initializers** | 🔲 | `init()` methods to set up instances. Supports default, custom, failable (`init?`), and required initializers. |
| 55 | **Inheritance** | 🔲 | Class-only feature. Use `override` for customization, `final` to prevent subclassing. |
| 56 | **Access Control** | 🔲 | `public`, `internal`, `fileprivate`, `private` — control what's visible to other code. |

**📂 Your code:**
- 📖 [Objects.md](file:///d:/Workspace/Desktop/Learning%20Swift/Objects/Objects.md) — **Preview and roadmap for this level**

---

## 🟤 Level 7 — Protocols & Generics

> *Writing flexible, reusable, and composable code.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 57 | **Protocols** | 🔲 | Define a contract (blueprint) that types must conform to. Swift's answer to interfaces. |
| 58 | **Protocol Extensions** | 🔲 | Add default implementations to protocols — enables "mix-in" style code sharing. |
| 59 | **Protocol-Oriented Programming** | 🔲 | Swift's preferred paradigm. Compose behaviors through protocols instead of class hierarchies. |
| 60 | **Generics** | 🔲 | Write type-flexible code — `func swap<T>(_ a: inout T, _ b: inout T)`. Powers most of Swift's standard library. |
| 61 | **Associated Types** | 🔲 | Placeholder types in protocols — `associatedtype Element`. Makes protocols generic. |
| 62 | **`some` & `any` Keywords** | 🔲 | Opaque types (`some Protocol`) and existential types (`any Protocol`) — key for SwiftUI and modern APIs. |

---

## ⚫ Level 8 — Enums & Pattern Matching

> *Swift's enums are far more powerful than in most languages.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 63 | **Basic Enums** | 🔲 | Define a group of related values — `enum Direction { case north, south, east, west }`. |
| 64 | **Raw Values** | 🔲 | Back enums with a type — `enum Planet: Int { case mercury = 1, venus, earth }`. |
| 65 | **Associated Values** | 🔲 | Attach data to cases — `case success(Data)`, `case failure(Error)`. Makes enums incredibly expressive. |
| 66 | **Pattern Matching (`switch` + `case let`)** | 🔲 | Destructure and match complex data — supports value binding, `where` clauses, and tuple patterns. |

---

## 🔷 Level 9 — Error Handling

> *Writing robust code that handles failure gracefully.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 67 | **`throw` / `throws` / `rethrows`** | 🔲 | Functions that can fail are marked `throws`. Errors are Swift values conforming to the `Error` protocol. |
| 68 | **`do-try-catch`** | 🔲 | The standard error handling pattern — `do { try riskyOp() } catch { handle(error) }`. |
| 69 | **`try?` and `try!`** | 🔲 | `try?` converts errors to nil. `try!` asserts success (crashes on error). Choose wisely. |
| 70 | **Custom Error Types** | 🔲 | Define your own error types with `enum MyError: Error { ... }` for descriptive, typed errors. |
| 71 | **`Result` Type** | 🔲 | `Result<Success, Failure>` — encapsulates either a success value or an error. Great for async code. |

---

## 🔶 Level 10 — Memory Management

> *Understanding how Swift manages object lifetimes behind the scenes.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 72 | **Automatic Reference Counting (ARC)** | 🔲 | Swift automatically tracks and frees memory for class instances. No garbage collector needed. |
| 73 | **Strong, Weak & Unowned References** | 🔲 | `strong` (default) keeps objects alive. `weak` and `unowned` break retain cycles. |
| 74 | **Retain Cycles & Memory Leaks** | 🔲 | Mutual strong references prevent deallocation. Use `weak`/`unowned` and capture lists to fix. |
| 75 | **Value Types vs Reference Types** | 🔲 | Structs/enums are value types (copied). Classes are reference types (shared). Huge implications for safety. |

---

## 💜 Level 11 — Concurrency

> *Modern async programming in Swift.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 76 | **`async` / `await`** | 🔲 | Write asynchronous code that reads like synchronous code. No more nested callbacks. |
| 77 | **`Task` & `TaskGroup`** | 🔲 | Structured concurrency — spawn concurrent work and manage its lifecycle. |
| 78 | **Actors** | 🔲 | Reference types that protect their mutable state from data races. Thread-safe by design. |
| 79 | **`@Sendable` & Data Race Safety** | 🔲 | Compiler-enforced thread safety. Mark closures and types that are safe to pass across concurrency boundaries. |
| 80 | **`MainActor`** | 🔲 | Ensures code runs on the main thread — essential for UI updates. |

---

## 💎 Level 12 — Advanced Swift

> *Deep features for power users and library authors.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 81 | **Extensions** | 🔲 | Add new methods, computed properties, and protocol conformances to *any* type — even types you don't own. |
| 82 | **Subscripts** | 🔲 | Custom index-based access — `myCollection[index]`. Define with the `subscript` keyword. |
| 83 | **Property Wrappers** | 🔲 | `@Published`, `@State`, `@AppStorage` — encapsulate common property patterns behind a reusable wrapper. |
| 84 | **Result Builders** | 🔲 | The magic behind SwiftUI's declarative syntax — `@ViewBuilder`, `@resultBuilder`. |
| 85 | **Keypaths** | 🔲 | Type-safe references to properties — `\Person.name`. Enables powerful functional patterns. |
| 86 | **Macros** (Swift 5.9+) | 🔲 | Compile-time code generation — `#Predicate`, `@Observable`. A modern metaprogramming tool. |

---

## 🌍 Level 13 — Ecosystem & Tooling

> *Beyond the language itself — the tools and platforms.*

| # | Topic | Status | Description |
|---|-------|--------|-------------|
| 87 | **Xcode & Playgrounds** | 🔲 | Apple's IDE for Swift development. Playgrounds allow interactive experimentation. |
| 88 | **Swift Package Manager (SPM)** | 🔲 | The official dependency manager. Define packages with `Package.swift`. |
| 89 | **REPL & Swift CLI** | 🔲 | Run Swift interactively from the command line or compile standalone scripts. |
| 90 | **Interoperability with Objective-C** | 🔲 | Bridging headers, `@objc` annotations — work with legacy Objective-C codebases seamlessly. |
| 91 | **Cross-Platform Support** | 🔲 | Swift runs on iOS, macOS, watchOS, tvOS, visionOS, Linux, and Windows. |
| 92 | **Open Source Community** | 🔲 | Swift is [open source on GitHub](https://github.com/apple/swift). Contributions from Apple and the community. |

---

## 📊 Progress Summary

```
Level  1  — Language Basics          █████████████████ 11 / 11  🎉 COMPLETE!
Level  2  — Control Flow             ███████████████░░ 10 / 11
Level  3  — Collections              █████████████░░░░  8 / 10
Level  4  — Functions & Closures     ████████░░░░░░░░░  4 / 10
Level  5  — Optionals & Safety       █████░░░░░░░░░░░░  2 / 6
Level  6  — OOP                      ░░░░░░░░░░░░░░░░░  0 / 8
Level  7  — Protocols & Generics     ░░░░░░░░░░░░░░░░░  0 / 6
Level  8  — Enums & Pattern Matching ░░░░░░░░░░░░░░░░░  0 / 4
Level  9  — Error Handling           ░░░░░░░░░░░░░░░░░  0 / 5
Level 10  — Memory Management        ░░░░░░░░░░░░░░░░░  0 / 4
Level 11  — Concurrency              ░░░░░░░░░░░░░░░░░  0 / 5
Level 12  — Advanced Swift           ░░░░░░░░░░░░░░░░░  0 / 6
Level 13  — Ecosystem & Tooling      ░░░░░░░░░░░░░░░░░  0 / 6
─────────────────────────────────────────────────────────────
Total                                                 35 / 92
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
│   ├── 📖 Collections.md
│   ├── Arrays.swift
│   ├── String.swift                 ← Moved here from Basic Introduction
│   └── Sets_and_Dict.Swift
├── Control Flow/
│   ├── 📖 Control Flow.md
│   └── ControlFlow.swift
├── Functions/
│   ├── 📖 Functions.md
│   └── functions.swift
├── Objects/
│   └── 📖 Objects.md               ← Ready for your next module
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
