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
try is operator which tells that here can error occur 
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


// Async operations are done using Task block


//Task provides methods to do some waiting or delay or cancellation or concurrency related work

// concurrency means running two type of codes where they depend on each other

Task{
  print("Sleep")

  do{
    try await Task.sleep(for: .seconds(5))
  }catch{
    print("An error occurred")
  }
  print("again sleep")
}



func fetchData() async -> Int{
  try? await Task.sleep(for: .seconds(5))

  return 5
}

Task{
  print("data function is called")
let value = await fetchData()
  print("Data recieved  \(value)")
}

RunLoop.main.run() //Its job is to keep your program alive.

// Provide me the Task's methods and properties in very clean manner in Async.md