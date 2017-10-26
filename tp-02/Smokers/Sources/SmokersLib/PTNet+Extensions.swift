import PetriKit

public class MarkingGraph {

    public let marking   : PTMarking
    public var successors: [PTTransition: MarkingGraph]

    public init(marking: PTMarking, successors: [PTTransition: MarkingGraph] = [:]) {
        self.marking    = marking
        self.successors = successors
    }

}

public extension PTNet {

    public func markingGraph(from marking: PTMarking) -> MarkingGraph? {
        let m0:MarkingGraph = MarkingGraph(marking: marking)
        var visitedNode:[MarkingGraph] = [m0]
        var nodeToVisit:[MarkingGraph] = [m0]
        while let curr = nodeToVisit.popLast(){
          visitedNode.append(curr)
          for tran in transitions{
            if let firedTran = tran.fire(from: curr.marking){
              if let visited = visitedNode.first(where: {$0.marking == firedTran}){
                curr.successors[tran] = visited
              } else{
                let temp:MarkingGraph = MarkingGraph(marking: firedTran)
                if !visitedNode.contains{$0 === temp}{
                  curr.successors[tran] = temp
                  nodeToVisit.append(temp)
                }
              }
            }
          }
        }
        print("\(visitedNode)")
        return m0
    }

}
