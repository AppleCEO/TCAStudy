//
//  CounterDominic.swift
//  TCAStudy
//
//  Created by joon-ho kil on 2022/11/14.
//

import SwiftUI
import ComposableArchitecture

struct DominicCounterView: View {
    let counter: StoreOf<DominicCounter>
    
    var body: some View {
        WithViewStore(self.counter, observe: { $0 }) { viewStore in
            HStack {
                Button("−") { viewStore.send(.decrementButtonTapped) }
                Text("\(viewStore.count)")
                Button("+") { viewStore.send(.incrementButtonTapped) }
            }
        }
    }
}


struct DominicCounter: ReducerProtocol {
    struct State: Equatable {
        var count = 0
    }
        
    enum Action: Equatable {
        case decrementButtonTapped
        case incrementButtonTapped
    }
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
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
    


struct CounterDominic_Previews: PreviewProvider {
    static var previews: some View {
        DominicCounterView(counter: Store(initialState: DominicCounter.State(), reducer: DominicCounter()
            )
        )
    }
}
