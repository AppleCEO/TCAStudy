//
//  CounterFeature.swift
//  TCACounterSwiftUI
//
//  Created by 도미닉 on 2/8/26.
//

import ComposableArchitecture
import Foundation

struct CounterFeature: Reducer {
    @ObservableState
    struct State: Equatable {
        var count = 0
    }
    
    enum Action: Equatable {
        case decrementButtonTapped
        case incrementButtonTapped
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .decrementButtonTapped:
            state.count -= 1
            return .none
            
        case .incrementButtonTapped:
            state.count += 1
            return .none
        }
    }
}

