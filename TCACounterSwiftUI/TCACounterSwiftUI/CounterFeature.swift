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
        var fact: String?
        var isLoading = false
    }
    
    enum Action: Equatable {
        case decrementButtonTapped
        case factButtonTapped
        case factResponse(String)
        case incrementButtonTapped
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .decrementButtonTapped:
            state.count -= 1
            return .none
            
        case .factButtonTapped:
            state.fact = nil
            state.isLoading = true
            
            state.fact = String(decoding: data, as: UTF8.self)
            state.isLoading = false
            
            return .run { [count = state.count] send in
                let (data, _) = try await URLSession.shared
                    .data(from: URL(string: "http://numbersapi.com/\(count)")!)
                let fact = String(decoding: data, as: UTF8.self)
                state.fact = fact
            }
            
        case let .factResponse(fact):
            state.fact = fact
            state.isLoading = false
            return .none
            
        case .incrementButtonTapped:
            state.count += 1
            return .none
        }
    }
}

