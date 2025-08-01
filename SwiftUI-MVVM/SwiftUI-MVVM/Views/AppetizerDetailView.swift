//
//  AppetizerDetailView.swift
//  SwiftUI-MVVM
//
//  Created by Khushal on 7/30/25.
//


import SwiftUI

struct AppetizerDetailView: View {
    let appetizer: Appetizer

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fill)
                .frame(width: 240, height: 210)
                .cornerRadius(16)
            
            Text(appetizer.name)
                .font(.largeTitle)
                .bold()

            Text(appetizer.description)
                .font(.body)

            Spacer()
        }
        .padding()
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer)
}