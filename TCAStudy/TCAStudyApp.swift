//
//  TCAStudyApp.swift
//  TCAStudy
//
//  Created by joon-ho kil on 2022/11/07.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCAStudyApp: App {
    var body: some Scene {
        WindowGroup {
          FeatureView(
            store: Store(
              initialState: Feature.State(),
              reducer: Feature()
            )
          )
        }
    }
}
