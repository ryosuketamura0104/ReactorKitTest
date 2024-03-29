//
//  CounterViewReactor.swift
//  Counter
//
//  Created by Suyeol Jeon on 07/09/2017.
//  Copyright © 2017 Suyeol Jeon. All rights reserved.
//

import ReactorKit
import RxSwift

final class CounterViewReactor: Reactor {
   
    let initialState: CounterState
    
    enum CounterAction {
        case increase
        case decrease
        case goNextView
    }
    
    enum CounterMutation {
        case increaseValue
        case decreaseValue
        case goNextView
    }
    
    struct CounterState {
      var value: Int
      var isLoading: Bool
    }

    init() {
        self.initialState = CounterState(
            value: 0, // start from 0
            isLoading: false
        )
    }
}

extension CounterViewReactor{
    // Action -> Mutation
    func mutate(action: CounterAction) -> Observable<CounterMutation> {
        switch action {
        case .increase:
            return Observable.just(Mutation.increaseValue)

        case .decrease:
            return Observable.just(Mutation.decreaseValue)
        case .goNextView:
            return Observable.just(Mutation.goNextView)
        }
        
    }
}

extension CounterViewReactor{
    // Mutation -> State
    func reduce(state: CounterState, mutation: CounterMutation) -> CounterState {
        var state = state
        switch mutation {
            case .increaseValue:
                state.value += 1
            case .decreaseValue:
                state.value -= 1
            case .goNextView:
                break
        }
        return state
    }
}
