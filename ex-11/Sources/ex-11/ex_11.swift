extension Sequence{
    func forall(_ predicate:(Self.Element) -> Bool) -> Bool{
      for e in self{
        guard predicate(e) else { return false }
      }
      return true
    }
}
print([1,2,3,4,5].forall{$0 < 6})

enum People {
case alice, bernard, cynthia
}

let people: Set<People> = [.alice, .bernard, .cynthia]

func isWoman(people: People) -> Bool{
  switch people{
  case .alice: return true
  case .cynthia: return true
  default: return false
  }
}

func isAssitant(people: People) -> Bool{
  switch people{
  case .alice: return true
  case .cynthia: return true
  case .bernard: return true
  default: return false
  }
}

enum People {
case alice, bernard, cynthia
}
// Exemple
/*
let people: Set<People> = [.alice, .bernard, .cynthia]
let thereAreWoman = people.contains(where: {isWomanName(people: $0)})
let thereAreOnlyWomen = people.filter(isWomanName).count == people.count
*/
// Exercice 1.1
do{
  print(people.contains(where:{isAssistant(people: $0) && !isWoman(people: $0)}))
}
