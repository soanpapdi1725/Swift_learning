// Strings

let message = "Single Liner"

// spaces are countable in multi-line strings -> print same as u write in it
let multiLineMessage = """
Roses are red,
          Violets are blue,
          Swift is awesome,
And so are you.
"""

 print(message)
 print(multiLineMessage)

//  String Interpolation --> use other datatype variables within strings
// you can do so by just using "\(variable_name)"
let name = "Sonu"
let age = 17

print("my name is \(name) and i am \(age) years old)")
// In this by default it inserts space
print("My name is ", name, " i am ", age, " years old")


// String Method's and Properties
var name = "Sonu"
print(name.isEmpty); // false
print("Length of String is shown using .count on any String:",name.count)
// ! means so basically say to compiler that it won't be undefined or nil believe me

// First
print("first Returns the first character.:",name.first!)

// Last
print("last Returns the last character.:",name.last!)

// Uppercased
print("Convert to uppercase:", name.uppercased())

// LowerCased
name = "SONU"
print("Convert to lowercase:",name.lowercased())

name = "Sonu"
// hasPrefix
print("hasPrefix -> Checks whether a string starts with something & returns bool.", name.hasPrefix("So"))
// hasSuffix
print("hasSuffix -> Checks whether a string ends with something & returns bool.", name.hasSuffix("nu"))
// append
print("Append -> concat the string with new value from back: ", name.append(" Yadav"))
print(name);

// split(separator:)
print("Split -> Splits the String and makes it a array: ", name.split(separator: " "))

// isEmpty -> r
name = ""
print("isEmpty Checks whethe it is empty or not",name.isEmpty)

// contains
var sentence: String = "swift is awesome"
print("contains checks whether the string contains or not: ", sentence.contains("is"))

// removeFirst
print("removes last character: ", sentence.removeFirst())
print(sentence)

// removeLast
print("removes last character: ", sentence.removeLast())
print(sentence)

// replacingOccurrences(of:, with:)
sentence = sentence.replacingOccurrences(of:"wift", with: "swift")
print("replacing of wift with swift: ", sentence)

