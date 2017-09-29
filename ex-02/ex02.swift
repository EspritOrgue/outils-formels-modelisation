enum State{ // Ensemble
  case q0, q1, q2, q3
}

struct Automaton {
    /*var states: Set<State> {get}
    var initialState: State {get}
    var finalStates: Set<State> {get}*/
  let states: Set<State> = [.q0, .q1, .q2, .q3]
    let initialState: State = .q0
  let finalStates: Set<State> = [.q2, .q3]
    func 𝛿(state: State, char: Character) -> State{
      switch(state, char){
      case (.q0, "c"):
          return .q1
        case (.q1, "c"):
          return .q0
        case (.q0, "a"):
          return .q2
        case (.q1, "a"):
          return .q3
        default:
          fatalError("Nothing happens!")
      }
    }
}

let a = Automaton()
