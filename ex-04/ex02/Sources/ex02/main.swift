import PetriKit

typealias PTMarking = String

class MarkingGraph: CustomStringConvertible{
  let marking   : PTMarking
  var successors: [MarkingGraph]

  init (marking: PTMarking, successors: [MarkingGraph]){
    self.marking    = marking
    self.successors = successors
  }
  var description: String{
    return String(describing: self.marking)
  }
}
/*
let p1    = PTPlace(named: "p1")
let p2    = PTPlace(named: "p2")
let p3    = PTPlace(named: "p3")
let q1    = PTPlace(named: "q1")
let q2    = PTPlace(named: "q2")
let q3    = PTPlace(named: "q3")
let f1    = PTPlace(named: "f1")
let f2    = PTPlace(named: "f2")
let f3    = PTPlace(named: "f3")

let m0 : PTMarking  = [p1: 1, p2 : 1, p3 : 1, f1 : 1, f2 : 1, f3: 1]
let m1 : PTMarking  = [q1: 1, p2 : 1, p3 : 1, f3 : 1]
let m2 : PTMarking  = [p1: 1, q2 : 1, p3 : 1, f1 : 1]
let m3 : PTMarking  = [p1: 1, p2 : 1, q3 : 1, f2 : 1]

let n1 = MarkingGraph(marking: m0, successors: [])
let n2 = MarkingGraph(marking: m1, successors: [])
let n3 = MarkingGraph(marking: m2, successors: [])
let n4 = MarkingGraph(marking: m3, successors: [])

n1.successors = [n1, n2, n3]
n2.successors = [n1]
n3.successors = [n1]
n4.successors = [n1]
*/
let n1 = MarkingGraph(marking: ["p1", "p2", "p3", "f1", "f2", "f3"], successors: [])
let n2 = MarkingGraph(marking: ["q1", "p2", "p3", "f3"], successors: [n1])
let n3 = MarkingGraph(marking: ["p1", "q2", "p3", "f1"], successors: [n1])
let n4 = MarkingGraph(marking: ["p1", "p2", "q3", "f2"], successors: [n1])

n1.successors = [n1, n2, n3]
