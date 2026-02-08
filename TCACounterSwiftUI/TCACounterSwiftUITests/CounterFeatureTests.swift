//
//  CounterFeatureTests.swift
//  TCACounterSwiftUI
//
//  Created by 도미닉 on 2/8/26.
//

import Testing
import ComposableArchitecture

@MainActor
struct CounterFeatureTests {
    @Test
    func basics() async {
        let store = TestStore(initialState: CounterFeature.State()) {
            CounterFeature()
        }
        
        await store.send(.incrementButtonTapped) {
            $0.count = 1
        }
        await store.send(.decrementButtonTapped) {
            $0.count = 0
        }
    }
}
