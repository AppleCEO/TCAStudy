//
//  DominicAlertView.swift
//  TCAStudy
//
//  Created by joon-ho kil on 2022/11/21.
//

import SwiftUI
import ComposableArchitecture

struct DominicAlertView: View {
    let store: StoreOf<DominicAlert>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            Button("Delayed Alert") { viewStore.send(.alertButtonTapped) }
                .alert(self.store.scope(state: \.alert), dismiss: .alertDismissed)
        }
    }
}

struct DominicAlertView_Previews: PreviewProvider {
    static var previews: some View {
        DominicAlertView(store: Store(initialState: DominicAlert.State(), reducer: DominicAlert()))
    }
}

struct DominicAlert: ReducerProtocol {
    struct State: Equatable {
        var alert: AlertState<Action>?
    }
        
    enum Action: Equatable {
        case alertButtonTapped
        case alertDismissed
    }
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .alertDismissed:
            state.alert = nil
            return .none
            
        case .alertButtonTapped:
            state.alert = AlertState(
              title: TextState(
                "Show Alert"))
            return .none
        }
    }
}
