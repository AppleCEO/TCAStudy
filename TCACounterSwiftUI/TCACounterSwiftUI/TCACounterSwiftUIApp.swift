//
//  TCACounterSwiftUIApp.swift
//  TCACounterSwiftUI
//
//  Created by 도미닉 on 2/8/26.
//

import ComposableArchitecture
import SwiftUI

@main
struct TCACounterSwiftUIApp: App {
    static let store = Store(initialState: CounterFeature.State()) {
        CounterFeature()
            ._printChanges()
    }
    
    var body: some Scene {
        WindowGroup {
            CounterView(store: TCACounterSwiftUIApp.store)
        }
    }
}
