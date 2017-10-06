import PetriKit
print("Hello, world!")

let p0 = PTPlace(named: "p0")
let p1 = PTPlace(named: "p1")

let t0 = PTTransition(
    named         : "t0",
    preconditions : [PTArc(place: p0)],
    postconditions: [PTArc(place: p1)])
let t1 = PTTransition(
    named         : "t1",
    preconditions : [PTArc(place: p1)],
    postconditions: [PTArc(place: p0)])

let pn = PTNet(places: [p0, p1], transitions: [t0, t1])
