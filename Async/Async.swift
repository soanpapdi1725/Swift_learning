enum ParseError: Error {
  case notNumber
}

// Error is a class in Swift which confirm protocol Error

func convertToInt(_ str: String) throws -> Int {
  guard let val = Int(str) else {
    throw ParseError.notNumber
  }
  return val
}

/*
try: Use try when you want to handle the error.
try?: Try this function. If it throws an error, don't crash—just return nil.
try: I'm 100% sure this function will never throw an error.
*/

do{
  let  result = try convertToInt("44")
  print("\(result)")
}catch{
  print("Not a Number")
}