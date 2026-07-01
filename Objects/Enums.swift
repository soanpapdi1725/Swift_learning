// Enumerations 

enum Direction {
    case north
    case south
    case east
    case west
}

let move = Direction.south

switch move{
  case .north:
  print("Moving North")
  case .south:
  print("Moving south")
  case .east:
  print("Moving east")
  case .west:
  print("Moving west")
}

// we can also assign the values to the directly

enum Week: String {
    case monday = "Monday"
    case tuesday = "Tuesday"
    case wednesday = "Wednesday"
    case thursday = "Thursday"
    case friday = "Friday"
    case saturday = "Saturday"
    case sunday = "Sunday"
}

let today = Week.monday

print("Raw value of week", today)

if let day = Week(rawValue: "Sunday"){
  print("raw value day: ", day)
}

// we can take parameters in enums 
enum Result {
    case success(data: String)
    case failed(error: String)
}

let apiResponse = Result.success(data: "User is Loaded")

switch apiResponse {
  case .success(let data):
    print("user data is:", data)
  case .failed(let error):
    print("Log the error:", error)
}

// we can create Methods in Enums as well

enum TrafficLight {
  case red, green, yellow

  func action() {
    switch self {
    case .red:
      print("Traffic light is red")
    case .yellow:
      print("Traffic Light is Yellow")
    case .green:
      print("Traffic Light is Red")
    }
  }
}


let light = TrafficLight.red
light.action()
