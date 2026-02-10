//
//  AppView.swift
//  TCACounterSwiftUI
//
//  Created by 도미닉 on 2/9/26.
//

import ComposableArchitecture
import SwiftUI

struct AppView: View {
    let store: StoreOf<AppFeature>
    
    var body: some View {
        Form {
            HStack {
                Text("Counter 1")
                Spacer()
                CounterView(store: store.scope(state: \.counter1, action: \.counter1))
            }
            
            HStack {
                Text("Counter 2")
                Spacer()
                CounterView(store: store.scope(state: \.counter2, action: \.counter2))
            }
        }
        .buttonStyle(.borderless)
        .navigationTitle("Two Counters Demo")
    }
}

#Preview {
    AppView(store: TCACounterSwiftUIApp.appStore)
}
