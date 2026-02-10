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
    static let store1 = Store(initialState: CounterFeature.State()) {
        CounterFeature()
            ._printChanges()
    }
    static let appStore = Store(initialState: AppFeature.State()) {
        AppFeature()
    }
    
    var body: some Scene {
        WindowGroup {
            AppView(store: TCACounterSwiftUIApp.appStore)
        }
    }
}
