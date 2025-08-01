//
//  AppetizerListView.swift
//  SwiftUI-MVVM
//
//  Created by Khushal on 7/30/25.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject private var viewModel = AppetizerListViewModel()
        
    var body: some View {
        ZStack {
            NavigationStack {
                List(viewModel.appetizers, id: \.id) { appetizer in
                    NavigationLink(destination: AppetizerDetailView(appetizer: appetizer)) {
                        AppetizerCell(appetizer: appetizer)
                    }
                    
                }
                .navigationTitle("🍟 Appetizers")
            }
            .task { viewModel.getAppetizers() }

            if viewModel.isLoading { LoadingView() }
        }
        .alert(viewModel.alertItem?.title ?? "", isPresented: $viewModel.isShowingAlert) {
            // You can add a button to your alert here
        } message: {
            Text(viewModel.alertItem?.message ?? "")
        }
    }
}

#Preview {
    AppetizerListView()
}
