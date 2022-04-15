// Force un-wrap
let myOptional: String?
myOptional = "Richard"

let text: String = myOptional!

// Optional check
if myOptional != nil {
    let text: String = myOptional!
    let text2: String = myOptional!
} else {
    print("myOptional was nil")
}

// Optional Binding
if let safeOptional = myOptional {
    let text: String = safeOptional
    print(text)
} else {
    print("myOptional was nil")
}

// Nil coalescing operator
var nilOptional: String? = nil
let notNilText: String = nilOptional ?? "Default Value"
print(notNilText)

// Optional Structs & Optional Chaining
struct OptionalStruct {
    var prop = 123
    func method() {
        print("I am struct method")
    }
}

let optionalStruct: OptionalStruct?
optionalStruct = OptionalStruct()

print(optionalStruct?.prop)
optionalStruct?.method()
