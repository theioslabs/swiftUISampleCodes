//
//  ListsInSwiftUIApp.swift
//  SwiftUI-MVVM
//
//  Created by Khushal on 8/2/25.
//

import SwiftUI

@main
struct ListsInSwiftUIApp: App {
    @Environment(\.scenePhase) private var scenePhase
    var body: some Scene {
        WindowGroup {
            FruitListView()
        }
        .onChange(of: scenePhase, { newPhase, oldPhase in
            switch newPhase {
                case .active:
                    print("App became active from \(oldPhase)")
                        // Resume tasks or refresh UI
                case .inactive:
                    print("App is inactive from \(oldPhase)")
                        // App is temporarily inactive (e.g., incoming call)
                case .background:
                    print("App moved to background from \(oldPhase)")
                        // Save data, release resources
                @unknown default:
                    break
            }
        })
    }
}
