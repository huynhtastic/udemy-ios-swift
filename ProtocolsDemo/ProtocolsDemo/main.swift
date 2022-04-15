protocol CanFly {
    func fly()
}

class Bird {
    var isFemale = true
    
    func layEgg() {
        if isFemale {
            print("Make new bird")
        }
    }
}

class Eagle: Bird, CanFly {
    func fly() {
        print("The eagle flies")
    }
    
    func soar() {
        print("Glide through air current")
    }
}

class Penguin: Bird {
    func swim() {
        print("Swims through water")
    }
}

struct FlyingMuseum {
    func flyingDemo(flyingObject: CanFly) {
        flyingObject.fly()
    }
}

struct Airplane: CanFly {
    func fly() {
        print("The plane uses its engine to fly")
    }
}

let myEagle = Eagle()

let museum = FlyingMuseum()
museum.flyingDemo(flyingObject: myEagle)
