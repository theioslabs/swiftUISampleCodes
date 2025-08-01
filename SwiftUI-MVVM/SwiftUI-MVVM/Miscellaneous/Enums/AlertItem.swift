//
//  AlertItem.swift
//  SwiftUI-MVVM
//
//  Created by Khushal on 7/30/25.
//

import SwiftUI

struct AlertItem {
    var title: String
    var message: String
}

enum AlertContext {
    //MARK: - Network Errors
    static let invalidURL = AlertItem(title: "Server Error",
                                      message: "There is an error trying to reach the server. If this persists, please contact support.")
    
    static let unableToComplete = AlertItem(title: "Server Error",
                                            message: "Unable to complete your request at this time. Please check your internet connection.")
    
    static let invalidResponse = AlertItem(title: "Server Error",
                                           message: "Invalid response from the server. Please try again or contact support.")
    
    static let invalidData = AlertItem(title: "Server Error",
                                       message: "The data received from the server was invalid. Please try again or contact support.")
}
