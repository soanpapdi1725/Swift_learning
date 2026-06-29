# 📸 Error Screenshots

> A collection of error screenshots captured during your Swift learning journey.
> These serve as visual references for common mistakes and how Swift's compiler catches them.

---

## 📂 Files in This Module

| File | What It Shows |
|------|--------------|
| [let(Constant)_Cannot_Changed.png](file:///d:/Workspace/Desktop/Learning%20Swift/Error%20Screenshots/let(Constant)_Cannot_Changed.png) | Compiler error when trying to modify a `let` constant |

---

## 1️⃣ `let` (Constant) Cannot Be Changed

### 🔸 What Happened

You tried to reassign a value to a variable declared with `let` (a constant). Swift's compiler immediately caught this and threw an error.

### 🔹 The Rule

```swift
let statusCode = 20
statusCode = 25    // ❌ ERROR: Cannot assign to value: 'statusCode' is a 'let' constant
```

### 🔑 Why This Error Matters

| Concept | Explanation |
|---------|-------------|
| **What is `let`?** | Declares a **constant** — a value that can never change after it's set |
| **Why does Swift enforce this?** | Immutability prevents accidental changes, makes code safer and more predictable |
| **How to fix it** | Use `var` instead of `let` if you need to change the value later |

```swift
// ❌ This causes the error
let statusCode = 20
statusCode = 25        // Compiler error!

// ✅ This works
var statusCode = 20
statusCode = 25        // Allowed — var can change
```

### 💡 Lesson Learned

> **Always use `let` by default.** Only switch to `var` when you actually need to modify the value. This is a Swift best practice — the compiler will guide you if you need to change it.

---

## 📝 How to Use This Folder

This folder is your **error diary**. As you learn Swift, you'll encounter more compiler errors. Save screenshots here to:

1. **Remember** what went wrong
2. **Understand** why Swift prevents certain patterns
3. **Learn** the correct approach

### Suggested Naming Convention

```
ErrorType_BriefDescription.png
```

Examples:
- `let(Constant)_Cannot_Changed.png` ✅
- `Type_Mismatch_Int_String.png`
- `Optional_Force_Unwrap_Nil.png`
- `Missing_Return_Statement.png`

---

> 💬 *"Errors aren't failures — they're lessons. Swift's compiler is your strictest but most helpful teacher."*
