//
//  LoadingView.swift
//  SwiftUI-MVVM
//
//  Created by Khushal on 7/30/25.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea()
            
            ProgressView()
                .progressViewStyle(.circular)
                .tint(.gray)
                .scaleEffect(2)
        }
    }
}

#Preview {
    LoadingView()
}
