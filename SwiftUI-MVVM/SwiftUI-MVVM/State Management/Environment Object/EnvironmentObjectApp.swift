//
//  EnvironmentObjectApp.swift
//  SwiftUI-MVVM
//
//  Created by Khushal on 8/1/25.
//

import SwiftUI

// similar to your UIKit - UIWindow - root - key controller
struct EnvironmentObjectApp: App {
    @StateObject private var store = ArticleStore()

    var body: some Scene {
        WindowGroup {
            ArticleListView()
                .environmentObject(store) // Injecting the store
        }
    }
}
