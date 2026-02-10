//
//  AppFeature.swift
//  TCACounterSwiftUI
//
//  Created by 도미닉 on 2/10/26.
//

import ComposableArchitecture

struct AppFeature: Reducer {
    struct State: Equatable {
        var counter1 = CounterFeature.State()
        var counter2 = CounterFeature.State()
    }
    
    @CasePathable
    enum Action: Equatable {
        case counter1(CounterFeature.Action)
        case counter2(CounterFeature.Action)
    }
    
    var body: some Reducer<State, Action> {
        Scope(state: \.counter1, action: \.counter1) {
            CounterFeature()
        }
        Scope(state: \.counter2, action: \.counter2) {
            CounterFeature()
        }
    }
}
