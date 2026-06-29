# 🏗️ Objects in Swift

> Object-Oriented Programming in Swift — Structs, Classes, and everything that models real-world entities.
> This module is your next frontier after mastering functions!

---

## 📂 Files in This Module

| File | What It Covers |
|------|---------------|
| *No files yet* | 🚧 This module is under construction |

---

## 🗺️ What You'll Learn Here

This folder will cover **Level 6 — Object-Oriented Programming** from your learning roadmap. Here's a preview of what's coming:

---

### 1️⃣ Structs (Value Types)

Structs are Swift's **preferred way** to model data. They are **value types** — when you assign or pass a struct, a **copy** is made.

```swift
// Coming soon!
struct Person {
    var name: String
    var age: Int
}

var person1 = Person(name: "Sonu", age: 21)
var person2 = person1       // person2 is a COPY
person2.name = "Ravi"       // Only person2 changes
print(person1.name)         // Still "Sonu" ✅
```

### 2️⃣ Classes (Reference Types)

Classes are **reference types** — when you assign or pass a class, both variables **point to the same object**.

```swift
// Coming soon!
class Car {
    var brand: String
    init(brand: String) {
        self.brand = brand
    }
}

var car1 = Car(brand: "BMW")
var car2 = car1             // car2 points to SAME object
car2.brand = "Audi"         // Both change!
print(car1.brand)           // "Audi" — they share the same data
```

### 3️⃣ Structs vs Classes — Key Differences

| Feature | Struct | Class |
|---------|--------|-------|
| Type | Value type (copied) | Reference type (shared) |
| Inheritance | ❌ No | ✅ Yes |
| Deinitializer (`deinit`) | ❌ No | ✅ Yes |
| Memberwise initializer | ✅ Auto-generated | ❌ Must write manually |
| Identity (`===`) | ❌ No | ✅ Yes |
| Memory | Stack (faster) | Heap (slower, ARC managed) |

> 💡 **Swift's recommendation:** Use **structs by default**. Only use classes when you need inheritance or reference semantics.

---

## 🔮 Topics to Cover

- [ ] Structs — defining, properties, methods
- [ ] Classes — defining, reference semantics
- [ ] Structs vs Classes — when to use which
- [ ] Properties — stored, computed, `lazy`, `willSet`, `didSet`
- [ ] Methods — instance methods, type methods, `mutating`
- [ ] Initializers — `init()`, custom, failable (`init?`), required
- [ ] Inheritance — `override`, `super`, `final`
- [ ] Access Control — `public`, `internal`, `fileprivate`, `private`

---

> 💬 *"Objects turn your code from a flat script into a living model of the world."*
