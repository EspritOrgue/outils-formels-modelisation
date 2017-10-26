import PetriKit

public class MarkingGraph {

    public let marking   : PTMarking
    public var successors: [PTTransition: MarkingGraph]

    public init(marking: PTMarking, successors: [PTTransition: MarkingGraph] = [:]) {
        self.marking    = marking
        self.successors = successors
    }
    /* Permet de compter le nombre d'état dans un graphe de marquage à partir d'un noeud */
    public func countMark(input:MarkingGraph) -> Int{
      var visitedNode: [MarkingGraph] = []
      var nodeToVisit: [MarkingGraph] = [input]
      var stateList: [MarkingGraph] = []

      while let current = nodeToVisit.popLast(){
        visitedNode.append(current)
        for (_, successor) in current.successors{
          if !visitedNode.contains(where: {$0 === successor}) && !nodeToVisit.contains(where: {$0 === successor}){
            nodeToVisit.append(successor)
          }
        }
      }
      for s in visitedNode {
        if(!stateList.contains(where: {$0.marking == s.marking})){
          stateList.append(s)
        }
      }
      return stateList.count
    }
    /* Permet de savoir si il y a deux smokers dans le graphe */
    public func isTwoSmokers(input:MarkingGraph) -> Bool{
      var visitedNode: [MarkingGraph] = []
      var nodeToVisit: [MarkingGraph] = [input]

      while let current = nodeToVisit.popLast(){
        visitedNode.append(current)
        for (place, token) in current.marking{
          var nbSmoke = 0;
          for (place, token) in current.marking {
            if (place.name == "s1" || place.name == "s2" || place.name == "s3"){
              nbSmoke += Int(token)
            }
          }
          if (nbSmoke > 1) {
            return true
          }
        }
        for (_, successor) in current.successors{
          if !visitedNode.contains(where: {$0 === successor}) && !nodeToVisit.contains(where: {$0 === successor}){
            nodeToVisit.append(successor)
          }
        }
      }
      return false
    }
    /* Permet de savoir si deux ingrédients sont sur la table */
    public func isTwoIng(input:MarkingGraph) -> Bool{
      var visitedNode: [MarkingGraph] = []
      var nodeToVisit: [MarkingGraph] = [input]

      while let current = nodeToVisit.popLast(){
        visitedNode.append(current)
        for (place, token) in current.marking{
          if place.name == "p" || place.name == "m" || place.name == "t"{
            if(token > 1){
                 return true
            }
          }
        }
        for (_, successor) in current.successors{
          if !visitedNode.contains(where: {$0 === successor}) && !nodeToVisit.contains(where: {$0 === successor}){
            nodeToVisit.append(successor)
          }
        }
      }
      return false
    }

}

public extension PTNet {
  public func markingGraph(from marking: PTMarking) -> MarkingGraph? {
      // Write here the implementation of the marking graph generation.
      // Initialiser les valeurs
      let m0 = MarkingGraph(marking: marking)
      var nodeToVisit : [MarkingGraph] = [m0]
      var visitedNode : [MarkingGraph] = []
      // Boucler la liste à visiter
      while(!nodeToVisit.isEmpty) {
          let cur = nodeToVisit.remove(at:0)
          visitedNode.append(cur)
          // Boucle les transitions
          for tran in transitions {
              if let firedMark = tran.fire(from: cur.marking) {
                      if let alreadyVisitedNode = visitedNode.first(where: { $0.marking == firedMark }) {
                          cur.successors[tran] = alreadyVisitedNode
                      } else {
                          let temp = MarkingGraph(marking: firedMark)
                          cur.successors[tran] = temp
                          if (!nodeToVisit.contains(where: { $0.marking == temp.marking})) {
                              nodeToVisit.append(temp)
                          }
                  }
              }
          }
      }
      return m0
  }
}
