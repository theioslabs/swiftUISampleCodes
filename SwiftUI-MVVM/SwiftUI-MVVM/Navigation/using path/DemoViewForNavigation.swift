//
//  DemoViewForNavigation.swift
//  SwiftUI-MVVM
//
//  Created by Khushal on 8/2/25.
//


import SwiftUI

struct DemoViewForNavigation: View {
    @State private var path: [String] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 20) {
                Button("Go to Profile") {
                    // append - push child controller
                    path.append("Profile")
                    // after appending - callback goes to navigationDestination
                    // if things are configured properly for that specific data type or value then it navigates else not
                }
                
                Button("Go to Settings") {
                    path.append("Settings")
                }
            }
            .navigationDestination(for: String.self) { value in
                // Detail Screen - Second Screen - code
                Text("Screen: \(value)")
            }
            .navigationDestination(for: Int.self) { value in
                // Detail Screen - Second Screen - code
                Text("Screen: \(value)")
            }
        }
        .onAppear() {
            print("onAppear called")
        }
    }
}

#Preview {
    DemoViewForNavigation()
}
