//
//  AppetizerListViewModel.swift
//  SwiftUI-MVVM
//
//  Created by Khushal on 7/30/25.
//

import Foundation

final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var isLoading = false
    @Published var isShowingAlert = false
    @Published var alertItem: AlertItem? {
        didSet { isShowingAlert = true }
    }

    func getAppetizers() {
        isLoading = true
        
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async { [self] in
                isLoading = false
                
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                    
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                        
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                        
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
