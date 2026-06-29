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

### 🔹 Array Properties

| Property | What It Does | Example | Output |
|----------|-------------|---------|--------|
| `.count` | Number of elements | `arr.count` | `6` |
| `.isEmpty` | Is the array empty? (returns `Bool`) | `arr.isEmpty` | `false` |
| `.first!` | First element | `arr.first!` | `1` |
| `.last!` | Last element | `arr.last!` | `6` |

> ⚠️ `.first` and `.last` return **Optionals** — they might be `nil` if the array is empty. The `!` force-unwraps them. Be careful with empty arrays!

### 🔸 Array Methods — Adding Elements

| Method | What It Does | Example | Result |
|--------|-------------|---------|--------|
| `.append(_)` | Adds **one** element to the end | `arr.append(7)` | `[1,2,3,4,5,6,7]` |
| `.append(contentsOf:)` | Adds **multiple** elements to the end | `arr.append(contentsOf: [8, 10])` | `[…, 7, 8, 10]` |
| `.insert(_, at:)` | Inserts element at a specific index | `arr.insert(9, at: 8)` | `9` inserted at index 8 |

### 🔹 Array Methods — Removing Elements

| Method | What It Does |
|--------|-------------|
| `.remove(at:)` | Removes element at a specific index |
| `.removeFirst()` | Removes & returns the first element |
| `.removeLast()` | Removes & returns the last element |
| `.removeAll()` | Empties the entire array |

### 🔸 Array Methods — Searching & Comparing

| Method | What It Does | Example | Output |
|--------|-------------|---------|--------|
| `.contains(_)` | Checks if element exists (returns `Bool`) | `arr.contains(5)` | `true` |
| `.min()!` | Returns the smallest value | `arr.min()!` | `1` |
| `.max()!` | Returns the largest value | `arr.max()!` | `10` |

### 🔹 Array Methods — Reordering

| Method | Mutating? | What It Does |
|--------|-----------|-------------|
| `.sort()` | ✅ Mutates original | Sorts the array in place |
| `.sorted()` | ❌ Returns new | Returns a sorted copy |
| `.reverse()` | ✅ Mutates original | Reverses the array in place |
| `.reversed()` | ❌ Returns new | Returns a reversed copy |
| `.shuffle()` | ✅ Mutates original | Shuffles the array in place |
| `.shuffled()` | ❌ Returns new | Returns a shuffled copy |
| `.swapAt(i, j)` | ✅ Mutates original | Swaps elements at two indices |

> 💡 **Pattern to remember:**
> - Method **without** `ed`/`d` suffix → **mutates** the original (`sort()`, `reverse()`, `shuffle()`)
> - Method **with** `ed`/`d` suffix → **returns a new copy** (`sorted()`, `reversed()`, `shuffled()`)

### 🔸 Higher-Order Array Methods

These are the **functional programming** methods — they take a closure (a mini-function) as input.

#### `map()` — Transform Every Element

Creates a **new array** by applying a function to every element.

```swift
var arr: [Int] = [1, 2, 3, 4, 5, 6]

// Long form: name the parameter
print(arr.map({ val in val * 2 }))     // → [2, 4, 6, 8, 10, 12]

// Short form: use $0 (shorthand for the first parameter)
print(arr.map({ $0 * 2 }))             // → [2, 4, 6, 8, 10, 12]
```

> 💡 `$0` is Swift's shorthand — it means "the first (and only) parameter passed into the closure." No need to name it.

#### `filter()` — Keep Only What Matches

Creates a **new array** with only elements that pass a condition.

```swift
// Keep even numbers
print(arr.filter({ num in num % 2 == 0 }))   // → [2, 4, 6]

// Keep odd numbers (using $0)
print(arr.filter({ $0 % 2 != 0 }))            // → [1, 3, 5]
```

#### `joined(separator:)` — Combine Into a String

Joins an array of **Strings** into a single string. The separator is optional.

```swift
// Problem: joined() only works on [String], not [Int]
// Solution: Convert Int → String first using map, then join

print(arr.map(String.init).joined(separator: ", "))
// → "1, 2, 3, 4, 5, 6"
```

> 💡 `String.init` is a shorthand for `{ String($0) }` — it converts each element to a String.

---

## 2️⃣ Strings

Strings are technically a **collection of characters** in Swift, which is why they live here.

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

Embed variables **inside** a string using `\(variableName)`.

```swift
let name = "Sonu"
let age = 17

print("My name is \(name) and I am \(age) years old")
// → My name is Sonu and I am 17 years old
```

You can also use commas in `print()`, but it automatically adds spaces:

```swift
print("My name is", name, "I am", age, "years old")
// → My name is Sonu I am 17 years old
```

> 💡 **Interpolation `\()` is cleaner** — use it instead of commas when you want full control over spacing.

### 🔸 String Properties & Methods

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

### 🔹 Methods That Mutate vs Return New

| Type | Methods | Need `var`? |
|------|---------|-------------|
| **Mutating** (changes original) | `.append()`, `.removeFirst()`, `.removeLast()` | ✅ Yes — must be `var` |
| **Non-mutating** (returns new) | `.uppercased()`, `.lowercased()`, `.replacingOccurrences()`, `.split()` | ❌ Can be `let` |

---

## 3️⃣ Dictionaries

A **Dictionary** stores data as **key-value pairs** instead of indexed positions. Think of it like a real dictionary — you look up a word (key) to find its definition (value).

### 🔸 Creating Dictionaries

```swift
var studentMarks: [String: Int] = [
    "maths" : 55,
    "physics" : 75,
    "english" : 80
]
```

> 💡 The type annotation `[String: Int]` means: keys are `String`, values are `Int`.

### 🔹 Iterating Over a Dictionary

```swift
for (subject, mark) in studentMarks {
    print("Subject: \(subject) & marks: \(mark)")
}
```

> ⚠️ **Dictionaries are unordered** — every time you run the code, the key-value pairs might print in a different order!

### 🔸 Safe Access with Optional Binding

Since a key might not exist, accessing a dictionary value returns an **Optional**. Use `if let` to safely unwrap:

```swift
if let mathScore = studentMarks["maths"] {
    print("Math score:", mathScore)    // → 55
}
```

> 💡 This is the **safe way** to read dictionary values — if the key doesn't exist, the code inside `if let` simply doesn't run. No crash!

---

## 4️⃣ Sets

A **Set** is a collection of **unique values** — duplicates are automatically removed. Sets are also **unordered**.

### 🔸 Creating Sets

```swift
var mySet: Set<Int> = [5, 2, 6, 2, 6, 5, 0, 0, 2]
print(mySet)    // → [5, 6, 0, 2]  (duplicates removed!)
```

> 💡 Even though you passed `[5, 2, 6, 2, 6, 5, 0, 0, 2]`, the set only keeps **one of each**.

### 🔹 Set Methods You've Used

| Method | What It Does | Example | Output |
|--------|-------------|---------|--------|
| `.contains(_)` | Checks if value exists (returns `Bool`) | `mySet.contains(5)` | `true` |

### 🔸 Other Useful Set Properties & Methods (Reference)

| Method / Property | What It Does |
|-------------------|-------------|
| `.count` | Number of unique elements |
| `.isEmpty` | Is the set empty? |
| `.insert(_)` | Add a new element |
| `.remove(_)` | Remove a specific element |
| `.union(_)` | Combine two sets (all elements from both) |
| `.intersection(_)` | Elements common to both sets |
| `.subtracting(_)` | Elements in first set but not in second |
| `.symmetricDifference(_)` | Elements in either set, but not both |
| `.isSubset(of:)` | Is this set fully contained in another? |
| `.isSuperset(of:)` | Does this set fully contain another? |

> 💡 **When to use Set vs Array:**
> - Use **Array** when **order matters** or you need **duplicates**.
> - Use **Set** when you need **uniqueness** and fast **membership testing** (`.contains()` is faster on Sets).

---

## 📋 Quick Reference Cheat Sheet

### Arrays
```swift
var arr: [Int] = [1, 2, 3]
arr.append(4)                          // Add to end
arr.insert(0, at: 0)                   // Insert at index
arr.remove(at: 2)                      // Remove at index
arr.contains(3)                        // true
arr.map({ $0 * 2 })                    // [2, 4, 6]
arr.filter({ $0 % 2 == 0 })           // Even numbers
arr.map(String.init).joined(separator: ", ")  // "1, 2, 3"
arr.sort()                             // Sort in place
arr.sorted()                           // Return sorted copy
```

### Dictionaries
```swift
var dict: [String: Int] = ["key": 42]
dict["newKey"] = 100                   // Add/update
if let val = dict["key"] { print(val) } // Safe access
for (k, v) in dict { print(k, v) }    // Iterate
```

### Sets
```swift
var set: Set<Int> = [1, 2, 3, 3]       // → {1, 2, 3}
set.contains(2)                         // true
set.insert(4)                           // Add element
set.union([5, 6])                       // Combine sets
```

### Strings
```swift
let str = "Hello"
str.count                               // 5
str.uppercased()                        // "HELLO"
str.contains("ell")                     // true
str.split(separator: "l")              // ["He", "", "o"]
"\(str) World"                          // "Hello World"
```

---

## ✅ What You've Learned in This Module

- [x] Arrays — creating, properties (`.count`, `.isEmpty`, `.first`, `.last`)
- [x] Array methods — `append`, `insert`, `remove`, `contains`, `swapAt`, `min`, `max`
- [x] Higher-order functions — `map()`, `filter()`, `joined()`
- [x] Mutating vs non-mutating — `sort()` vs `sorted()`, `reverse()` vs `reversed()`
- [x] Strings — creation, interpolation, 14+ methods
- [x] Dictionaries — key-value pairs, iteration, optional binding
- [x] Sets — unique collections, `.contains()`
- [x] `$0` shorthand in closures

## 🔜 What's Coming Next

- [ ] Tuples — grouping multiple values
- [ ] `compactMap` and `flatMap`
- [ ] `reduce()` — combining array into a single value
- [ ] Set operations in detail — union, intersection, subtracting

---

> 💬 *"Collections are the backbone of any app — master them and you can handle any data."*
