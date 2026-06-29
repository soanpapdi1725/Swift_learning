//Collections

// Array

// We cannot use "let" with array if we are using them then they will be pure immutable
// if u want to add or delete in array declare it with "var"

var arr: [Int] = [1, 2, 3, 4, 5, 6]

// 1. Count
print("Length of array using count property:", arr.count)

// 2. isEmpty -> Returns Bool
print("isEmpty -> Returns Bool:", arr.isEmpty)

// 3. first
print("first Returns first element of the array:", arr.first!)

// 3. last
print("last Returns last element of the array:", arr.last!)

// Methods

// 1. append
arr.append(7)
print("append(Push) Adds one New Element from back:", arr)

// 2. append(contentsOf: []) -> will add your given array to the back
arr.append(contentsOf: [8, 10])
print("append(Push) Adds multiple New Element from back:", arr)

// 3. insert(_, at:_)
arr.insert(9, at: 8)
print("insert new element at the given index:", arr)

// 4. remove(at:_), there are multiple methods for remove as well removeFirst(), removeLast(), removeAll()
arr.remove(at: 9)
print("insert new element at the given index:", arr)

// 5. contains(_) : -> returns Bool
print("Contains returns bool :", arr.contains(5))

// 6. swapAt(index1, index2)
arr.swapAt(2, 8)
print("swapAt Swapped the value on index 2 & 8: ", arr)

// 7. min
print("min for minimum value in the array:", arr.min()!)

// 8. max
print("max for maximum value in the array: ", arr.max()!)

// 9. map() creates a new array by applying a function to every element of an existing array.
//  $0 gives value one by one of an array which we can use to modify the array
//  gives a value v & after in return what you want

print("Multiplying the array with 2 using map: ", arr.map({ val in val*2 }))
print("Multiplying the array with 2 using map($): ", arr.map({ $0 * 2 }))

// 10. filter() -> filters the array, such as if u want to make array of even numbers
//  $0 gives value one by one of an array which we can use to modify the array
//  gives a value v & after in return what you want

print("filtering Even items in the array:",arr.filter({num in num % 2 == 0}))
print("filtering Odds items in the array(using $):",arr.filter({$0 % 2 != 0}))
// 11. joined(separator: "_") -> separator is optional
// print("joined joins the array: ", arr.joined(separator: ", "))
// we cannot use separator of string in Int /
// to do that we have to first convert the array of Int to String

print("using joined with map to convert array of Int to array of String then joining it with ,", arr.map(String.init).joined(separator: ", "))

// 12. sort() -> Sorts the original array
//    sorted() -> Sorts and returns a new array

// 13. reverse() -> reverses the original Array
//    reversed() -> after reversing returns the new array

// 14. shuffle() -> shuffles the original Array
//    shuffled() -> after shuffling returns the new array
