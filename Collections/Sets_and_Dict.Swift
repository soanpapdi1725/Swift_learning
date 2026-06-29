// Dictionary are basically a type of array where values are stored in key: value pair, not as index: value pair

// In Dictionary it cannot gurrantee that the values will be stored in the order it was inserted

var studentMarks: [String: Int] = [
    "maths" : 55,
    "physics" : 75,
    "english" : 80
]

for (subject,mark) in studentMarks {
  print("Subject: \(subject) & marks:\(mark)")
}

// Guards
if let mathScore = studentMarks["maths"]{
  print("guard Checked if marks exist then printed", mathScore)
}


// Sets -> Sets is a collection of unique items

// Sets -> Sets is a collection of unique items

var mySet: Set<Int> = [5,2,6,2,6,5,0,0,2]

print("Printing set means No Repeatition of duplicate values: ", mySet) //output [5,6,0,2]
print("contains returns bool",mySet.contains(5))
