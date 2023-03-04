import Foundation

protocol CheckProtocol {
    var mod: Int { get set }
    func check(value: Int) -> Bool
    func action()
}

struct CheckFizz: CheckProtocol {
    var mod: Int
    func check(value: Int) -> Bool {
        if (value % mod ) == 0 {
            return true
        }
        return false
    }
    func action() {
        print("Fizz", terminator: "")
    }
}

struct CheckFuzz: CheckProtocol {
    var mod: Int
    func check(value: Int) -> Bool {
        if (value % mod) == 0 {
            return true
        }
        return false
    }
    func action() {
        print("Fuzz", terminator: "")
    }
}

let checkFizz = CheckFizz(mod: 3)
let checkFuzz = CheckFuzz(mod: 5)
var array: [CheckProtocol] = []
array.append(checkFizz)
array.append(checkFuzz)

for value in 1...20 {
    var isFizzFuzz = false
    for check in a {
        if check.check(value: value) {
            check.action()
            isFizzFuzz = true
        }
    }
    if !isFizzFuzz {
        print("\(value)")
    } else {
        print()
    }
}
