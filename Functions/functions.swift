// Swift has external and Internal Parameters which means internally on what name they are getting called and outside they are called by some other name

// External Parameters are like positional Arguments on function call

func  printSqr(numInStr: String){
    guard let n = Int(numInStr) else {
        print("Failed to convert String to number make sure to pass number only")
        return;
    }
    print(n*n);
}

printSqr(numInStr: "8")
printSqr(numInStr: "8")
printSqr(numInStr:"Hello")

// Swift has external and Internal Parameters which means internally on what name they are getting called and outside they are called by some other name

// If you don't want external parameter just put _ and it will not be required

func  printSqr2(_ numInStr: String){
    guard let n = Int(numInStr) else {
        print("Failed to convert String to number make sure to pass number only")
        return;
    }
    print(n*n);
}

printSqr2("8")
printSqr2("8")
printSqr2("Hello")