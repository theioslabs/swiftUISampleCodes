//
//  APIError.swift
//  SwiftUI-MVVM
//
//  Created by Khushal on 7/30/25.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
}
