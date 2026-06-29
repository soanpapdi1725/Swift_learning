# 📦 Collections in Swift

> Everything about storing, organizing, and manipulating groups of data.
> This guide covers Arrays, Strings, Sets, and Dictionaries — all from your code in this module.

---

## 📂 Files in This Module

| File | What It Covers |
|------|---------------|
| [Arrays.swift](file:///d:/Workspace/Desktop/Learning%20Swift/Collections/Arrays.swift) | Array properties, methods (`map`, `filter`, `joined`, etc.) |
| [String.swift](file:///d:/Workspace/Desktop/Learning%20Swift/Collections/String.swift) | Strings, string interpolation, and 14+ string methods |
| [Sets_and_Dict.Swift](file:///d:/Workspace/Desktop/Learning%20Swift/Collections/Sets_and_Dict.Swift) | Sets (unique collections) and Dictionaries (key-value pairs) |

---

## 1️⃣ Arrays

An **Array** is an ordered collection of values of the same type, accessed by numeric index (starting at `0`).

### 🔑 Key Rule: `let` vs `var`

| Declaration | Mutability | Can Add/Remove? |
|-------------|-----------|----------------|
| `let arr = [1, 2, 3]` | ❌ Immutable | No — completely locked |
| `var arr = [1, 2, 3]` | ✅ Mutable | Yes — add, remove, modify freely |

> 💡 **If you need to change the array later, always use `var`.**

### 🔸 Creating Arrays

```swift
// With type annotation
var arr: [Int] = [1, 2, 3, 4, 5, 6]

// With type inference
var fruits = ["Apple", "Banana", "Mango"]

// Empty array (type annotation required)
var emptyArr: [String] = []
```

### 🔹 Array Properties — Complete Reference

| Property | What It Does | Returns | Example | Output |
|----------|-------------|---------|---------|--------|
| `.count` | Number of elements | `Int` | `arr.count` | `6` |
| `.isEmpty` | Is the array empty? | `Bool` | `arr.isEmpty` | `false` |
| `.first` | First element (Optional) | `Element?` | `arr.first!` | `1` |
| `.last` | Last element (Optional) | `Element?` | `arr.last!` | `6` |
| `.startIndex` | Index of first element | `Int` | `arr.startIndex` | `0` |
| `.endIndex` | Index **after** the last element | `Int` | `arr.endIndex` | `6` |
| `.indices` | Range of valid indices | `Range<Int>` | `arr.indices` | `0..<6` |
| `.capacity` | Total allocated capacity | `Int` | `arr.capacity` | varies |
| `.description` | String representation | `String` | `arr.description` | `"[1, 2, 3, 4, 5, 6]"` |

> ⚠️ `.first` and `.last` return **Optionals** — they might be `nil` if the array is empty. The `!` force-unwraps them. Be careful with empty arrays!

### 🔸 Array Methods — Complete Reference

#### Adding Elements

| Method | What It Does | Mutates? | Example |
|--------|-------------|----------|---------|
| `.append(_)` | Add **one** element to end | ✅ Yes | `arr.append(7)` |
| `.append(contentsOf:)` | Add **multiple** elements to end | ✅ Yes | `arr.append(contentsOf: [8, 10])` |
| `.insert(_, at:)` | Insert at specific index | ✅ Yes | `arr.insert(9, at: 8)` |

#### Removing Elements

| Method | What It Does | Returns | Mutates? |
|--------|-------------|---------|----------|
| `.remove(at:)` | Remove at specific index | Removed element | ✅ Yes |
| `.removeFirst()` | Remove & return first | First element | ✅ Yes |
| `.removeLast()` | Remove & return last | Last element | ✅ Yes |
| `.removeAll()` | Empty the array | `Void` | ✅ Yes |
| `.removeAll(where:)` | Remove matching elements | `Void` | ✅ Yes |
| `.popLast()` | Remove & return last (safe) | `Element?` | ✅ Yes |

#### Searching

| Method | What It Does | Returns | Example | Output |
|--------|-------------|---------|---------|--------|
| `.contains(_)` | Element exists? | `Bool` | `arr.contains(5)` | `true` |
| `.contains(where:)` | Any element matches condition? | `Bool` | `arr.contains { $0 > 5 }` | `true` |
| `.firstIndex(of:)` | Index of first match | `Int?` | `arr.firstIndex(of: 3)` | `2` |
| `.lastIndex(of:)` | Index of last match | `Int?` | `arr.lastIndex(of: 3)` | `2` |
| `.first(where:)` | First element matching condition | `Element?` | `arr.first { $0 > 3 }` | `4` |
| `.min()` | Smallest value | `Element?` | `arr.min()!` | `1` |
| `.max()` | Largest value | `Element?` | `arr.max()!` | `6` |

#### Reordering

| Method | What It Does | Mutates? | Returns New? |
|--------|-------------|----------|-------------|
| `.sort()` | Sort in place | ✅ Yes | ❌ |
| `.sorted()` | Return sorted copy | ❌ No | ✅ Yes |
| `.reverse()` | Reverse in place | ✅ Yes | ❌ |
| `.reversed()` | Return reversed copy | ❌ No | ✅ Yes |
| `.shuffle()` | Shuffle in place | ✅ Yes | ❌ |
| `.shuffled()` | Return shuffled copy | ❌ No | ✅ Yes |
| `.swapAt(i, j)` | Swap two elements | ✅ Yes | ❌ |

> 💡 **Pattern to remember:**
> - **No suffix** → **mutates** the original (`sort()`, `reverse()`, `shuffle()`)
> - **`-ed` / `-d` suffix** → **returns a new copy** (`sorted()`, `reversed()`, `shuffled()`)

#### Transforming (Higher-Order Methods)

| Method | What It Does | Returns |
|--------|-------------|---------|
| `.map { }` | Transform every element | New array of transformed values |
| `.filter { }` | Keep only matching elements | New filtered array |
| `.reduce(initial, +)` | Combine all into one value | Single value |
| `.compactMap { }` | Map + remove nils | New array without nils |
| `.flatMap { }` | Map + flatten nested arrays | Flattened array |
| `.forEach { }` | Execute for each (no return) | `Void` |

#### Other Useful Methods

| Method | What It Does | Returns |
|--------|-------------|---------|
| `.joined(separator:)` | Join `[String]` into one `String` | `String` |
| `.enumerated()` | Pairs of (index, element) | Sequence of tuples |
| `.prefix(_)` | First N elements | `ArraySlice` |
| `.suffix(_)` | Last N elements | `ArraySlice` |
| `.dropFirst(_)` | Remove first N elements | `ArraySlice` |
| `.dropLast(_)` | Remove last N elements | `ArraySlice` |

### 🔸 `map()` — Transform Every Element

```swift
// Long form
print(arr.map({ val in val * 2 }))     // → [2, 4, 6, 8, 10, 12]

// Short form with $0
print(arr.map({ $0 * 2 }))             // → [2, 4, 6, 8, 10, 12]
```

> 💡 `$0` is Swift's shorthand for "the first parameter passed into the closure."

### 🔹 `filter()` — Keep Only What Matches

```swift
print(arr.filter({ num in num % 2 == 0 }))   // → [2, 4, 6]
print(arr.filter({ $0 % 2 != 0 }))            // → [1, 3, 5]
```

### 🔸 `joined(separator:)` — Combine Into a String

```swift
// Only works on [String], so convert [Int] first:
print(arr.map(String.init).joined(separator: ", "))
// → "1, 2, 3, 4, 5, 6"
```

> 💡 `String.init` is shorthand for `{ String($0) }`.

### 🔹 `reduce(initial, operation)` — Combine All Into One Value

```swift
// Sum of all elements
let total = [1, 2, 3, 8, 9, 9, 5].reduce(0, +)    // → 37

// How it works: 0 + 1 + 2 + 3 + 8 + 9 + 9 + 5 = 37
```

---

## 2️⃣ Strings

Strings are technically a **collection of characters** in Swift.

### 🔸 Creating Strings

```swift
let message = "Single Liner"

let multiLineMessage = """
Roses are red,
          Violets are blue,
          Swift is awesome,
And so are you.
"""
```

> 💡 In multi-line strings, **spaces and line breaks are preserved exactly as you write them.**

### 🔹 String Interpolation

Embed variables inside a string using `\(variableName)`:

```swift
let name = "Sonu"
let age = 17
print("My name is \(name) and I am \(age) years old")
```

### 🔸 String Properties — Complete Reference

| Property | What It Does | Returns | Example | Output |
|----------|-------------|---------|---------|--------|
| `.count` | Number of characters | `Int` | `"Sonu".count` | `4` |
| `.isEmpty` | Is string empty? | `Bool` | `"Sonu".isEmpty` | `false` |
| `.first` | First character (Optional) | `Character?` | `"Sonu".first!` | `S` |
| `.last` | Last character (Optional) | `Character?` | `"Sonu".last!` | `u` |
| `.startIndex` | Index of first character | `String.Index` | — | — |
| `.endIndex` | Index after last character | `String.Index` | — | — |
| `.utf8` | UTF-8 code units | `String.UTF8View` | — | — |
| `.utf16` | UTF-16 code units | `String.UTF16View` | — | — |
| `.unicodeScalars` | Unicode scalar values | `UnicodeScalarView` | — | — |

### 🔹 String Methods — Complete Reference

#### Case Conversion

| Method | What It Does | Mutates? | Example | Output |
|--------|-------------|----------|---------|--------|
| `.uppercased()` | All UPPERCASE | ❌ | `"Sonu".uppercased()` | `"SONU"` |
| `.lowercased()` | All lowercase | ❌ | `"SONU".lowercased()` | `"sonu"` |
| `.capitalized` | First Letter Of Each Word | ❌ | `"hello world".capitalized` | `"Hello World"` |

#### Checking Content

| Method | What It Does | Returns | Example | Output |
|--------|-------------|---------|---------|--------|
| `.hasPrefix(_)` | Starts with? | `Bool` | `"Sonu".hasPrefix("So")` | `true` |
| `.hasSuffix(_)` | Ends with? | `Bool` | `"Sonu".hasSuffix("nu")` | `true` |
| `.contains(_)` | Contains substring? | `Bool` | `"swift is awesome".contains("is")` | `true` |

#### Modifying (Mutating — requires `var`)

| Method | What It Does | Returns |
|--------|-------------|---------|
| `.append(_)` | Add text to end | `Void` |
| `.removeFirst()` | Remove & return first char | `Character` |
| `.removeLast()` | Remove & return last char | `Character` |
| `.removeFirst(_)` | Remove first N chars | `Void` |
| `.removeLast(_)` | Remove last N chars | `Void` |
| `.removeAll()` | Clear entire string | `Void` |
| `.insert(_, at:)` | Insert character at index | `Void` |

#### Transforming (Non-mutating — works with `let`)

| Method | What It Does | Returns |
|--------|-------------|---------|
| `.replacingOccurrences(of:with:)` | Find & replace | New `String` |
| `.split(separator:)` | Split into array | `[Substring]` |
| `.trimmingCharacters(in:)` | Remove whitespace/newlines from edges | New `String` |
| `.padding(toLength:withPad:startingAt:)` | Pad to length | New `String` |
| `.components(separatedBy:)` | Split by string (Foundation) | `[String]` |
| `.prefix(_)` | First N characters | `Substring` |
| `.suffix(_)` | Last N characters | `Substring` |
| `.dropFirst(_)` | Remove first N chars (new string) | `Substring` |
| `.dropLast(_)` | Remove last N chars (new string) | `Substring` |
| `.reversed()` | Reverse the characters | `ReversedCollection` |

### 🔑 Mutating vs Non-Mutating Methods

| Type | Methods | Need `var`? |
|------|---------|-------------|
| **Mutating** | `.append()`, `.removeFirst()`, `.removeLast()`, `.insert()` | ✅ Yes |
| **Non-mutating** | `.uppercased()`, `.lowercased()`, `.replacingOccurrences()`, `.split()`, `.contains()` | ❌ Can be `let` |

---

## 3️⃣ Dictionaries

A **Dictionary** stores data as **key-value pairs**. Think of it like a real dictionary — you look up a word (key) to find its definition (value).

### 🔸 Creating Dictionaries

```swift
var studentMarks: [String: Int] = [
    "maths" : 55,
    "physics" : 75,
    "english" : 80
]
```

### 🔹 Iterating Over a Dictionary

```swift
for (subject, mark) in studentMarks {
    print("Subject: \(subject) & marks: \(mark)")
}
```

> ⚠️ **Dictionaries are unordered** — print order varies each run!

### 🔸 Safe Access with Optional Binding

```swift
if let mathScore = studentMarks["maths"] {
    print("Math score:", mathScore)    // → 55
}
```

### 🔹 Dictionary Properties — Complete Reference

| Property | What It Does | Returns | Example |
|----------|-------------|---------|---------|
| `.count` | Number of key-value pairs | `Int` | `dict.count` |
| `.isEmpty` | Is dictionary empty? | `Bool` | `dict.isEmpty` |
| `.keys` | All keys | `Dictionary.Keys` | `dict.keys` |
| `.values` | All values | `Dictionary.Values` | `dict.values` |
| `.first` | First key-value pair (random) | `(key, value)?` | `dict.first` |

### 🔸 Dictionary Methods — Complete Reference

| Method | What It Does | Mutates? | Example |
|--------|-------------|----------|---------|
| `dict[key]` | Get value (returns Optional) | ❌ | `dict["maths"]` → `55?` |
| `dict[key] = value` | Set/update value | ✅ | `dict["science"] = 90` |
| `.updateValue(_,forKey:)` | Update, return old value | ✅ | `dict.updateValue(60, forKey: "maths")` |
| `.removeValue(forKey:)` | Remove key-value pair | ✅ | `dict.removeValue(forKey: "maths")` |
| `dict[key] = nil` | Remove by setting nil | ✅ | `dict["maths"] = nil` |
| `.removeAll()` | Clear dictionary | ✅ | `dict.removeAll()` |
| `.contains(where:)` | Check if condition met | ❌ | `dict.contains { $0.value > 70 }` |
| `.mapValues { }` | Transform all values | ❌ | `dict.mapValues { $0 + 10 }` |
| `.filter { }` | Keep matching pairs | ❌ | `dict.filter { $0.value > 60 }` |
| `.merge(_,uniquingKeysWith:)` | Merge two dicts | ✅ | `dict.merge(other) { old, new in new }` |
| `.sorted(by:)` | Sort into array of tuples | ❌ | `dict.sorted { $0.key < $1.key }` |

---

## 4️⃣ Sets

A **Set** is a collection of **unique values** — duplicates are automatically removed. Sets are also **unordered**.

### 🔸 Creating Sets

```swift
var mySet: Set<Int> = [5, 2, 6, 2, 6, 5, 0, 0, 2]
print(mySet)    // → [5, 6, 0, 2]  (duplicates removed!)
```

### 🔹 Set Properties — Complete Reference

| Property | What It Does | Returns | Example |
|----------|-------------|---------|---------|
| `.count` | Number of unique elements | `Int` | `mySet.count` |
| `.isEmpty` | Is set empty? | `Bool` | `mySet.isEmpty` |
| `.first` | Any one element (random) | `Element?` | `mySet.first` |

### 🔸 Set Methods — Complete Reference

#### Basic Operations

| Method | What It Does | Mutates? | Returns |
|--------|-------------|----------|---------|
| `.contains(_)` | Element exists? | ❌ | `Bool` |
| `.insert(_)` | Add element | ✅ | `(inserted: Bool, memberAfterInsert: Element)` |
| `.remove(_)` | Remove specific element | ✅ | `Element?` (nil if not found) |
| `.removeAll()` | Clear the set | ✅ | `Void` |
| `.update(with:)` | Insert or replace | ✅ | `Element?` |
| `.randomElement()` | Get random element | ❌ | `Element?` |

#### Set Algebra Operations

These are the **mathematical set operations** — extremely powerful:

| Method | What It Does | Visual | Returns |
|--------|-------------|--------|---------|
| `.union(_)` | All elements from both sets | A ∪ B | New `Set` |
| `.intersection(_)` | Elements common to both | A ∩ B | New `Set` |
| `.subtracting(_)` | Elements in A but NOT in B | A - B | New `Set` |
| `.symmetricDifference(_)` | Elements in either, but NOT both | A △ B | New `Set` |

```swift
let a: Set = [1, 2, 3, 4, 5]
let b: Set = [3, 4, 5, 6, 7]

a.union(b)                // → [1, 2, 3, 4, 5, 6, 7]
a.intersection(b)         // → [3, 4, 5]
a.subtracting(b)          // → [1, 2]
a.symmetricDifference(b)  // → [1, 2, 6, 7]
```

#### Set Comparison Operations

| Method | What It Does | Returns |
|--------|-------------|---------|
| `.isSubset(of:)` | Is this set fully inside another? | `Bool` |
| `.isSuperset(of:)` | Does this set fully contain another? | `Bool` |
| `.isStrictSubset(of:)` | Subset AND not equal? | `Bool` |
| `.isStrictSuperset(of:)` | Superset AND not equal? | `Bool` |
| `.isDisjoint(with:)` | No common elements? | `Bool` |

#### Mutating Variants

| Non-Mutating | Mutating Variant |
|-------------|------------------|
| `.union(_)` | `.formUnion(_)` |
| `.intersection(_)` | `.formIntersection(_)` |
| `.subtracting(_)` | `.subtract(_)` |
| `.symmetricDifference(_)` | `.formSymmetricDifference(_)` |

> 💡 **When to use Set vs Array:**
> - **Array** → when **order matters** or you need **duplicates**
> - **Set** → when you need **uniqueness** and fast `.contains()` (O(1) vs O(n) for arrays)

---

## 📋 Quick Reference Cheat Sheet

### Arrays
```swift
var arr: [Int] = [1, 2, 3]
arr.append(4)                          // Add to end
arr.insert(0, at: 0)                   // Insert at index
arr.remove(at: 2)                      // Remove at index
arr.contains(3)                        // true
arr.map({ $0 * 2 })                    // Transform: [2, 4, 6]
arr.filter({ $0 % 2 == 0 })           // Filter: even numbers
arr.reduce(0, +)                       // Sum all elements
arr.map(String.init).joined(separator: ", ")  // "1, 2, 3"
arr.sort()                             // Sort in place
arr.sorted()                           // Return sorted copy
```

### Strings
```swift
let str = "Hello"
str.count                               // 5
str.uppercased()                        // "HELLO"
str.contains("ell")                     // true
str.split(separator: "l")              // ["He", "", "o"]
str.hasPrefix("He")                     // true
str.replacingOccurrences(of: "H", with: "J")  // "Jello"
"\(str) World"                          // "Hello World"
```

### Dictionaries
```swift
var dict: [String: Int] = ["key": 42]
dict["newKey"] = 100                   // Add/update
dict["key"] = nil                      // Remove
if let val = dict["key"] { print(val) } // Safe access
for (k, v) in dict { print(k, v) }    // Iterate
dict.keys                              // All keys
dict.values                            // All values
```

### Sets
```swift
var set: Set<Int> = [1, 2, 3, 3]       // → {1, 2, 3}
set.contains(2)                         // true
set.insert(4)                           // Add element
set.union([5, 6])                       // All from both
set.intersection([2, 3])               // Common elements
set.subtracting([1])                    // Remove 1
```

---

## ✅ What You've Learned in This Module

- [x] Arrays — creating, `let` vs `var` mutability
- [x] Array properties — `.count`, `.isEmpty`, `.first`, `.last`
- [x] Array methods — `append`, `insert`, `remove`, `contains`, `swapAt`, `min`, `max`
- [x] Higher-order functions — `map()`, `filter()`, `joined()`, `reduce()`
- [x] Mutating vs non-mutating — `sort()` vs `sorted()`, `reverse()` vs `reversed()`
- [x] `$0` shorthand in closures
- [x] Strings — creation, multi-line, interpolation
- [x] String methods — 14+ methods (case, prefix, suffix, split, replace, etc.)
- [x] Dictionaries — key-value pairs, iteration, safe access with `if let`
- [x] Sets — unique collections, `.contains()`, duplicates removed

## 🔜 What's Coming Next

- [ ] Tuples — grouping multiple values
- [ ] `compactMap` and `flatMap` in practice
- [ ] Set operations — union, intersection, subtracting (reference tables above)
- [ ] `enumerated()` — loop with index and value

---

> 💬 *"Collections are the backbone of any app — master them and you can handle any data."*
