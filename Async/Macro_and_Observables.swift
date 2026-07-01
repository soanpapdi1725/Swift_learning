
import Foundation
import Combine

// Macro -> just like in C/C++ it replaces the actual code on the place of the variable where ever in the program it is written during compile time
// it uses Combine

// @Observable is a macro introduced in Swift's Observation framework.
// It tells Swift to automatically observe changes to the properties of a class.
//
// Whenever a property of an @Observable object changes,
// SwiftUI automatically updates any views that are using that property.
//
// Example:
//
// Before API call:
// count = 1
// Screen shows: 1
//
// After API call:
// count = 2
// Screen automatically updates to: 2
//
// You don't need to manually tell the UI to refresh.
// Swift tracks which properties are read by the view and refreshes only
// the affected parts of the UI when those properties change.


import Foundation
import Combine



class Person: ObservableObject{
   @Published var name: String
   @Published var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let john = Person(name: "John", age: 25)
var cancellables = Set<AnyCancellable>()

john.$name.sink{
    newValue in print("Values of john name:", newValue )
    }.store(in: &cancellables)

    john.$age.sink{
        newAge in print("Value of age number: ", newAge)
    }.store(in: &cancellables)

    john.name = "Sonu"
    john.age = 22

